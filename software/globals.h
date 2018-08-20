/* some from AVR-LIB */

#ifndef GLOBAL_H
#define GLOBAL_H

#define CYCLES_PER_US ((F_CPU+500000)/1000000) 	// cpu cycles per microsecond

#define low(port, pin) (port &= ~_BV(pin))
#define high(port, pin) (port |= _BV(pin))

#endif
