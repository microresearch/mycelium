EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:linear
LIBS:regul
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:Logic_CMOS_4000
LIBS:mycelium_pcb-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 4900 -200 0    118  ~ 0
3x PCB: transmission, sensor, logging/micro
$Comp
L GND #PWR5
U 1 1 5AD49680
P 2550 3650
F 0 "#PWR5" H 2550 3400 50  0001 C CNN
F 1 "GND" H 2555 3477 50  0000 C CNN
F 2 "" H 2550 3650 50  0001 C CNN
F 3 "" H 2550 3650 50  0001 C CNN
	1    2550 3650
	1    0    0    -1  
$EndComp
Text Notes 2650 900  0    60   ~ 0
power, micro and sd card holder + breakout for temp at top + ADC breakouts and bridge
$Comp
L ATMEGA168A-AU U1
U 1 1 5AD4ADD0
P 3600 2500
F 0 "U1" H 3650 3867 50  0000 C CNN
F 1 "ATMEGA168A-AU" H 3650 3776 50  0000 C CNN
F 2 "Housings_QFP:TQFP-32_7x7mm_Pitch0.8mm" H 3600 2500 50  0001 C CIN
F 3 "" H 3600 2500 50  0001 C CNN
	1    3600 2500
	1    0    0    -1  
$EndComp
$Comp
L Micro_SD_Card J8
U 1 1 5AD4B106
P 6550 1850
F 0 "J8" H 6500 2567 50  0000 C CNN
F 1 "Micro_SD_Card" H 6500 2476 50  0000 C CNN
F 2 "Connectors:microSD_Card_Receptacle_Wurth_693072010801" H 7700 2150 50  0001 C CNN
F 3 "" H 6550 1850 50  0001 C CNN
	1    6550 1850
	1    0    0    -1  
$EndComp
$Comp
L C C6
U 1 1 5AD4B2C9
P 2400 1650
F 0 "C6" H 2515 1696 50  0000 L CNN
F 1 "100nF" H 2515 1605 50  0000 L CNN
F 2 "" H 2438 1500 50  0001 C CNN
F 3 "" H 2400 1650 50  0001 C CNN
	1    2400 1650
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 5AD4B7CE
P 4900 3000
F 0 "R4" H 4970 3046 50  0000 L CNN
F 1 "10K" H 4970 2955 50  0000 L CNN
F 2 "" V 4830 3000 50  0001 C CNN
F 3 "" H 4900 3000 50  0001 C CNN
	1    4900 3000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR4
U 1 1 5AD4BB0F
P 2550 2350
F 0 "#PWR4" H 2550 2100 50  0001 C CNN
F 1 "GND" H 2555 2177 50  0000 C CNN
F 2 "" H 2550 2350 50  0001 C CNN
F 3 "" H 2550 2350 50  0001 C CNN
	1    2550 2350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR2
U 1 1 5AD4BB3C
P 2400 1850
F 0 "#PWR2" H 2400 1600 50  0001 C CNN
F 1 "GND" H 2405 1677 50  0000 C CNN
F 2 "" H 2400 1850 50  0001 C CNN
F 3 "" H 2400 1850 50  0001 C CNN
	1    2400 1850
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR3
U 1 1 5AD4BC57
P 2450 1300
F 0 "#PWR3" H 2450 1150 50  0001 C CNN
F 1 "+3.3V" H 2465 1473 50  0000 C CNN
F 2 "" H 2450 1300 50  0001 C CNN
F 3 "" H 2450 1300 50  0001 C CNN
	1    2450 1300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR10
U 1 1 5AD4BE45
P 5400 2300
F 0 "#PWR10" H 5400 2050 50  0001 C CNN
F 1 "GND" H 5405 2127 50  0000 C CNN
F 2 "" H 5400 2300 50  0001 C CNN
F 3 "" H 5400 2300 50  0001 C CNN
	1    5400 2300
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR9
U 1 1 5AD4BE72
P 5350 1500
F 0 "#PWR9" H 5350 1350 50  0001 C CNN
F 1 "+3.3V" H 5365 1673 50  0000 C CNN
F 2 "" H 5350 1500 50  0001 C CNN
F 3 "" H 5350 1500 50  0001 C CNN
	1    5350 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 2300 5400 2050
