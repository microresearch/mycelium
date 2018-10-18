// license:GPL-2.0+
// copyright-holders: Martin Howse

// loop and replay sd card values
// writes every second a value (2 bytes)

// but sd card cannot be read in such a fast interrupt so we buffer, but we don't have enough memory

//////////////////////////////////////////////////////////////////////////

// FET switch-X
// HIH-X
// basic tones-X
// SD card raw read and write-X
// ADCs: ADC0 is marked ADC_LIGHT
// MAX31865-X, 555 interrupt on INT0-X

// write to SD/ read back in loop: 1 day with 1sec delay = 24hrx60minx60sec=86400 values - playback rates...
//2000000000; 2e9 2gb - 23k days

//////////////////////////////////////////////////////////////////////////

// define sensors: 
//#define FIVEFIVE 1
//#define HIH 1
//#define MAX 1
//#define C02 1
//#define AD620 1 // can be from earthboot or from mushroom
#define ADC 1 // which ones? - just to test SD in this case
//#define AD5933 1 // or we seperate that out in other file as code is quite long

// define audio mode:

// define FET mode: ?? not really needed

// define SDCARD:
#define SDCARD 1

//#define F_CPU 16000000UL 

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <avr/pgmspace.h>
#include <inttypes.h>

#include "sd_raw.h"
#include "sd_raw_config.h"
#include "partition.h"
#include "i2c_master.h"

#include "MAX31865.h"


const uint32_t SIZEY=2000000000; // 2 GB say


#define RREF      430.0
#define RNOMINAL  100.0

#define hih6131w  0x4E  //write mode - 0x27 <<1
#define hih6131r  0x4F  //read mode

#ifdef UDR0
#define UBRRH UBRR0H
#define UBRRL UBRR0L
#define UDR UDR0

#define UCSRA UCSR0A
#define UDRE UDRE0
#define RXC RXC0

#define UCSRB UCSR0B
#define RXEN RXEN0
#define TXEN TXEN0
#define RXCIE RXCIE0

#define UCSRC UCSR0C
#define URSEL 
#define UCSZ0 UCSZ00
#define UCSZ1 UCSZ01
#define UCSRC_SELECT 0
#else
#define UCSRC_SELECT (1 << URSEL)
#endif

//#include "waves.h"

#define BV(bit) (1<<(bit)) // Byte Value => converts bit into a byte value. One at bit location.
#define cbi(reg, bit) reg &= ~(BV(bit)) // Clears the corresponding bit in register reg
#define sbi(reg, bit) reg |= (BV(bit))              // Sets the corresponding bit in register reg


#define FS 16000 // sample rate

uint8_t synthPeriod, sample, rate, counter, synthEnergy=128, value=128;

#define UART_BAUD_CALC(UART_BAUD_RATE,F_OSC) ((F_OSC)/((UART_BAUD_RATE)*16l)-1)

//////////////////////////////////////////////////////////////////////////
#define BUFSIZE 256
char *pIn, *pOut, *pEnd, *wIn, *wOut, wEnd;
uint8_t buf[256]; // our ring buffer - replace later with sd card stuff
//uint8_t wbuf[512]; // writing buffer
volatile uint32_t chunkcount, writecount, oldchunk=255;
volatile uint8_t doit=0;

uint8_t safe=1;

void buf_init()
{
  pIn = pOut = buf;       // init to any slot in buffer
  pEnd = &buf[BUFSIZE];   // past last valid slot in buffer

  chunkcount=0;
  writecount=0;

}


inline void buf_put(char c) // not called in interrupt so we can take time
{
  sd_raw_write(writecount++, &c, 1);
  if (writecount > SIZEY)  writecount=0;
}

inline void buf_get(char *pc)
{
   *pc = *pOut++;              // pick up next char to be returned
   if (pOut >= pEnd){       // end of circular buffer?
        pOut = buf;         // wrap around
	//	memcpy(buf,wbuf,512);
	doit=1; // fill wbuf from sd card in main but we need to lose delay there
   }
}

//////////////////////////////////////////////////////////////////////////

