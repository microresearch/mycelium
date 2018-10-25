/*************************************************** 
Adapted by Martin Howse for bare Atmega168

  This is a library for the Adafruit PT100/P1000 RTD Sensor w/MAX31865

  Designed specifically to work with the Adafruit RTD Sensor
  ----> https://www.adafruit.com/products/3328

  This sensor uses SPI to communicate, 4 pins are required to  
  interface
  Adafruit invests time and resources providing this open source code, 
  please support Adafruit and open-source hardware by purchasing 
  products from Adafruit!

  Written by Limor Fried/Ladyada for Adafruit Industries.  
  BSD license, all text above must be included in any redistribution
 ****************************************************/

#include "MAX31865.h"
#include <avr/pgmspace.h>
#include <stdlib.h>
#include <util/delay.h>

#define BV(bit) (1<<(bit)) // Byte Value => converts bit into a byte value. One at bit location.
#define cbi(reg, bit) reg &= ~(BV(bit)) // Clears the corresponding bit in register reg
#define sbi(reg, bit) reg |= (BV(bit))              // Sets the corresponding bit in register reg

//static SPISettings max31865_spisettings = SPISettings(500 000, MSBFIRST, SPI_MODE1);

// SPIbeginTransaction(max31865_spisettings);
// SPIendTransaction();

#define true 1
#define false 0

unsigned char SPItransfer(unsigned char data)
{
    // Load data into the buffer
    SPDR = data;
 
    //Wait until transmission complete
    while(!(SPSR & (1<<SPIF) ));
 
    // Return received data
    return(SPDR);
}

// what is _cs pin? = PB1

void MAX31865_release(void){
  // and give it back to SD card
    SPCR = (0 << SPIE) | /* SPI Interrupt Enable */
           (1 << SPE)  | /* SPI Enable */
           (0 << DORD) | /* Data Order: MSB first */
           (1 << MSTR) | /* Master mode */
           (0 << CPOL) | /* Clock Polarity: SCK low when idle */
           (0 << CPHA) | /* Clock Phase: sample on rising SCK edge */
           (1 << SPR1) | /* Clock Frequency: f_OSC / 128 */
           (1 << SPR0);
    SPSR &= ~(1 << SPI2X); /* No doubled clock frequency */
}

void MAX31865_comeback(void){
  // give it me
     SPCR=(1<<SPE)|(1<<MSTR)|(1<<SPR1)|(1<<CPHA); // mode 1 and check prescaler - should be 32 for 500 000 above
  SPSR=1<<SPI2X;
}



uint8_t MAX31865_init(max31865_numwires_t wires){

   // Set MOSI, SCK as Output
  //  DDRB|=(1<<5)|(1<<3) |(1<<1); // and _CS

  DDRB |= (1 << DDB3);
  DDRB |= (1 << DDB5);
  DDRB |= (1 << DDB1); // CS
  DDRB &= ~(1 << DDB4);

  
  sbi(PORTB,1); // _CS high 
    // Enable SPI, Set as Master
  //      digitalWrite(SS, HIGH); // we need to do SS stuff to make it work!
      sbi(PORTB, 2);
    // When the SS pin is set as OUTPUT, it can be used as
    // a general purpose output port (it doesn't influence
    // SPI operations).
      //    pinMode(SS, OUTPUT);
      //      sbi(DDRD,
        DDRB |= (1 << DDB2); // SS

    // Warning: if the SS pin ever becomes a LOW INPUT then SPI
    // automatically switches to Slave, so the data direction of
    // the SS pin MUST be kept as OUTPUT.
    SPCR |= _BV(MSTR);
    SPCR |= _BV(SPE);


  
    // Prescaler: Fosc/16, Enable Interrupts
    //The MOSI, SCK pins are as per ATMega8
  //    SPCR=(1<<SPE)|(1<<MSTR)|(1<<SPR0)|(1<<CPHA); // mode 1 and check prescaler?
  SPCR=(1<<SPE)|(1<<MSTR)|(1<<SPR1)|(1<<CPHA); // mode 1 and check prescaler - should be 32 for 500 000 above
   SPSR=(1<<SPI2X);
   // Enable Global Interrupts
   //   sei();

   
  for (uint8_t i=0; i<16; i++) {
    // readRegister8(i);
  }

  setWires(wires);
  enableBias(false);
  autoConvert(false);
  clearFault();

  //Serial.print("config: "); Serial.println(readRegister8(MAX31856_CONFIG_REG), HEX);
  return true;
}


uint8_t readFault(void) {
  return readRegister8(MAX31856_FAULTSTAT_REG);
}

void clearFault(void) {
  uint8_t t = readRegister8(MAX31856_CONFIG_REG);
  t &= ~0x2C;
  t |= MAX31856_CONFIG_FAULTSTAT;
  writeRegister8(MAX31856_CONFIG_REG, t);
}

