MCU=atmega168
#MCU=at90s4433
CC=avr-gcc
#CEXTRA=-Wa,-adhlns=$(<:.c=.lst)
#EXTERNAL_RAM = -Wl,--defsym=__heap_start=0x801100,--defsym=__heap_end=0x80ffff
#EXTERNAL_RAM = -Wl,-Tdata=0x801100,--defsym=__heap_end=0x80ffff
LDFLAGS  = -mmcu=${MCU} -Wl,-u, -lm
#LDFLAGS  = -mmcu=${MCU} -Wl,-u,vfprintf -lprintf_flt -lm
OBJCOPY=avr-objcopy
# optimize for size:
#CFLAGS=-g -mmcu=$(MCU) -Wall -Wstrict-prototypes -mcall-prologues ${CEXTRA}
CFLAGS=-mmcu=$(MCU) -Os
DEVICE = m168
AVRDUDE = avrdude -c usbasp -p $(DEVICE)
#AVRDUDE = avrdude -P /dev/ttyACM0 -b 19200 -c arduino -p $(DEVICE)
FUSEH = 0xdf
FUSEL = 0xf7


#-------------------
all: myc.hex
#-------------------
help: 
	@echo "Usage: make all|load|load_pre|rdfuses|wrfuse1mhz|wrfuse4mhz|wrfusecrystal"
	@echo "Warning: you will not be able to undo wrfusecrystal unless you connect an"
	@echo "         external crystal! uC is dead after wrfusecrystal if you do not"
	@echo "         have an external crystal."
#-------------------
myc.hex : myc.out 
	$(OBJCOPY) -R .eeprom -O ihex myc.out myc.hex 
#	$(OBJCOPY) -O ihex myc.out myc.hex 
#myc.out : myc.o 
#	$(CC) $(CFLAGS) -o myc.out -Wl,-Map,myc.map myc.o 
myc.out : myc.o 
	$(CC) ${LDFLAGS} $(CFLAGS) -o myc.out  myc.o 


myc.o : myc.c 
	$(CC) $(CFLAGS) -Os -c myc.c

myc.elf: myc.o
	$(CC) ${LDFLAGS} $(CFLAGS) -o myc.elf myc.o

disasm:	myc.elf
	avr-objdump -d noise.elf

fuse:
	$(AVRDUDE) -F -U hfuse:w:$(FUSEH):m -U lfuse:w:$(FUSEL):m

flash: all
	$(AVRDUDE) -F -U flash:w:myc.hex:i



#-------------------
clean:
	rm -f *.o *.map *.out *t.hex
#-------------------
