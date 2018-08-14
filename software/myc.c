//myc sd card read/write and tone/noise generation from sensors for radio transmission

// TODO: test basic tone out and switch on/off radio, test HIH code,
// test MAX31865 code and other adc sensors, test sd card read and write,
// code for generating interesting stuff

// license:GPL-2.0+
// copyright-holders: Martin Howse

// based on wormed.c for voices

#define F_CPU 16000000UL 

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
#include <avr/pgmspace.h>
//#include "waves.h"


#define BV(bit) (1<<(bit)) // Byte Value => converts bit into a byte value. One at bit location.
#define cbi(reg, bit) reg &= ~(BV(bit)) // Clears the corresponding bit in register reg
#define sbi(reg, bit) reg |= (BV(bit))              // Sets the corresponding bit in register reg


#define FS 8000 // sample rate

uint8_t synthPeriod, sample, rate, counter;


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
  DDRB=0x01; // PB0  

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
  sei();

  adc_init();
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

void main() {

  init_all();
  while(1){
    // turn on and off FET for one second PB0 - in reverse high=off
    cbi(DDRB,0); // 
    cbi(PORTB,0);
    _delay_ms(500);
    sbi(DDRB,0); // 
    sbi(PORTB,0);
    _delay_ms(500);        
    synthPeriod++;
  }
}

