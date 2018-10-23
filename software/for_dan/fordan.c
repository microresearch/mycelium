// for dan - write temp to sd card and serial

// use fat16, 2gb card only - this is working now...

// so 24hrs x30= 720 hours (say 5000maH) = 6 months at 1mA 0.6 months at 10mA

// with sleep idle we have 12mA approx on idle

// with power down we have 10mA on idle

// ALWAYS REMEMBER SEI()!

// - other options: turn off sd
// (how), change to high pins on sd port in between, other low power options,
// clock speed, remove regulator (sd power is probably main thing)...

// further refs: http://www.osbss.com/tutorials/temperature-relative-humidity/
// https://electronics.stackexchange.com/questions/37173/low-power-micro-sd-card-storage
// https://github.com/EKMallon/UNO-Breadboard-Datalogger/blob/master/_20160110_UnoBasedDataLogger_v1/_20160110_UnoBasedDataLogger_v1.ino

// this is probably easiest on a serial enable board!

#include <string.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <avr/pgmspace.h>
#include <inttypes.h>
#include "fat.h"
#include "fat_config.h"
#include "sd_raw.h"
#include "sd_raw_config.h"
#include "partition.h"
#include "i2c_master.h"
#include <avr/sleep.h>
#include <avr/power.h>
#include <avr/wdt.h>
#include "MAX31865.h"

#define sbi(var, mask)   ((var) |= (uint8_t)(1 << mask))
#define cbi(var, mask)   ((var) &= (uint8_t)~(1 << mask))


const uint32_t SIZEY=2000000000; // 2 GB say
volatile unsigned char f_wdt=1;


#define RX_BUFF_LENGTH 8

volatile uint16_t cont;

/*ISR(TIMER2_OVF_vect)
{
  cont++;
}
*/




unsigned char rx_buffer[RX_BUFF_LENGTH+2];
uint8_t rx_count,lenny,flag;


#define RREF      430.0
#define RNOMINAL  100.0

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

ISR(WDT_vect){
  //  wdt_disable();    //TODO: should it be in the code?
  //  MCUSR=0; //clear WDT flag (optional)
f_wdt=1;
}

void delayWDT(unsigned char timer){
  set_sleep_mode(SLEEP_MODE_PWR_DOWN);
  sleep_enable();
  sleep_mode();
  sleep_disable();
  power_all_enable();
}

  
void setupWatchDogTimer() {
	// The MCU Status Register (MCUSR) is used to tell the cause of the last
	// reset, such as brown-out reset, watchdog reset, etc.
	// NOTE: for security reasons, there is a timed sequence for clearing the
	// WDE and changing the time-out configuration. If you don't use this
	// sequence properly, you'll get unexpected results.

	// Clear the reset flag on the MCUSR, the WDRF bit (bit 3).
	MCUSR &= ~(1<<WDRF);

	// Configure the Watchdog timer Control Register (WDTCSR)
	// The WDTCSR is used for configuring the time-out, mode of operation, etc

	// In order to change WDE or the pre-scaler, we need to set WDCE (This will
	// allow updates for 4 clock cycles).

	// Set the WDCE bit (bit 4) and the WDE bit (bit 3) of the WDTCSR. The WDCE
	// bit must be set in order to change WDE or the watchdog pre-scalers.
	// Setting the WDCE bit will allow updates to the pre-scalers and WDE for 4
	// clock cycles then it will be reset by hardware.
	WDTCSR |= (1<<WDCE) | (1<<WDE);
	//	WDTCSR &= ~(1<<WDE);
	
	/**
	 *	Setting the watchdog pre-scaler value with VCC = 5.0V and 16mHZ
	 *	WDP3 WDP2 WDP1 WDP0 | Number of WDT | Typical Time-out at Oscillator Cycles
	 *	0    0    0    0    |   2K cycles   | 16 ms
	 *	0    0    0    1    |   4K cycles   | 32 ms
	 *	0    0    1    0    |   8K cycles   | 64 ms
	 *	0    0    1    1    |  16K cycles   | 0.125 s
	 *	0    1    0    0    |  32K cycles   | 0.25 s
	 *	0    1    0    1    |  64K cycles   | 0.5 s
	 *	0    1    1    0    |  128K cycles  | 1.0 s
	 *	0    1    1    1    |  256K cycles  | 2.0 s
	 *	1    0    0    0    |  512K cycles  | 4.0 s
	 *	1    0    0    1    | 1024K cycles  | 8.0 s
	*/
	WDTCSR  = (0<<WDP3) | (1<<WDP2) | (1<<WDP1) | (1<<WDP0);
	// Enable the WD interrupt (note: no reset).
	WDTCSR |= _BV(WDIE);
}


#define UART_BAUD_CALC(UART_BAUD_RATE,F_OSC) ((F_OSC)/((UART_BAUD_RATE)*16l)-1)

void delay(int ms){
	while(ms){
		_delay_ms(0.96);
		ms--;
	}
}

/* 

void serial_init(int baudrate){
  UBRRH = (uint8_t)(UART_BAUD_CALC(baudrate,F_CPU)>>8);
  UBRRL = (uint8_t)UART_BAUD_CALC(baudrate,F_CPU);
  UCSRB = (1<<RXEN) | (1<<TXEN);
  UCSRC |=(3<<UCSZ0);  
}

static int uart_putchar(char c, FILE *stream);

static FILE mystdout = FDEV_SETUP_STREAM(uart_putchar, NULL,_FDEV_SETUP_WRITE);

static int uart_putchar(char c, FILE *stream)
{
  loop_until_bit_is_set(UCSRA, UDRE);
  UDR = c;
  return 0;
  }

*/