void enableBias(uint8_t b) {
  uint8_t t = readRegister8(MAX31856_CONFIG_REG);
  if (b) {
    t |= MAX31856_CONFIG_BIAS;       // enable bias
  } else {
    t &= ~MAX31856_CONFIG_BIAS;       // disable bias
  }
  writeRegister8(MAX31856_CONFIG_REG, t);
}

void autoConvert(uint8_t b) {
  uint8_t t = readRegister8(MAX31856_CONFIG_REG);
  if (b) {
    t |= MAX31856_CONFIG_MODEAUTO;       // enable autoconvert
  } else {
    t &= ~MAX31856_CONFIG_MODEAUTO;       // disable autoconvert
  }
  writeRegister8(MAX31856_CONFIG_REG, t);
}

void setWires(max31865_numwires_t wires ) {
  uint8_t t = readRegister8(MAX31856_CONFIG_REG);
  if (wires == MAX31865_3WIRE) {
    t |= MAX31856_CONFIG_3WIRE;
  } else {
    // 2 or 4 wire
    t &= ~MAX31856_CONFIG_3WIRE;
  }
  writeRegister8(MAX31856_CONFIG_REG, t);
}

float temperature(float RTDnominal, float refResistor) {
  // http://www.analog.com/media/en/technical-documentation/application-notes/AN709_0.pdf

  float Z1, Z2, Z3, Z4, Rt, temp;

  Rt = readRTD();
  Rt /= 32768;
  Rt *= refResistor;
  
  // Serial.print("\nResistance: "); Serial.println(Rt, 8);

  Z1 = -RTD_A;
  Z2 = RTD_A * RTD_A - (4 * RTD_B);
  Z3 = (4 * RTD_B) / RTDnominal;
  Z4 = 2 * RTD_B;

  temp = Z2 + (Z3 * Rt);
  temp = (sqrt(temp) + Z1) / Z4;
  
  if (temp >= 0) return temp;

  // ugh.
  Rt /= RTDnominal;
  Rt *= 100;      // normalize to 100 ohm

  float rpoly = Rt;

  temp = -242.02;
  temp += 2.2228 * rpoly;
  rpoly *= Rt;  // square
  temp += 2.5859e-3 * rpoly;
  rpoly *= Rt;  // ^3
  temp -= 4.8260e-6 * rpoly;
  rpoly *= Rt;  // ^4
  temp -= 2.8183e-8 * rpoly;
  rpoly *= Rt;  // ^5
  temp += 1.5243e-10 * rpoly;
  
  return temp;
}

uint16_t readRTD (void) {
  clearFault();
  enableBias(true);
  //  delay(10);
  _delay_ms(10);

  uint8_t t = readRegister8(MAX31856_CONFIG_REG);
  t |= MAX31856_CONFIG_1SHOT;      
  writeRegister8(MAX31856_CONFIG_REG, t);
  //  delay(65);
  _delay_ms(65);

  uint16_t rtd = readRegister16(MAX31856_RTDMSB_REG);

  // remove fault
  rtd >>= 1;

  return rtd;
}

/**********************************************/

uint8_t readRegister8(uint8_t addr) {
  uint8_t ret = 0;
  readRegisterN(addr, &ret, 1);

  return ret;
}

uint16_t readRegister16(uint8_t addr) {
  uint8_t buffer[2] = {0, 0};
  readRegisterN(addr, buffer, 2);

  uint16_t ret = buffer[0];
  ret <<= 8;
  ret |=  buffer[1];
  
  return ret;
}


void readRegisterN(uint8_t addr, uint8_t buffer[], uint8_t n) {
  addr &= 0x7F; // make sure top bit is not set

  //    SPIbeginTransaction(max31865_spisettings);
MAX31865_comeback();
  //  digitalWrite(_cs, LOW);
  cbi(PORTB,1);
  
  spixfer(addr);

  //Serial.print("$"); Serial.print(addr, HEX); Serial.print(": ");
  while (n--) {
    buffer[0] = spixfer(0xFF);
    //Serial.print(" 0x"); Serial.print(buffer[0], HEX);
    buffer++;
  }
  //Serial.println();

  //    SPIendTransaction();
MAX31865_release();
  //  digitalWrite(_cs, HIGH);
    sbi(PORTB,1);

}


void writeRegister8(uint8_t addr, uint8_t data) {
  //    SPIbeginTransaction(max31865_spisettings);
MAX31865_comeback();
  //  digitalWrite(_cs, LOW);
  cbi(PORTB,1);

  spixfer(addr | 0x80);   // make sure top bit is set
  spixfer(data);

  //Serial.print("$"); Serial.print(addr, HEX); Serial.print(" = 0x"); Serial.println(data, HEX);

  //    SPIendTransaction();
MAX31865_release();
  //  digitalWrite(_cs, HIGH);
    sbi(PORTB,1);
}

uint8_t spixfer(uint8_t x) {
    return SPItransfer(x);
}
