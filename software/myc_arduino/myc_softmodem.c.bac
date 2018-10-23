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

#define HIGH 1
#define LOW 0

#define BV(bit) (1<<(bit)) // Byte Value => converts bit into a byte value. One at bit location.
#define HEX__(n) 0x##n##UL
#define cbi(sfr, bit) (_SFR_BYTE(sfr) &= ~_BV(bit))
#define sbi(sfr, bit) (_SFR_BYTE(sfr) |= _BV(bit))

#define SOFT_MODEM_BAUD_RATE   (1225)
#define SOFT_MODEM_LOW_FREQ    (4900)
#define SOFT_MODEM_HIGH_FREQ   (7350)
#define SOFT_MODEM_RX_BUF_SIZE (32)

#define clockCyclesPerMicrosecond() ( F_CPU / 1000000L )
#define clockCyclesToMicroseconds(a) ( (a) / clockCyclesPerMicrosecond() )

#if F_CPU == 16000000
#if SOFT_MODEM_BAUD_RATE <= 126
  #define TIMER_CLOCK_SELECT       (7)
  #define MICROS_PER_TIMER_COUNT   (clockCyclesToMicroseconds(1024))
#elif SOFT_MODEM_BAUD_RATE <= 315
  #define TIMER_CLOCK_SELECT       (6)
  #define MICROS_PER_TIMER_COUNT   (clockCyclesToMicroseconds(256))
#elif SOFT_MODEM_BAUD_RATE <= 630
  #define TIMER_CLOCK_SELECT       (5)
  #define MICROS_PER_TIMER_COUNT   (clockCyclesToMicroseconds(128))
#elif SOFT_MODEM_BAUD_RATE <= 1225
  #define TIMER_CLOCK_SELECT       (4)
  #define MICROS_PER_TIMER_COUNT   (clockCyclesToMicroseconds(64))
#else
  #define TIMER_CLOCK_SELECT       (3)
  #define MICROS_PER_TIMER_COUNT   (clockCyclesToMicroseconds(32))
#endif
#else
#if SOFT_MODEM_BAUD_RATE <= 126
  #define TIMER_CLOCK_SELECT       (6)
  #define MICROS_PER_TIMER_COUNT   (clockCyclesToMicroseconds(256))
#elif SOFT_MODEM_BAUD_RATE <= 315
  #define TIMER_CLOCK_SELECT       (5)
  #define MICROS_PER_TIMER_COUNT   (clockCyclesToMicroseconds(128))
#elif SOFT_MODEM_BAUD_RATE <= 630
  #define TIMER_CLOCK_SELECT       (4)
  #define MICROS_PER_TIMER_COUNT   (clockCyclesToMicroseconds(64))
#else
  #define TIMER_CLOCK_SELECT       (3)
  #define MICROS_PER_TIMER_COUNT   (clockCyclesToMicroseconds(32))
#endif
#endif

#define BIT_PERIOD             (1000000/SOFT_MODEM_BAUD_RATE)
#define HIGH_FREQ_MICROS       (1000000/SOFT_MODEM_HIGH_FREQ)
#define LOW_FREQ_MICROS        (1000000/SOFT_MODEM_LOW_FREQ)

#define HIGH_FREQ_CNT          (BIT_PERIOD/HIGH_FREQ_MICROS)
#define LOW_FREQ_CNT           (BIT_PERIOD/LOW_FREQ_MICROS)

#define MAX_CARRIR_BITS        (40000/BIT_PERIOD) // 40ms

#define TCNT_BIT_PERIOD        (BIT_PERIOD/MICROS_PER_TIMER_COUNT)
#define TCNT_HIGH_FREQ         (HIGH_FREQ_MICROS/MICROS_PER_TIMER_COUNT)
#define TCNT_LOW_FREQ          (LOW_FREQ_MICROS/MICROS_PER_TIMER_COUNT)