void init_all() {
  //  wdt_disable();

// PB1 is temp_cs and rest of temp as usual setup MAX31865 (port library)
  
//  DDRD=0x08;  // PD3 (TX?)
//  DDRB|=0x01; // PB0 and for SD card  


  //  serial_init(9600);
  //  stdout = &mystdout;
  //  printf("TESTING1 9600\r\n");

  MAX31865_init(MAX31865_2WIRE);
}

void main() {

  char buffer[7]; uint32_t value;
  float tempy;
  unsigned char not;
  unsigned char *chptr;
  
  init_all();
  sei(); // remember!!!!
  setupWatchDogTimer();

  //  set_sleep_mode(SLEEP_MODE_IDLE);
  //more sleep stuff

  //  TCCR2A=0;  
  //  TCCR2B=(0<<7)|(0<<6)|(0<<5)|(0<<4)|(0<<3)|(1<<2)|(1<<1)|(1<<0);
  //  TIMSK2=(0<<2)|(0<<1)|(1<<0);

  
    while(1){    // outer loop for SD-cardery
  // init sd card
    if(!sd_raw_init())
      {
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
	/* If the partition did not open, assume the storage device
	 * is a "superfloppy", i.e. has no MBR.
	 */
	partition = partition_open(sd_raw_read,
				   sd_raw_read_interval,
				   sd_raw_write,
				   sd_raw_write_interval,
				   -1
				   );
	if(!partition)
	  {
	    continue;          
	  }
      }


    /* open file system */
    struct fat_fs_struct* fs = fat_open(partition);
    if(!fs)
      {
	continue;
      }

    /* open root directory */
    struct fat_dir_entry_struct directory;
    fat_get_dir_entry_of_path(fs, "/", &directory);

    struct fat_dir_struct* dd = fat_open_dir(fs, &directory);
    if(!dd)
      {
	continue;
      }
        
    /* print some card information as a boot message */
    strcpy(buffer, "monk00");  buffer[6]='\0';
    // open new file
    while(1){
      not=0;
      struct fat_dir_entry_struct file_entry;

      for (buffer[4] = '0'; buffer[4] <= '9'; buffer[4]++) {
	for (buffer[5] = '0'; buffer[5] <= '9'; buffer[5]++) {

	  if(!fat_create_file(dd, buffer, &file_entry))
	    {
	      //		  uart_putc('>');
	    }
	  else {
	    not=1;
	    break;
	  }
	}
	if (not==1) break;
      }

      struct fat_file_struct* fd = fat_open_file(fs, &file_entry);
      if(!fd)
	{
	  continue;
	}

      int32_t offset=0;

      
    while(1){

	/*
      // sleep // delay 1 second // wake up
      sleep_enable();
      // TWI | TIMER2 | TIMER0 | VOID | TIMER1 | SPI | USART | ADC
      PRR=(1<<7)|(0<<6)|(1<<5)|(1<<4)|(1<<3)|(0<<2)|(0<<1)|(1<<0); //comm
      sei();
      while (cont<600) // was 60 
	{
	  //Go to Sleep
	  sleep_mode();
	}
      //Disable Sleep
      sleep_disable();
      //Disable interrupts
      cli(); // we need to time with LED how long this is!
      cont=0;
      */
      // test for MAX31865:
	//    Serial.print("Temperature = "); Serial.println(max.temperature(RNOMINAL, RREF));
            tempy=temperature(RNOMINAL, RREF); // this works as long as sd card is in place
      //   tempy=0.01f;
	//	printf("%f\r\n", tempy);
	    value=(int)(tempy*100.0f);
	//////////////////////
	// write value to sd card
      lenny=sprintf(rx_buffer,"%d\n",value); // how to replace sprintf
      /* chptr = (unsigned char *) &tempy;
 rx_buffer[0]=*chptr++;
 rx_buffer[1]=*chptr++;
 rx_buffer[2]=*chptr++;
 rx_buffer[3]=*chptr;
 rx_buffer[4]=10;
 rx_buffer[5]=13;
 rx_buffer[6]=0;
      */

   //;Tx(*chptr++);Tx(*chptr++);Tx(*chptr);
      
 //	rx_buffer[lenny+1]=0;
      // lenny=7;
 
	if(!fat_seek_file(fd, &offset, FAT_SEEK_SET))
	    {
	      fat_close_file(fd);
	      _delay_ms(10 );
	      continue;
	    }

	  if(!fat_write_file(fd, (uint8_t*) rx_buffer , lenny))
	    {
	      fat_close_file(fd);
	      _delay_ms(10 );
	      continue;
	    }
	  else 
	    {
	      //	      printf("werror\n");
	      _delay_ms(10 );
	      	    }
	  offset+=lenny; lenny=0;
	  ///////
	  delayWDT(WDTO_8S);  //Testing Value: TODO Change to 8s

	  ////////////
    }
      fat_close_file(fd);
    }
     
    fat_close(fs);
    partition_close(partition);

  }
  return 0;
}
