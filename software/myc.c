//myc sd card read/write and tone/noise generation from sensors for radio transmission

// TODO: test basic tone out and switch on/off radio-DONE, test HIH code-DONE,
// test MAX31865 code and other adc sensors, test sd card read and write,
// test 555 and interrupt (we need 555 on board)
// code for generating interesting stuff

// FET switch-X
// HIH-X
// basic tones-X
// SD card raw read and write-X

// TODO: MAX31865-X, 555 interrupt on INT0, adc sensors (light sensor to build)

// live codings, timings etc.

// license:GPL-2.0+
// copyright-holders: Martin Howse

// based on wormed.c for voices, check also microbd

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


#define FS 8000 // sample rate

uint8_t synthPeriod, sample, rate, counter;

#define UART_BAUD_CALC(UART_BAUD_RATE,F_OSC) ((F_OSC)/((UART_BAUD_RATE)*16l)-1)

void delay(int ms){
	while(ms){
		_delay_ms(0.96);
		ms--;
	}
}

uint32_t fiver=0;

ISR (INT0_vect) // this is 555 interrupt counter
{
  fiver++;
}

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

ISR(TIMER1_COMPA_vect) {
  static uint8_t nextPwm, noisy;
  static uint8_t periodCounter;
  static int16_t nsq;

  //  OCR2A= noisy;
  OCR2B = nextPwm;
  sei();
  nextPwm = 120 + synthPeriod * ((nsq++%synthPeriod)/(synthPeriod/2));
}

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
  
  DDRD=0x08;  // PD3
  DDRB|=0x01; // PB0 and for SD card  

  //  PORTB=0x01; // set up to allow RF OUT...
  
  // Timer 2 set up as a 62500Hz PWM.
  //
  TCCR2A = _BV(COM2A1) |_BV(COM2B1) | _BV(WGM21) | _BV(WGM20);
  //  TCCR2A = _BV(COM2B1) | _BV(WGM21) | _BV(WGM20);
  TCCR2B = _BV(CS20);
  TIMSK2 = 0;
			
  // Timer 1 set up as a 8000Hz sample interrupt
  TCCR1A = 0;
  TCCR1B = _BV(WGM12) | _BV(CS10);
  TCNT1 = 0;
  OCR1A = F_CPU / FS;
  TIMSK1 = _BV(OCIE1A);  
  synthPeriod=0x50; 

  serial_init(9600);
  stdout = &mystdout;
  //  adc_init(); // fix i2c pins but that's not it...
    printf("TESTING1 9600\r\n");

  // how do we set up HIH sensor?
  i2c_init();

  // for MAX31865
  MAX31865_init(MAX31865_2WIRE);

  // 555 is on INT0 - set up here - we don't need pullup as we have on board...

  EICRA |= (1 << ISC01);    // on rising edge
  EIMSK |= (1 << INT0);     // Turns on INT0
    
  sei();
  
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
  const uint32_t SIZEY=2000000000; // 2 GB say
  uint32_t offset=0;
  unsigned char readbuffer,writebuffer;
  float tempy;
  
  init_all();

    while(1){    // outer loop for SD-cardery
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

    printf("OPENED");
    
  while(1){
    // turn on and off FET for one second PB0 - in reverse high=off
    /*    cbi(DDRB,0);  
    cbi(PORTB,0);
    _delay_ms(500);
    sbi(DDRB,0); 
    sbi(PORTB,0);
    _delay_ms(500);        
    synthPeriod++;*/
    
    // tests for HIH
    //      THSense();
    //    printf("TEMP: %d HUM: %d\r\n", tempN, humN);

    // test the 555 - working it seems
    _delay_ms(1000);
    uint32_t fivee=fiver;
    printf("555 count: %d\r\n", fivee);
    

    // write to sd-card RAW

    //    sd_raw_write(offset, &humN, 1);

    // read as test - this seems to work...
        sd_raw_read(offset, &readbuffer, 1);
        printf("read back HUM: %d\r\n", readbuffer);
	offset++;
        if (offset>SIZEY) offset=0; 

	fiver=0; // zero the 555
    // test for MAX31865:
    //    Serial.print("Temperature = "); Serial.println(max.temperature(RNOMINAL, RREF));
	//    tempy=temperature(RNOMINAL, RREF); // working but not with sdcard
	//    int temper=(int)(tempy*100.0);
	//    printf("MAX temp %d\r\n", temper);
    ////////////////////////////////    
  }

    }
  return 0;
}