PROGMEM const unsigned char sinetable[256]  = {
  0,0,0,1,1,1,2,2,3,4,5,5,6,7,9,10,11,12,14,15,16,18,20,21,23,25,27,29,31,
  33,35,37,39,42,44,46,49,51,54,56,59,62,64,67,70,73,76,78,81,84,87,90,93,96,99,102,105,108,111,115,118,121,124,127,130,133,136,139,143,146,149,152,155,158,161,164,167,170,173,176,178,181,184,187,190,192,195,198,200,203,205,208,210,212,215,217,219,221,223,225,227,229,231,233,234,236,238,239,240,
  242,243,244,245,247,248,249,249,250,251,252,252,253,253,253,254,254,254,254,254,254,254,253,253,253,252,252,251,250,249,249,248,247,245,244,243,242,240,239,238,236,234,233,231,229,227,225,223,
  221,219,217,215,212,210,208,205,203,200,198,195,192,190,187,184,181,178,176,173,170,167,164,161,158,155,152,149,146,143,139,136,133,130,127,124,121,118,115,111,108,105,102,99,96,93,90,87,84,81,78,
  76,73,70,67,64,62,59,56,54,51,49,46,44,42,39,37,35,33,31,29,27,25,23,21,20,18,16,15,14,12,11,10,9,7,6,5,5,4,3,2,2,1,1,1,0,0,0,0
};

volatile unsigned char accu = 0, bits=8, shifter=0;
volatile unsigned char sinetablePointer = 0;
volatile unsigned char baud = 0; //(62.5khz / 1200bps = 52)

volatile unsigned char newbyte=33;

// Timer 2 COMPARE
ISR(TIMER2_OVF_vect){
volatile static unsigned char bit, byte;
  // set the pwm duty using a sinetable
  OCR2B=pgm_read_byte_near(sinetable + sinetablePointer);
  sinetablePointer = sinetablePointer + accu;
  
  baud--;
  if(baud == 0){
    // this is where we process the bits so a 1 is accu=x and a 0 is....
    bit=(byte>>shifter++)&0x01;
    if (shifter==8) {
      //      byte=rand()%255;       // get a new byte from ring buffer
      buf_get(&byte);
      //      byte=newbyte++;
      shifter=0;
    }
	 //I learned that either 2200Hz or 1200Hz tones represent a
	 //binary one while the tone remains unchanged, switching from
	 //one tone to the other denotes a binary zero.

    // https://chapmanworld.com/2015/04/07/arduino-uno-and-fast-pwm-for-afsk1200/
    if (bit==0){	 
    if(accu == 5  ){
     accu = 9;
    }else{
     accu = 5;
    }
  }
    baud = 52;
  }  

}

//////////////////////////////////////////////////////////////////////////

void delay(int ms){
	while(ms){
		_delay_ms(0.96);
		ms--;
	}
}

uint32_t fiver=0;

#ifdef FIVEFIVE
ISR (INT0_vect) // this is 555 interrupt counter
{
  fiver++;
}
#endif

void serial_init(int baudrate){
  UBRRH = (uint8_t)(UART_BAUD_CALC(baudrate,F_CPU)>>8);
  UBRRL = (uint8_t)UART_BAUD_CALC(baudrate,F_CPU); /* set baud rate */
  UCSRB = (1<<RXEN) | (1<<TXEN); /* enable receiver and transmitter */
  UCSRC |=(3<<UCSZ0);   /* asynchronous 8N1 */
}

static int uart_putchar(char c, FILE *stream);

static FILE mystdout = FDEV_SETUP_STREAM(uart_putchar, NULL,_FDEV_SETUP_WRITE);

static int uart_putchar(char c, FILE *stream)
{
  loop_until_bit_is_set(UCSRA, UDRE);
  UDR = c;
  return 0;
  }

/*void PutStrNl (char *data, bool newLine)
{
    while (*data) PutChr(*data++);
    if (newLine)
    {
        PutChr('\r');    // optional
        PutChr('\n');
    }
    }*/

void adc_init(void)
{
  	cbi(ADMUX, REFS1); 
	sbi(ADMUX, REFS0); // AVCC
	//	sbi(ADMUX, ADLAR); //8 bits
	sbi(ADCSRA, ADPS2);
	//	sbi(ADCSRA, ADPS1); // change speed here! now div by 64
	//	sbi(ADCSRA, ADPS0); // change speed here!

	sbi(ADCSRA, ADEN);
	DDRC = 0x00;
	PORTC = 0x00;
	// settle on 10 bits
}

