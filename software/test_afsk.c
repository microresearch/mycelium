#include <inttypes.h>
#include <avr/interrupt.h>
#include <string.h>
#include <avr/io.h>
#include <avr/wdt.h>
#include <avr/pgmspace.h>
#include <util/delay.h>

#define cbi(sfr, bit) (_SFR_BYTE(sfr) &= ~_BV(bit))
#define sbi(sfr, bit) (_SFR_BYTE(sfr) |= _BV(bit))

// SINE lookup table for driving the PWM output at 2200Hz
PROGMEM const unsigned char sinetable[256]  = {
  0,0,0,1,1,1,2,2,3,4,5,5,6,7,9,10,11,12,14,15,16,18,20,21,23,25,27,29,31,
  33,35,37,39,42,44,46,49,51,54,56,59,62,64,67,70,73,76,78,81,84,87,90,93,96,99,102,105,108,111,115,118,121,124,127,130,133,136,139,143,146,149,152,155,158,161,164,167,170,173,176,178,181,184,187,190,192,195,198,200,203,205,208,210,212,215,217,219,221,223,225,227,229,231,233,234,236,238,239,240,
  242,243,244,245,247,248,249,249,250,251,252,252,253,253,253,254,254,254,254,254,254,254,253,253,253,252,252,251,250,249,249,248,247,245,244,243,242,240,239,238,236,234,233,231,229,227,225,223,
  221,219,217,215,212,210,208,205,203,200,198,195,192,190,187,184,181,178,176,173,170,167,164,161,158,155,152,149,146,143,139,136,133,130,127,124,121,118,115,111,108,105,102,99,96,93,90,87,84,81,78,
  76,73,70,67,64,62,59,56,54,51,49,46,44,42,39,37,35,33,31,29,27,25,23,21,20,18,16,15,14,12,11,10,9,7,6,5,5,4,3,2,2,1,1,1,0,0,0,0
};

volatile unsigned char accu = 0, bits=8, byte, shifter=0;
volatile unsigned char sinetablePointer = 0;
volatile unsigned char baud = 0; //(62.5khz / 1200bps = 52)

volatile unsigned char newbyte=33;

// Timer 2 COMPARE
ISR(TIMER2_OVF_vect){
  unsigned char bit;
  // set the pwm duty using a sinetable
  OCR2B=pgm_read_byte_near(sinetable + sinetablePointer);
  sinetablePointer = sinetablePointer + accu;
  
  baud--;
  if(baud == 0){
    // this is where we process the bits so a 1 is accu=x and a 0 is....
    bit=(byte>>shifter++)&0x01;
    if (shifter==8) {
      byte=rand()%255;       // get a new byte
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


void setup(){

  // Fast PWM Output on PB3 ???? -> PD3. OC2B
  DDRD=0x08;  // PD3

  // ???? below 
  //  SFIOR |= (1 << PSR2);   // Optional: Prescaler Reset 2 in Special Fioncion IO Register
  
  TCCR2A |= (1 << COM2B1);  // Set Non-Inverted mode (High at bottom, LOW on Match) on pin b!

  // Prescaler 1..ie 16Mhz , Counter is 8 bit, thus (Fpwm = 16mHz/256 = 62.5kHz )
  cbi(TCCR2B,CS22);
  cbi(TCCR2B,CS21);
  sbi(TCCR2B,CS20); // cs20 is set as in myc.c
  
  // MODE 3 FAST PWM as in myc.c
  sbi(TCCR2A,WGM21);
  sbi(TCCR2A,WGM20);
  
  // Initializations 
  TIMSK2 |= (1 << TOIE2); // Enable interrupt on Timer 2 Output Compare
  sei();
  /*  
  DDRD=0x08;  // PD3
  DDRB|=0x01; // PB0 and for SD card  

  //  PORTB=0x01; // set up to allow RF OUT...
  
  // Timer 2 set up as a 62500Hz PWM.
  TCCR2A = _BV(COM2A1) |_BV(COM2B1) | _BV(WGM21) | _BV(WGM20);
  //  TCCR2A = _BV(COM2B1) | _BV(WGM21) | _BV(WGM20);
  TCCR2B = _BV(CS20);
  TIMSK2 = 0;   
  //  sei();
  */
}


// continous loop
void main(void){
  unsigned char val=0,x;
  setup();

  while(1){
    //
  };  
}
