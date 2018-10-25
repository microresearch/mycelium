// clicks with sd bits on and off - run through sd bits as click, no click - base on kansas

// 4-micro/555 in +HIH humidity -SOFT: SD, *clicks transmit - run through sd bits as click, no click* clicks.c with gate on click, adc3 pulse length! *-T-*

// 17-transmitter with 555/micro source -trans and replacement caps2 - micro gated  -SOFT: *gating-sequenced, 555->micro, pwm, clicks as deviation - with emp ty signal*


// SDCARD
//#define SDCARD 1
//#define HIH 1
#define FIVEFIVE 1

#define ADC 2
#define ADCLLL 3 // adc for pulse length
#define F_CPU 16000000UL 
#define FS 16000 // sample rate

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <math.h>
#include <avr/io.h>
#include <avr/eeprom.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <util/delay.h>
#include <avr/sleep.h>
#include <avr/wdt.h>

#ifdef SDCARD
#include "sd_raw.h"
#include "sd_raw_config.h"
#include "partition.h"
#include "i2c_master.h"
#endif

#define BV(bit) (1<<(bit)) // Byte Value => converts bit into a byte value. One at bit location.
#define HEX__(n) 0x##n##UL
#define true 1
#define false 0
#define REFCLK (16000000.0/510.0)

#define MARK 1
#define MARK_CYCLES 8
#define MARK_FREQ 2400.0
#define MARK_INCR (4294967296.0*MARK_FREQ)/REFCLK

#define SPACE 0
#define SPACE_CYCLES 4
#define SPACE_FREQ 1200.0
#define SPACE_INCR (4294967296.0*SPACE_FREQ)/REFCLK

#define IDLE 65535

#define cbi(sfr, bit) (_SFR_BYTE(sfr) &= ~_BV(bit))
#define sbi(sfr, bit) (_SFR_BYTE(sfr) |= _BV(bit))

#define DEVIATION 8
#define howmany 16 // how smooth/average?
#define WHICH 1 // for ADC1 mushroom into fetadc


#define hih6131w  0x4E  //write mode - 0x27 <<1
#define hih6131r  0x4F  //read mode

unsigned char humN;
unsigned char tempN;

#ifdef FIVEFIVE
uint32_t fiver=0;

ISR (INT0_vect) // this is 555 interrupt counter
{
  fiver++;
}
#endif

#ifdef HIH
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
#endif

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


void initall() {

  DDRD=0x08;  // PD3
  DDRB|=0x01; // PB0 and for SD card  

  // pwm
  // Timer 2 set up as a 62500Hz PWM.
  TCCR2A = _BV(COM2A1) |_BV(COM2B1) | _BV(WGM21) | _BV(WGM20);
  //  TCCR2A = _BV(COM2B1) | _BV(WGM21) | _BV(WGM20);
  TCCR2B = _BV(CS20);
  TIMSK2 = 0;

  sbi(PORTB,0); // fet on
  
  adc_init();
#ifdef FIVEFIVE
  DDRD &= ~(1 << DDD2);     // Clear the PD2 pin
  PORTD |= (1 << PORTD2);  
  EICRA |= (1 << ISC00) | (1 << ISC01);    // on rising edge
  EIMSK |= (1 << INT0);     // Turns on INT0
  #endif
  sei();
}

void Delay1ms() {
  for (uint16_t j = 0; j < 2500; j++) __asm__ __volatile__ ("nop\n\t");
}

void ourdelay(uint16_t howl) {
  for (uint16_t j = 0; j < howl; j++) __asm__ __volatile__ ("nop\n\t");
}


const uint32_t SIZEY=2000000000; // 2 GB say

void click(uint8_t value, uint16_t length){
  uint8_t x;
  // go through bit by bit and click
  for (x=0;x<8;x++){
    if (((value>>x)&1)) {
          OCR2B=255;
	  sbi(PORTB,0); // fet on
	  ourdelay(length);
	  OCR2B=0;
	  _delay_ms(600);
	  cbi(PORTB,0); // fet off
    }
    else
      {
	OCR2B=0;
	cbi(PORTB,0); // fet off
	_delay_ms(600);
      }
  }

}

void clickpause(uint16_t value){
  uint16_t x;
  // go through bit by bit and click
	  	  sbi(PORTB,0); // fet on
		  OCR2B=0; // empty signl
	  	  ourdelay(600);
	  _delay_ms(1);
	  OCR2B=0;
	  for (x=0;x<(value);x++){
	  _delay_ms(10);
	  }
	  	  cbi(PORTB,0); // fet off
}


void main() {
  initall();
  uint8_t value=0;
  uint32_t offset=0, x;
  
#ifdef SDCARD
    while(1){    // outer loop for SD-cardery
      //      cli();
      if(!sd_raw_init())
      {
	//	printf("NO raw");
	continue;
      }

#ifdef HIH
      i2c_init();
#endif


      
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
    //    sei();
    //    printf("OPENED");
#endif

      while(1){
#ifdef HIH
	THSense(); // working
	value=humN;
#endif

#ifdef SDCARD
    // write a value to SD from xxxx
    // read and send values from SD

	// TODO: read value
	// for XX this should be HIH

	//	value=adcread10(0)>>2; // 8 bits
	sd_raw_write(offset++, &value, 1);
    if (offset>SIZEY) offset=0;
    for (x=0;x<offset;x++){
      sd_raw_read(x, &value, 1);
      click(value, adcread10(ADCLLL*4)); // send x clicks on and off - length we can vary say with adc!
      }
    _delay_ms(600);
#endif
    //    value=adcread10(0)>>2; // 8 bits
    //    	THSense();
    //	value=humN;
#ifdef FIVEFIVE    
    uint16_t fivee=fiver;
    //    value++;
    clickpause(fivee); 
    fiver=0; // zero the 555
    _delay_ms(500);
#endif
      }
    
#ifdef SDCARD
  }
#endif
  
}
