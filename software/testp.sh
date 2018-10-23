#!/bin/bash
while :
do
avrdude -F -c stk500v2 -P /dev/ttyACM0 -p m168p -F -U hfuse:w:0xdf:m -U lfuse:w:0xff:m
done
