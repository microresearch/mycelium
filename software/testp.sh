#!/bin/bash
while :
do
avrdude -F -c usbasp -p m168p -F -U hfuse:w:0xdf:m -U lfuse:w:0xff:m
done