Wire Wire Line
	5400 2050 5650 2050
Wire Wire Line
	5650 1850 5350 1850
Wire Wire Line
	5350 1850 5350 1500
Wire Wire Line
	5650 1650 5500 1650
Text Label 5500 1650 0    60   ~ 0
SS
Wire Wire Line
	5650 1750 5500 1750
Text Label 5500 1750 0    60   ~ 0
MOSI
Wire Wire Line
	5650 1950 5500 1950
Text Label 5500 1950 0    60   ~ 0
SCK
Wire Wire Line
	5650 2150 5500 2150
Text Label 5500 2150 0    60   ~ 0
MISO
Wire Wire Line
	4600 2850 4900 2850
Wire Wire Line
	4900 3250 4900 3150
Wire Wire Line
	4600 3100 4700 3100
Text Label 4700 3100 0    60   ~ 0
TX
Wire Wire Line
	2450 1300 2450 1400
Wire Wire Line
	2450 1400 2700 1400
$Comp
L +3.3V #PWR8
U 1 1 5AD4CCFD
P 5000 2800
F 0 "#PWR8" H 5000 2650 50  0001 C CNN
F 1 "+3.3V" H 5015 2973 50  0000 C CNN
F 2 "" H 5000 2800 50  0001 C CNN
F 3 "" H 5000 2800 50  0001 C CNN
	1    5000 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 3250 5000 3250
Wire Wire Line
	5000 3250 5000 2800
Connection ~ 2700 1500
Wire Wire Line
	2700 3500 2700 3700
Connection ~ 2700 3600
Wire Wire Line
	2550 3650 2700 3650
Connection ~ 2700 3650
Text Notes 6050 2650 0    60   ~ 0
prog header\n
$Comp
L GND #PWR12
U 1 1 5AD4D1F7
P 5650 2750
F 0 "#PWR12" H 5650 2500 50  0001 C CNN
F 1 "GND" H 5655 2577 50  0000 C CNN
F 2 "" H 5650 2750 50  0001 C CNN
F 3 "" H 5650 2750 50  0001 C CNN
	1    5650 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 2750 5650 2750
Wire Wire Line
	5900 2800 5900 2750
Wire Wire Line
	5900 2900 5800 2900
Text Label 5800 2900 0    60   ~ 0
SCK
Wire Wire Line
	5900 3000 5800 3000
Text Label 5800 3000 0    60   ~ 0
MISO
Wire Wire Line
	5900 3100 5800 3100
Text Label 5800 3100 0    60   ~ 0
MOSI
Wire Wire Line
	5900 3200 5150 3200
Wire Wire Line
	5150 3200 5150 2600
Wire Wire Line
	5150 2600 4800 2600
Wire Wire Line
	4800 2600 4800 2850
Connection ~ 4800 2850
Wire Wire Line
	4600 1900 4750 1900
Text Label 4750 1900 0    60   ~ 0
SCK
Wire Wire Line
	4600 1800 4750 1800
Text Label 4750 1800 0    60   ~ 0
MISO
Wire Wire Line
	4600 1700 4750 1700
Text Label 4750 1700 0    60   ~ 0
MOSI
Wire Wire Line
	2100 1500 2550 1500
Wire Wire Line
	2550 1500 2550 1400
Connection ~ 2550 1400
Wire Wire Line
	2400 1800 2400 1850
$Comp
L C C7
U 1 1 5AD4DE3B
P 2550 2150
F 0 "C7" H 2665 2196 50  0000 L CNN
F 1 "100nF" H 2665 2105 50  0000 L CNN
F 2 "" H 2588 2000 50  0001 C CNN
F 3 "" H 2550 2150 50  0001 C CNN
	1    2550 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 2000 2700 2000
