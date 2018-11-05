#include <Wire.h>
#include "radio.h"

// SDA is A4, SCL is A5

Radio radio;

float start_tune=87.0; // tune to 87

void setup() {

  radio.init();
  radio.setBassBoost(true);
  radio.setMute(false);
  radio.setVolume(10);

  // how do we tune to...?
  radio.tuneTo(start_tune);

}


void loop() {
  static float inc=0.0;
  int tempy=rand()%10;
  inc+=0.025; // minimum inc for 25k spacings
    if (inc>1.0) inc=0.0;
    radio.tuneTo(start_tune+inc);
  //  radio.seekUp();
  delay(600*tempy);// can't remember speed limit here - maybe 600 or so
}