#define TCNT_HIGH_TH_L         (TCNT_HIGH_FREQ * 0.80)
#define TCNT_HIGH_TH_H         (TCNT_HIGH_FREQ * 1.15)
#define TCNT_LOW_TH_L          (TCNT_LOW_FREQ * 0.85)
#define TCNT_LOW_TH_H          (TCNT_LOW_FREQ * 1.20)

enum { START_BIT = 0, DATA_BIT = 8, STOP_BIT = 9, INACTIVE = 0xff };

// the prescaler is set so that timer0 ticks every 64 clock cycles, and the
// the overflow handler is called every 256 ticks.
#define MICROSECONDS_PER_TIMER0_OVERFLOW (clockCyclesToMicroseconds(64 * 256))
// the whole number of milliseconds per timer0 overflow
#define MILLIS_INC (MICROSECONDS_PER_TIMER0_OVERFLOW / 1000)
// the fractional number of milliseconds per timer0 overflow. we shift right
// by three to fit these numbers into a byte. (for the clock speeds we care
// about - 8 and 16 MHz - this doesn't lose precision.)
#define FRACT_INC ((MICROSECONDS_PER_TIMER0_OVERFLOW % 1000) >> 3)
#define FRACT_MAX (1000 >> 3)

volatile unsigned long timer0_overflow_count = 0;
volatile unsigned long timer0_millis = 0;
static unsigned char timer0_fract = 0;

volatile uint8_t *_txPortReg;
uint8_t _txPortMask;
uint8_t _lastTCNT;
uint8_t _lastDiff;
uint8_t _lowCount;
uint8_t _highCount;
unsigned long _lastWriteTime;

ISR(TIMER2_COMPA_vect)
{
	OCR2A += (uint8_t)TCNT_BIT_PERIOD;
}


SIGNAL(TIMER0_OVF_vect) // we need to set this up
{
	// copy these to local variables so they can be stored in registers
	// (volatile variables must be read from memory on every access)
	unsigned long m = timer0_millis;
	unsigned char f = timer0_fract;
	m += MILLIS_INC;
	f += FRACT_INC;
	if (f >= FRACT_MAX) {
		f -= FRACT_MAX;
		m += 1;
	}
	timer0_fract = f;
	timer0_millis = m;
	timer0_overflow_count++;
}


unsigned long micros() {
	unsigned long m;
	uint8_t oldSREG = SREG, t;
	
	cli();
	m = timer0_overflow_count;
#if defined(TCNT0)
	t = TCNT0;
#elif defined(TCNT0L)
	t = TCNT0L;
#else
	#error TIMER 0 not defined
#endif
  
#ifdef TIFR0
	if ((TIFR0 & _BV(TOV0)) && (t < 255))
		m++;
#else
	if ((TIFR & _BV(TOV0)) && (t < 255))
		m++;
#endif
	SREG = oldSREG;
	
	return ((m << 8) + t) * (64 / clockCyclesPerMicrosecond());
}