Wire Wire Line
	2700 1400 2700 1500
Wire Wire Line
	2550 2350 2550 2300
$Comp
L L L2
U 1 1 5AD4E164
P 2100 1650
F 0 "L2" H 2153 1696 50  0000 L CNN
F 1 "val?" H 2153 1605 50  0000 L CNN
F 2 "" H 2100 1650 50  0001 C CNN
F 3 "" H 2100 1650 50  0001 C CNN
	1    2100 1650
	1    0    0    -1  
$EndComp
Connection ~ 2400 1500
$Comp
L C C5
U 1 1 5AD4E366
P 2200 1950
F 0 "C5" H 2315 1996 50  0000 L CNN
F 1 "100nF" H 2315 1905 50  0000 L CNN
F 2 "" H 2238 1800 50  0001 C CNN
F 3 "" H 2200 1950 50  0001 C CNN
	1    2200 1950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR1
U 1 1 5AD4E3B4
P 2200 2200
F 0 "#PWR1" H 2200 1950 50  0001 C CNN
F 1 "GND" H 2205 2027 50  0000 C CNN
F 2 "" H 2200 2200 50  0001 C CNN
F 3 "" H 2200 2200 50  0001 C CNN
	1    2200 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 2100 2200 2200
Wire Wire Line
	2100 1800 2700 1800
Wire Wire Line
	2700 1800 2700 1700
Connection ~ 2200 1800
Text Notes 5600 3900 0    60   ~ 0
3.3V reg\n
$Comp
L CONN_01X06 J7
U 1 1 5AD53223
P 6100 3050
F 0 "J7" H 6178 3091 50  0000 L CNN
F 1 "CONN_01X06" H 6178 3000 50  0000 L CNN
F 2 "" H 6100 3050 50  0001 C CNN
F 3 "" H 6100 3050 50  0001 C CNN
	1    6100 3050
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR11
U 1 1 5AD532AB
P 5600 3450
F 0 "#PWR11" H 5600 3300 50  0001 C CNN
F 1 "+3.3V" H 5615 3623 50  0000 C CNN
F 2 "" H 5600 3450 50  0001 C CNN
F 3 "" H 5600 3450 50  0001 C CNN
	1    5600 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 3450 5900 3450
Wire Wire Line
	5900 3450 5900 3300
$Comp
L LM1117-3.3 U2
U 1 1 5AD534E1
P 6550 3600
F 0 "U2" H 6550 3842 50  0000 C CNN
F 1 "LM1117-3.3" H 6550 3751 50  0000 C CNN
F 2 "" H 6550 3600 50  0001 C CNN
F 3 "" H 6550 3600 50  0001 C CNN
	1    6550 3600
	1    0    0    -1  
$EndComp
$Comp
L CP C8
U 1 1 5AD53B7D
P 6100 3750
F 0 "C8" V 5845 3750 50  0000 C CNN
F 1 "10uF" V 5936 3750 50  0000 C CNN
F 2 "" H 6138 3600 50  0001 C CNN
F 3 "" H 6100 3750 50  0001 C CNN
	1    6100 3750
	-1   0    0    1   
$EndComp
$Comp
L CP C9
U 1 1 5AD53C3F
P 7000 3750
F 0 "C9" V 6745 3750 50  0000 C CNN
F 1 "10uF" V 6836 3750 50  0000 C CNN
F 2 "" H 7038 3600 50  0001 C CNN
F 3 "" H 7000 3750 50  0001 C CNN
	1    7000 3750
	-1   0    0    1   
$EndComp
$Comp
L +3.3V #PWR15
U 1 1 5AD53D70
P 7000 3550
F 0 "#PWR15" H 7000 3400 50  0001 C CNN
F 1 "+3.3V" H 7015 3723 50  0000 C CNN
F 2 "" H 7000 3550 50  0001 C CNN
F 3 "" H 7000 3550 50  0001 C CNN
	1    7000 3550
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR13
U 1 1 5AD54210
P 6000 3600
F 0 "#PWR13" H 6000 3450 50  0001 C CNN
F 1 "+5V" H 6015 3773 50  0000 C CNN
F 2 "" H 6000 3600 50  0001 C CNN
F 3 "" H 6000 3600 50  0001 C CNN
	1    6000 3600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR14