void init_all() {

  // pins: OC2B is PWM OUT (PD3), INT0 (PD2) is 555 counter IN
// PC0,1,2,3: ADC0+ = adc_light, adc_mushroom, spare_adc, adc_co2
// PB0 is RF ENABLE=OUT 

// PB1 is temp_cs and rest of temp as usual setup MAX31865 (port library)
  
  DDRD=0x08;  // PD3 (TX?)
  DDRB|=0x01; // PB0 and for SD card  


  serial_init(9600);

  //  PORTB=0x01; // set up to allow RF OUT...
  
  // Timer 2 set up as a 62500Hz PWM.
  TCCR2A = _BV(COM2A1) |_BV(COM2B1) | _BV(WGM21) | _BV(WGM20);
  //  TCCR2A = _BV(COM2B1) | _BV(WGM21) | _BV(WGM20);
  TCCR2B = _BV(CS20);
  TIMSK2 = 0;
			
  // Timer 1 set up as a 16000Hz sample interrupt
  /*  TCCR1A = 0;
  TCCR1B = _BV(WGM12) | _BV(CS10);
  TCNT1 = 0;
  OCR1A = F_CPU / FS;
  TIMSK1 = _BV(OCIE1A);  
  synthPeriod=0x80; 
  */
  TIMSK2 |= (1 << TOIE2); // Enable interrupt on Timer 2 Output Compare
  sei();
  
    stdout = &mystdout;
    adc_init(); 
  //  printf("TESTING1 9600\r\n");

  // how do we set up HIH sensor?
#ifdef HIH
    i2c_init();
#endif

#ifdef MAX   // for MAX31865
  MAX31865_init(MAX31865_2WIRE);
#endif
  
  // 555 is on INT0 - set up here - we don't need pullup as we have on board...
#ifdef FIVEFIVE
  EICRA |= (1 << ISC01);    // on rising edge
  EIMSK |= (1 << INT0);     // Turns on INT0
#endif
  
    sei(); // always set
    buf_init();
}

unsigned char adcread(unsigned char channel){
  unsigned char result, high;
  ADMUX &= 0xF8; // clear existing channel selection                
  ADMUX |=(channel & 0x07); // set channel/pin
  ADCSRA |= (1 << ADSC);  // Start A2D Conversions 
  loop_until_bit_is_set(ADCSRA, ADIF); /* Wait for ADIF, will happen soon */
  result=ADCH;
  return result;
}

unsigned int adcread10(short channel){
  unsigned int ADresult;
  ADMUX &= 0xF8; // clear existing channel selection                
    ADMUX |=(channel & 0x07); // set channel/pin
  ADCSRA |= (1 << ADSC);  // Start A2D Conversions 
  loop_until_bit_is_set(ADCSRA, ADIF); /* Wait for ADIF, will happen soon */
  ADresult = ADCL;
  ADresult |= ((int)ADCH) << 8;
  return(ADresult);
}

unsigned char humN;
unsigned char tempN;

void THSense(void) {
unsigned char humL;
unsigned char humH;
unsigned short hum;
unsigned char tempL;
unsigned char tempH;
unsigned short temp;

 i2c_start(hih6131w);               // measurement request
  i2c_stop();                             // set stop condition = release bus
  _delay_ms(200);

  i2c_start(hih6131r);               // set device address and read mode

  humH = i2c_read_ack();                   // read one byte from EEPRO M
  humL = i2c_read_ack();
  tempH = i2c_read_ack();
  tempL = i2c_read_nack();
  i2c_stop();

  hum = (humH << 8) + humL;
  temp = (tempH << 8) + tempL;
  hum = (hum << 2);
  hum = (hum >> 2);
  temp = (temp >> 2);
  humN = (hum/16382.0) * 100;
  tempN = ((temp/16382.0) * 165) - 40;

}

unsigned char rx_buffer[8]; // for sd-card

