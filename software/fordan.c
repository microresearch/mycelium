// for dan - write temp to sd card and serial

// sleep every second then re-awaken

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

#include "MAX31865.h"

const uint32_t SIZEY=2000000000; // 2 GB say

#define RX_BUFF_LENGTH 64


unsigned char rx_buffer[RX_BUFF_LENGTH+2];
uint8_t rx_count,lenny,flag,cont=0;


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

void delay(int ms){
	while(ms){
		_delay_ms(0.96);
		ms--;
	}
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

void init_all() {

// PB1 is temp_cs and rest of temp as usual setup MAX31865 (port library)
  
  DDRD=0x08;  // PD3 (TX?)
  DDRB|=0x01; // PB0 and for SD card  


  serial_init(9600);
  stdout = &mystdout;
  printf("TESTING1 9600\r\n");

  MAX31865_init(MAX31865_2WIRE);
}

void main() {

  char buffer[7];
  float tempy;
  unsigned char not;
  
  init_all();
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
      // sleep // delay 1 second // wake up

      // test for MAX31865:
	//    Serial.print("Temperature = "); Serial.println(max.temperature(RNOMINAL, RREF));
    	tempy=temperature(RNOMINAL, RREF); // this works as long as sd card is in place
	printf("%f\r\n", tempy);
	//    	value=(int)(temper/100);
	//////////////////////
	// write value to sd card
	lenny=sprintf(rx_buffer,",%f\n",tempy);
	rx_buffer[lenny+1]=0;

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
	      printf("werror\n");
	    }
	  offset+=lenny; lenny=0;
	  ///////

    }	
      fat_close_file(fd);
    }
     
    fat_close(fs);
    partition_close(partition);

  }
  return 0;
}