U 1 1 5AD542D3
P 6550 4000
F 0 "#PWR14" H 6550 3750 50  0001 C CNN
F 1 "GND" H 6555 3827 50  0000 C CNN
F 2 "" H 6550 4000 50  0001 C CNN
F 3 "" H 6550 4000 50  0001 C CNN
	1    6550 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 3600 6250 3600
Wire Wire Line
	6100 3900 7000 3900
Connection ~ 6550 3900
Wire Wire Line
	6550 4000 6550 3900
Wire Wire Line
	7000 3600 6850 3600
Wire Wire Line
	7000 3600 7000 3550
Connection ~ 6100 3600
Wire Wire Line
	4600 1600 4750 1600
Text Label 4750 1600 0    60   ~ 0
SS
Wire Wire Line
	4600 3300 4800 3300
Text Label 4800 3300 0    60   ~ 0
PWM_OUT
Text Notes 4300 3400 0    60   ~ 0
follower/buffer from out?
$Sheet
S 900  5850 1150 600 
U 5B3BD90D
F0 "fm radio" 60
F1 "fm radio section.sch" 60
$EndSheet
$Sheet
S 2200 5850 1200 750 
U 5B3BFF6A
F0 "sensorboard" 60
F1 "sensorboard.sch" 60
$EndSheet
Text Notes 2900 4400 0    60   ~ 0
temp breakout - pins=8
Text Notes 5250 4700 0    60   ~ 0
adc in: humidity sensor, em stuff (needs amp), mushroom itself, mushroom bridge, CO2, light sensor/spect = 6
$Comp
L CONN_01X08 J10
U 1 1 5B3C0608
P 3100 5100
F 0 "J10" H 3019 4525 50  0000 C CNN
F 1 "CONN_01X08" H 3019 4616 50  0000 C CNN
F 2 "" H 3100 5100 50  0001 C CNN
F 3 "" H 3100 5100 50  0001 C CNN
	1    3100 5100
	-1   0    0    1   
$EndComp
Wire Wire Line
	3300 5450 3700 5450
Wire Wire Line
	3700 5450 3700 5500
$Comp
L +3.3V #PWR7
U 1 1 5B3C0788
P 3850 5500
F 0 "#PWR7" H 3850 5350 50  0001 C CNN
F 1 "+3.3V" H 3865 5673 50  0000 C CNN
F 2 "" H 3850 5500 50  0001 C CNN
F 3 "" H 3850 5500 50  0001 C CNN
	1    3850 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 5500 3850 5500
$Comp
L GND #PWR6
U 1 1 5B3C0939
P 3450 5500
F 0 "#PWR6" H 3450 5250 50  0001 C CNN
F 1 "GND" H 3455 5327 50  0000 C CNN
F 2 "" H 3450 5500 50  0001 C CNN
F 3 "" H 3450 5500 50  0001 C CNN
	1    3450 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 5350 3450 5350
Wire Wire Line
	3450 5350 3450 5500
Wire Wire Line
	3300 5150 3500 5150
Text Label 3500 5150 0    60   ~ 0
CLK
Wire Wire Line
	3300 5050 3500 5050
Text Label 3500 5050 0    60   ~ 0
SDO
Wire Wire Line
	3300 4950 3500 4950
Text Label 3500 4950 0    60   ~ 0
SDI
Wire Wire Line
	3300 4850 3500 4850
Text Label 3500 4850 0    60   ~ 0
CS
Text Notes 6450 5000 0    60   ~ 0
HIH6131 is 3.3v!
Text Notes 6450 5200 0    60   ~ 0
mushroom bridge values?
Text Notes 7850 1450 0    60   ~ 0
edge con:\n5V\nGND\nPWM OUT
$EndSCHEMATC