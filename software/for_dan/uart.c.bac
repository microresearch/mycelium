
/*
 * Copyright (c) 2006-2008 by Roland Riegel <feedback@roland-riegel.de>
 *
 * This file is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 */

#include <stdio.h>
#include <avr/interrupt.h>
#include <avr/io.h>
#include <avr/pgmspace.h>
#include <avr/sfr_defs.h>
#include <avr/sleep.h>

#include "uart.h"

/* some mcus have multiple uarts */
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

#define BAUD 9600UL
#define UBRRVAL (F_CPU/(BAUD*16)-1)
#define USE_SLEEP 0

//const char gps_string[] PROGMEM ="$GPGGA,123519,4807.038,N,01131.000,E,1,08,0.9,545.4,M,46.9,M,,*47";


void uart_init(unsigned long baudrate)
{
    unsigned long baudval = (F_CPU/(baudrate*16)-1);

    // unsigned long baudval = (unsigned char)((F_CPU+(baudrate*8L))/(baudrate*16L)-1);


    /* set baud rate */
    UBRRH = baudval >> 8;
    UBRRL = baudval & 0xff;

    /* set frame format: 8 bit, no parity, 1 bit */
                 UCSRC = UCSRC_SELECT | (1 << UCSZ1) | (1 << UCSZ0); // parity?
    //    	     UCSRC = UCSRC_SELECT | (1 << UCSZ1) | (1 << UCSZ0) | (1 << UPM01) | (1 << UPM00); // odd parity FOR GPS !!!!! ONLY !!!!! which one???
    /* enable serial receiver and transmitter */
#if !USE_SLEEP
    UCSRB = (1 << RXEN) | (1 << TXEN);
#else
    UCSRB = (1 << RXEN) | (1 << TXEN) | (1 << RXCIE);
#endif
}

uint8_t uart_getc()
{
  /*  unsigned char c;
  static int y = 0;
  c= pgm_read_byte(gps_string+y);
  y++;
  if (y>65) y=0;
  return c;*/ // former test code


    /* wait until receive buffer is full */
  #if USE_SLEEP
    uint8_t sreg = SREG;
    sei();

    while(!(UCSRA & (1 << RXC)))
        sleep_mode();

    SREG = sreg;
#else
    while(!(UCSRA & (1 << RXC)));
#endif

    uint8_t b = UDR;
    if(b == '\r')
        b = '\n';

	return b;
}

void uart_putc(uint8_t c)
{
  //    if(c == '\n')
  //      uart_putc('\r');

    /* wait until transmit buffer is empty */
    while(!(UCSRA & (1 << UDRE)));

    /* send next byte */
    UDR = c;
}


EMPTY_INTERRUPT(USART_RX_vect)
