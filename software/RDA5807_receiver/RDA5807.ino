#include <Wire.h>
#include "radio.h"

Radio radio;

float start_tune=87.0;

void setup() {

  radio.init();
  radio.setBassBoost(true);
  radio.setMute(false);
  radio.setVolume(1);

  // how do we tune to...?
  radio.tuneTo(start_tune);

}


void loop() {
  static float inc=0.0;
  //  inc+=0.1;
  //  if (inc>20.0) inc=0.0;
  //  radio.tuneTo(start_tune+inc);
  radio.seekUp();
  delay(2000);// can't remember speed limit here - maybe 500 or so
}