void main() {
  uint32_t offset=0;
  unsigned char readbuffer,writebuffer;
  float tempy;
  uint16_t lastvalue, difference, temper;
  uint32_t cc=0;
  
  init_all();

#ifdef SDCARD
    while(1){    // outer loop for SD-cardery
      cli();
      if(!sd_raw_init())
      {
	//	printf("NO raw");
	continue;
      }

    struct partition_struct* partition = partition_open(sd_raw_read,
							sd_raw_read_interval,
							sd_raw_write,
							sd_raw_write_interval,
							0
							);

    if(!partition)
      {
	partition = partition_open(sd_raw_read,
				   sd_raw_read_interval,
				   sd_raw_write,
				   sd_raw_write_interval,
				   -1
				   );
	if(!partition)
	  {
	    //	printf("NO part");
	    continue;          
	  }
      }
    sei();
    printf("OPENED");
#endif

    //    sbi(PORTB,0); // !ON! = transmit ON
    
  while(1){
    // turn on and off FET for xx second PB0 
    //    cbi(PORTB,0);
    //    _delay_ms(1000);
    sbi(PORTB,0); 
    //    _delay_ms(1); //!!!!        
    

    //    _delay_ms(1);        

    
#ifdef HIH    // tests for HIH
    THSense();
    value=humN;
    synthEnergy=value*5;
    printf("TEMP: %d HUM: %d\r\n", tempN, humN);
#endif

#ifdef C02 // sensor on 6 down middle jumper, ADC3
      int sensorValue = adcread10(3);
      float voltage = sensorValue*(5000/1024.0); 
      int voltage_diference=voltage-400;
      //      float concentration=voltage_diference*50.0/16.0;
      // test with level of white noise
      
      int vvalue=abs(voltage_diference); // difference as best 0-60 odd...
      difference=abs(lastvalue-vvalue);
      lastvalue=vvalue;
      if (difference>255) synthEnergy=255;
      else      synthEnergy=difference;
      // test this with serial
      //      synthEnergy++;
      printf("CO2 val: %d lastvalue: %d difference: %d\r\n", vvalue, lastvalue, difference);
       _delay_ms(1000);
#endif
      
    
#ifdef FIVEFIVE // test the 555 - working it seems
      _delay_ms(1000);
    uint32_t fivee=fiver;
    printf("555 count: %d\r\n", fivee);
    fiver=0; // zero the 555
#endif
    

#ifdef MAX	
	// test for MAX31865:
	//    Serial.print("Temperature = "); Serial.println(max.temperature(RNOMINAL, RREF));
    	tempy=temperature(RNOMINAL, RREF); // this works as long as sd card is in place
    	temper=(int)(tempy*100.0);
	printf("MAX temp %d\r\n", temper);
    	value=(int)(temper/100);
	// put 2 bytes (low and high) into ring buffer and shift out
	buf_put(temper&0xff);
	buf_put((temper>>8)&0xff);	
       _delay_ms(1000);
#endif

#ifdef ADC
       //       value+=2;
       if (cc++ > 100000){ // our delay
	 //       value=rand()%255;       // get a new byte from ring buffer
	 value=adcread10(1)>>2; // problem with 8 bit read somehow
	 //	 printf("val %d\r\n",value);
	 buf_put(value);
       cc=0;
       } // our delay is here

       // deal with doit?
       if (doit){
	 doit=0;
	 //	fill wbuf with whichever chunk we have from sd
	 chunkcount++;
	 if (chunkcount>(writecount/256)) chunkcount=0;
	 if (oldchunk!=chunkcount) {
	   sd_raw_read(chunkcount*256, buf, 256); // we could speed this up
	   oldchunk=chunkcount;
	 }
       }
#endif
       
#ifdef AD620 // ad620 is on ADC2
	int ad620value = adcread10(2);
	value=ad620value>>3;
       buf_put(value);
#endif
	

	//    printf("x");
    
	/*#ifdef SDCARD // older
    // write to sd-card RAW
    sd_raw_write(offset, &value, 1);

    // read as test - this seems to work...
        sd_raw_read(offset, &readbuffer, 1);
        printf("read back value: %d\r\n", readbuffer);
	offset++;
        if (offset>SIZEY) offset=0; 
#endif
	*/
	  
////////////////////////////////    
#ifdef SDCARD
  }
#endif
  
    }
  return 0;
}