void initall()
{
  DDRD=0x08;  // PD3
  DDRB|=0x01; // PB0 and for SD card  

  _lastTCNT = TCNT2;
  _lastDiff = _lowCount = _highCount = 0;

  sei();

// from wiring.c to set up timer 0
 
	// on the ATmega168, timer 0 is also used for fast hardware pwm
	// (using phase-correct PWM would mean that timer 0 overflowed half as often
	// resulting in different millis() behavior on the ATmega8 and ATmega168)
#if defined(TCCR0A) && defined(WGM01)
	sbi(TCCR0A, WGM01);
	sbi(TCCR0A, WGM00);
#endif  
	// set timer 0 prescale factor to 64
#if defined(__AVR_ATmega128__)
	// CPU specific: different values for the ATmega128
	sbi(TCCR0, CS02);
#elif defined(TCCR0) && defined(CS01) && defined(CS00)
	// this combination is for the standard atmega8
	sbi(TCCR0, CS01);
	sbi(TCCR0, CS00);
#elif defined(TCCR0B) && defined(CS01) && defined(CS00)
	// this combination is for the standard 168/328/1280/2560
	sbi(TCCR0B, CS01);
	sbi(TCCR0B, CS00);
#elif defined(TCCR0A) && defined(CS01) && defined(CS00)
	// this combination is for the __AVR_ATmega645__ series
	sbi(TCCR0A, CS01);
	sbi(TCCR0A, CS00);
#else
	#error Timer 0 prescale factor 64 not set correctly
#endif
	// enable timer 0 overflow interrupt
#if defined(TIMSK) && defined(TOIE0)
	sbi(TIMSK, TOIE0);
#elif defined(TIMSK0) && defined(TOIE0)
	sbi(TIMSK0, TOIE0);
#else
	#error	Timer 0 overflow interrupt not set correctly
#endif

		// set timer 2 prescale factor to 64
#if defined(TCCR2) && defined(CS22)
	sbi(TCCR2, CS22);
#elif defined(TCCR2B) && defined(CS22)
	sbi(TCCR2B, CS22);
#else
	#warning Timer 2 not finished (may not be present on this CPU)
#endif
	// configure timer 2 for phase correct pwm (8-bit)
#if defined(TCCR2) && defined(WGM20)
	sbi(TCCR2, WGM20);
#elif defined(TCCR2A) && defined(WGM20)
	sbi(TCCR2A, WGM20);
#else
	#warning Timer 2 not finished (may not be present on this CPU)
#endif
	
	TCCR2A = 0;
	TCCR2B = TIMER_CLOCK_SELECT;
	//	ACSR   = _BV(ACIE) | _BV(ACIS1);
	//	DIDR1  = _BV(AIN1D) | _BV(AIN0D); // digital port off ????
	sei();
 }

void modulate(uint8_t b)
{
	uint8_t cnt,tcnt,tcnt2;
	if(b){
		cnt = (uint8_t)(HIGH_FREQ_CNT);
		tcnt2 = (uint8_t)(TCNT_HIGH_FREQ / 2);
		tcnt = (uint8_t)(TCNT_HIGH_FREQ) - tcnt2;
	}else{
		cnt = (uint8_t)(LOW_FREQ_CNT);
		tcnt2 = (uint8_t)(TCNT_LOW_FREQ / 2);
		tcnt = (uint8_t)(TCNT_LOW_FREQ) - tcnt2;
	}
	do {
		cnt--;
		{
			OCR2B += tcnt;
			TIFR2 |= _BV(OCF2B);
			while(!(TIFR2 & _BV(OCF2B)));
		}
		//			*_txPortReg ^= _txPortMask;
		PORTD^=0x08;
		{
			OCR2B += tcnt2;
			TIFR2 |= _BV(OCF2B);
			while(!(TIFR2 & _BV(OCF2B)));
		}
		PORTD^=0x08;
		//		*_txPortReg ^= _txPortMask;
	} while (cnt);
 }

//  Brief carrier tone before each transmission
//  1 start bit (LOW)
//  8 data bits, LSB first
//  1 stop bit (HIGH)
//  ...
//  1 push bit (HIGH)

size_t modemwrite(const uint8_t *buffer, size_t size)
{
    uint8_t cnt = ((micros() - _lastWriteTime) / BIT_PERIOD) + 1;
    if(cnt > MAX_CARRIR_BITS)
        cnt = MAX_CARRIR_BITS;
    for(uint8_t i = 0; i<cnt; i++)
        modulate(HIGH);
    size_t n = size;
    while (size--) {
        uint8_t data = *buffer++;
        modulate(LOW);							 // Start Bit
        for(uint8_t mask = 1; mask; mask <<= 1){ // Data Bits
            if(data & mask){
                modulate(HIGH);
            }
            else{
                modulate(LOW);
            }
        }
        modulate(HIGH);				// Stop Bit
    }
	modulate(HIGH);				// Push Bit
	_lastWriteTime = micros();
    return n;
 }

 void main(){
   uint8_t buf[10]="help";
   uint8_t rr;
   initall();
   while(1){
   rr++;
     modemwrite(&rr, 1);

   }
 }
