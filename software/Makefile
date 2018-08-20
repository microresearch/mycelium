
NAME := myco
HEX := $(NAME).hex
OUT := $(NAME).out
MAP := $(NAME).map
SOURCES := $(wildcard *.c)
HEADERS := $(wildcard *.h)
OBJECTS := $(patsubst %.c,%.o,$(SOURCES))

MCU := atmega168
MCU_AVRDUDE := m168
MCU_FREQ := 16000000UL


CC := avr-gcc
OBJCOPY := avr-objcopy
SIZE := avr-size -A
DOXYGEN := doxygen

CFLAGS := -Wall -pedantic -mmcu=$(MCU) -std=c99 -Os -DF_OSC=8000000 -DF_CPU=$(MCU_FREQ)

FUSEH = 0xdf
FUSEL = 0xe2

fuse:
	avrdude -y -c usbasp -p $(MCU_AVRDUDE) -F -U hfuse:w:$(FUSEH):m -U lfuse:w:$(FUSEL):m


all: $(HEX)

clean:
	rm -f $(HEX) $(OUT) $(MAP) $(OBJECTS)
	rm -rf doc/html

flash: $(HEX)
	avrdude -y -c usbasp -p $(MCU_AVRDUDE) -U flash:w:$(HEX)

$(HEX): $(OUT)
	$(OBJCOPY) -R .eeprom -O ihex $< $@

$(OUT): $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ -Wl,-Map,$(MAP) $^
	@echo
	@$(SIZE) $@
	@echo

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c -o $@ $<

%.pp: %.c
	$(CC) $(CFLAGS) -E -o $@ $<

%.ppo: %.c
	$(CC) $(CFLAGS) -E $<

doc: $(HEADERS) $(SOURCES) Doxyfile
	$(DOXYGEN) Doxyfile

.PHONY: all clean flash doc

