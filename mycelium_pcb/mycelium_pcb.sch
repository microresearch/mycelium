EESchema Schematic File Version 4
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
L mycelium_pcb-rescue:GND-power #PWR01
U 1 1 5AD49680
P 2550 3650
F 0 "#PWR01" H 2550 3400 50  0001 C CNN
F 1 "GND" H 2555 3477 50  0000 C CNN
F 2 "" H 2550 3650 50  0001 C CNN
F 3 "" H 2550 3650 50  0001 C CNN
	1    2550 3650
	1    0    0    -1  
$EndComp
Text Notes 2650 900  0    60   ~ 0
power, micro and sd card holder + breakout for temp at top + ADC breakouts and bridge
$Comp
L mycelium_pcb-rescue:ATMEGA168A-AU-atmel U1
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
L mycelium_pcb-rescue:Micro_SD_Card-Connector J8
U 1 1 5AD4B106
P 6550 1850
F 0 "J8" H 6500 2567 50  0000 C CNN
F 1 "Micro_SD_Card" H 6500 2476 50  0000 C CNN
F 2 "Connectors:microSD_Card_Receptacle_Wurth_693072010801" H 7700 2150 50  0001 C CNN
F 3 "" H 6550 1850 50  0001 C CNN
F 4 "710-693072010801 (mouser)" H 6550 1850 50  0001 C CNN "Notes"
	1    6550 1850
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:C-device C6
U 1 1 5AD4B2C9
P 2400 1650
F 0 "C6" H 2515 1696 50  0000 L CNN
F 1 "100nF" H 2515 1605 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2438 1500 50  0001 C CNN
F 3 "" H 2400 1650 50  0001 C CNN
	1    2400 1650
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:R-device R4
U 1 1 5AD4B7CE
P 4900 3000
F 0 "R4" H 4970 3046 50  0000 L CNN
F 1 "10K" H 4970 2955 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4830 3000 50  0001 C CNN
F 3 "" H 4900 3000 50  0001 C CNN
	1    4900 3000
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:GND-power #PWR02
U 1 1 5AD4BB0F
P 2550 2350
F 0 "#PWR02" H 2550 2100 50  0001 C CNN
F 1 "GND" H 2555 2177 50  0000 C CNN
F 2 "" H 2550 2350 50  0001 C CNN
F 3 "" H 2550 2350 50  0001 C CNN
	1    2550 2350
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:GND-power #PWR03
U 1 1 5AD4BB3C
P 2400 1850
F 0 "#PWR03" H 2400 1600 50  0001 C CNN
F 1 "GND" H 2405 1677 50  0000 C CNN
F 2 "" H 2400 1850 50  0001 C CNN
F 3 "" H 2400 1850 50  0001 C CNN
	1    2400 1850
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:+3.3V-power #PWR04
U 1 1 5AD4BC57
P 2450 1300
F 0 "#PWR04" H 2450 1150 50  0001 C CNN
F 1 "+3.3V" H 2465 1473 50  0000 C CNN
F 2 "" H 2450 1300 50  0001 C CNN
F 3 "" H 2450 1300 50  0001 C CNN
	1    2450 1300
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:GND-power #PWR05
U 1 1 5AD4BE45
P 5400 2300
F 0 "#PWR05" H 5400 2050 50  0001 C CNN
F 1 "GND" H 5405 2127 50  0000 C CNN
F 2 "" H 5400 2300 50  0001 C CNN
F 3 "" H 5400 2300 50  0001 C CNN
	1    5400 2300
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:+3.3V-power #PWR06
U 1 1 5AD4BE72
P 5350 1500
F 0 "#PWR06" H 5350 1350 50  0001 C CNN
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
	5650 1950 5500 1950
Text Label 5500 1950 0    60   ~ 0
SCK
Wire Wire Line
	5650 2150 5500 2150
Text Label 5500 2150 0    60   ~ 0
MISO
Wire Wire Line
	4600 2850 4800 2850
Wire Wire Line
	4900 3250 4900 3150
Wire Wire Line
	4600 3100 4700 3100
Text Label 4700 3100 0    60   ~ 0
TX
Wire Wire Line
	2450 1300 2450 1400
Wire Wire Line
	2450 1400 2550 1400
$Comp
L mycelium_pcb-rescue:+3.3V-power #PWR07
U 1 1 5AD4CCFD
P 5000 2800
F 0 "#PWR07" H 5000 2650 50  0001 C CNN
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
Wire Wire Line
	2700 3500 2700 3600
Connection ~ 2700 3600
Wire Wire Line
	2200 3650 2550 3650
Connection ~ 2700 3650
Text Notes 6050 2650 0    60   ~ 0
prog header\n
$Comp
L mycelium_pcb-rescue:GND-power #PWR08
U 1 1 5AD4D1F7
P 5650 2750
F 0 "#PWR08" H 5650 2500 50  0001 C CNN
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
	2100 1500 2400 1500
Wire Wire Line
	2550 1500 2550 1400
Connection ~ 2550 1400
Wire Wire Line
	2400 1800 2400 1850
$Comp
L mycelium_pcb-rescue:C-device C7
U 1 1 5AD4DE3B
P 2550 2150
F 0 "C7" H 2665 2196 50  0000 L CNN
F 1 "100nF" H 2665 2105 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2588 2000 50  0001 C CNN
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
L mycelium_pcb-rescue:L-device L2
U 1 1 5AD4E164
P 2100 1650
F 0 "L2" H 2153 1696 50  0000 L CNN
F 1 "blocking" H 2153 1605 50  0000 L CNN
F 2 "Diodes_SMD:D_0603" H 2100 1650 50  0001 C CNN
F 3 "" H 2100 1650 50  0001 C CNN
F 4 "81-BLM18BD252SN1D (mouser)" H 2100 1650 50  0001 C CNN "Notes"
	1    2100 1650
	1    0    0    -1  
$EndComp
Connection ~ 2400 1500
$Comp
L mycelium_pcb-rescue:C-device C5
U 1 1 5AD4E366
P 2200 1950
F 0 "C5" H 2315 1996 50  0000 L CNN
F 1 "100nF" H 2315 1905 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2238 1800 50  0001 C CNN
F 3 "" H 2200 1950 50  0001 C CNN
	1    2200 1950
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:GND-power #PWR09
U 1 1 5AD4E3B4
P 2200 2200
F 0 "#PWR09" H 2200 1950 50  0001 C CNN
F 1 "GND" H 2205 2027 50  0000 C CNN
F 2 "" H 2200 2200 50  0001 C CNN
F 3 "" H 2200 2200 50  0001 C CNN
	1    2200 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 2100 2200 2200
Wire Wire Line
	2100 1800 2200 1800
Connection ~ 2200 1800
$Comp
L mycelium_pcb-rescue:CONN_01X06 J7
U 1 1 5AD53223
P 6100 3050
F 0 "J7" H 6178 3091 50  0000 L CNN
F 1 "CONN_01X06" H 6178 3000 50  0000 L CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x06_Pitch2.54mm" H 6100 3050 50  0001 C CNN
F 3 "" H 6100 3050 50  0001 C CNN
	1    6100 3050
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:+3.3V-power #PWR010
U 1 1 5AD532AB
P 5600 3450
F 0 "#PWR010" H 5600 3300 50  0001 C CNN
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
Wire Wire Line
	4600 1600 4750 1600
Text Label 4750 1600 0    60   ~ 0
SS
Wire Wire Line
	4600 3300 4800 3300
Text Label 4800 3300 0    60   ~ 0
PWM_OUT
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
Text Notes 3750 4950 0    60   ~ 0
temp breakout - pins=8
$Comp
L mycelium_pcb-rescue:+3.3V-power #PWR014
U 1 1 5B3C0788
P 4400 5900
F 0 "#PWR014" H 4400 5750 50  0001 C CNN
F 1 "+3.3V" H 4415 6073 50  0000 C CNN
F 2 "" H 4400 5900 50  0001 C CNN
F 3 "" H 4400 5900 50  0001 C CNN
	1    4400 5900
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:GND-power #PWR015
U 1 1 5B3C0939
P 4400 5600
F 0 "#PWR015" H 4400 5350 50  0001 C CNN
F 1 "GND" H 4405 5427 50  0000 C CNN
F 2 "" H 4400 5600 50  0001 C CNN
F 3 "" H 4400 5600 50  0001 C CNN
	1    4400 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 5500 4350 5500
Text Label 4350 5500 0    60   ~ 0
SCK
Wire Wire Line
	4150 5400 4350 5400
Text Label 4350 5400 0    60   ~ 0
MISO
Wire Wire Line
	4150 5300 4350 5300
Text Label 4350 5300 0    60   ~ 0
MOSI
Wire Wire Line
	4150 5200 4350 5200
Text Label 4350 5200 0    60   ~ 0
TEMP_CS
Text Notes 7650 1100 0    60   ~ 0
HIH6131 is 3.3v!
Text Notes 3300 3950 0    60   ~ 0
out to low pass
$Comp
L mycelium_pcb-rescue:R-device R1
U 1 1 5B3D50FB
P 3650 4150
F 0 "R1" H 3720 4196 50  0000 L CNN
F 1 "68R" H 3720 4105 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3580 4150 50  0001 C CNN
F 3 "" H 3650 4150 50  0001 C CNN
	1    3650 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	3200 4150 3500 4150
$Comp
L mycelium_pcb-rescue:C-device C11
U 1 1 5B3D5103
P 3950 4300
F 0 "C11" H 4065 4346 50  0000 L CNN
F 1 "100nF" H 4065 4255 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 3988 4150 50  0001 C CNN
F 3 "" H 3950 4300 50  0001 C CNN
	1    3950 4300
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:GND-power #PWR016
U 1 1 5B3D510A
P 3950 4550
F 0 "#PWR016" H 3950 4300 50  0001 C CNN
F 1 "GND" H 3955 4377 50  0000 C CNN
F 2 "" H 3950 4550 50  0001 C CNN
F 3 "" H 3950 4550 50  0001 C CNN
	1    3950 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 4150 3950 4150
Wire Wire Line
	3950 4550 3950 4450
Connection ~ 3950 4150
Text Label 3200 4150 0    60   ~ 0
PWM_OUT
Text Label 4200 4150 0    60   ~ 0
PWM_LP_OUT
$Comp
L mycelium_pcb-rescue:CONN_01X01 J11
U 1 1 5B3F6574
P 8750 1250
F 0 "J11" H 8669 1025 50  0000 C CNN
F 1 "BREAKOUT" H 8750 1150 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_SMD_5x10mm" H 8750 1250 50  0001 C CNN
F 3 "" H 8750 1250 50  0001 C CNN
	1    8750 1250
	-1   0    0    1   
$EndComp
$Comp
L mycelium_pcb-rescue:CONN_01X01 J3
U 1 1 5B3F67D9
P 8750 850
F 0 "J3" H 8669 625 50  0000 C CNN
F 1 "BREAKOUT" H 8750 750 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 8750 850 50  0001 C CNN
F 3 "" H 8750 850 50  0001 C CNN
	1    8750 850 
	-1   0    0    1   
$EndComp
$Comp
L mycelium_pcb-rescue:CONN_01X01 J4
U 1 1 5B3F6815
P 8750 1050
F 0 "J4" H 8669 825 50  0000 C CNN
F 1 "BREAKOUT" H 8750 950 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 8750 1050 50  0001 C CNN
F 3 "" H 8750 1050 50  0001 C CNN
	1    8750 1050
	-1   0    0    1   
$EndComp
$Comp
L mycelium_pcb-rescue:CONN_01X01 J12
U 1 1 5B3F684B
P 8750 1450
F 0 "J12" H 8669 1225 50  0000 C CNN
F 1 "BREAKOUT" H 8750 1350 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_SMD_5x10mm" H 8750 1450 50  0001 C CNN
F 3 "" H 8750 1450 50  0001 C CNN
	1    8750 1450
	-1   0    0    1   
$EndComp
Text Notes 8250 550  0    60   ~ 0
conn left for sensors
Text Notes 9650 550  0    60   ~ 0
conn right for rf
$Comp
L mycelium_pcb-rescue:CONN_01X01 J14
U 1 1 5B3F7117
P 10500 800
F 0 "J14" H 10419 575 50  0000 C CNN
F 1 "BREAKOUT" H 10500 700 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_SMD_5x10mm" H 10500 800 50  0001 C CNN
F 3 "" H 10500 800 50  0001 C CNN
	1    10500 800 
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:CONN_01X01 J15
U 1 1 5B3F71A7
P 10500 1000
F 0 "J15" H 10419 775 50  0000 C CNN
F 1 "BREAKOUT" H 10500 900 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_SMD_5x10mm" H 10500 1000 50  0001 C CNN
F 3 "" H 10500 1000 50  0001 C CNN
	1    10500 1000
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:CONN_01X01 J16
U 1 1 5B3F71E9
P 10500 1400
F 0 "J16" H 10419 1175 50  0000 C CNN
F 1 "BREAKOUT" H 10500 1300 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_SMD_5x10mm" H 10500 1400 50  0001 C CNN
F 3 "" H 10500 1400 50  0001 C CNN
	1    10500 1400
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:GND-power #PWR017
U 1 1 5B3F72A7
P 9100 1250
F 0 "#PWR017" H 9100 1000 50  0001 C CNN
F 1 "GND" H 9200 1250 50  0000 C CNN
F 2 "" H 9100 1250 50  0001 C CNN
F 3 "" H 9100 1250 50  0001 C CNN
	1    9100 1250
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:+3.3V-power #PWR018
U 1 1 5B3F72E2
P 9100 1050
F 0 "#PWR018" H 9100 900 50  0001 C CNN
F 1 "+3.3V" H 9115 1223 50  0000 C CNN
F 2 "" H 9100 1050 50  0001 C CNN
F 3 "" H 9100 1050 50  0001 C CNN
	1    9100 1050
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:+5V-power #PWR019
U 1 1 5B3F731D
P 9100 800
F 0 "#PWR019" H 9100 650 50  0001 C CNN
F 1 "+5V" H 9115 973 50  0000 C CNN
F 2 "" H 9100 800 50  0001 C CNN
F 3 "" H 9100 800 50  0001 C CNN
	1    9100 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 850  9100 850 
Wire Wire Line
	9100 850  9100 800 
Wire Wire Line
	8950 1050 9100 1050
Wire Wire Line
	8950 1250 9100 1250
Wire Wire Line
	8950 1450 9100 1450
$Comp
L mycelium_pcb-rescue:+5V-power #PWR020
U 1 1 5B3F7E03
P 8100 3250
F 0 "#PWR020" H 8100 3100 50  0001 C CNN
F 1 "+5V" H 8115 3423 50  0000 C CNN
F 2 "" H 8100 3250 50  0001 C CNN
F 3 "" H 8100 3250 50  0001 C CNN
	1    8100 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 3250 8100 3250
$Comp
L mycelium_pcb-rescue:GND-power #PWR021
U 1 1 5B3F7EA3
P 8250 3150
F 0 "#PWR021" H 8250 2900 50  0001 C CNN
F 1 "GND" H 8255 2977 50  0000 C CNN
F 2 "" H 8250 3150 50  0001 C CNN
F 3 "" H 8250 3150 50  0001 C CNN
	1    8250 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 3150 8250 3150
Text Notes 7950 3450 0    60   ~ 0
CO2 sensor power is 5v
Wire Wire Line
	7950 3050 8350 3050
Text Label 8350 3050 0    60   ~ 0
ADC_MUSHROOM
Wire Wire Line
	7950 2850 8050 2850
Text Label 8050 2850 0    60   ~ 0
ADC_LIGHT
Wire Wire Line
	4600 2350 4800 2350
Text Label 4800 2250 0    60   ~ 0
ADC_LIGHT
Wire Wire Line
	4600 2450 4800 2450
Text Label 4800 2350 0    60   ~ 0
ADC_MUSHROOM
Wire Wire Line
	4600 3200 4700 3200
Text Label 4700 3200 0    60   ~ 0
MUSH_555
$Comp
L mycelium_pcb-rescue:CONN_01X01 J1
U 1 1 5B3FAF9E
P 5350 3600
F 0 "J1" H 5269 3375 50  0000 C CNN
F 1 "BREAKOUT" H 5350 3500 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 5350 3600 50  0001 C CNN
F 3 "" H 5350 3600 50  0001 C CNN
	1    5350 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 3600 5000 3600
Text Label 5000 3600 0    60   ~ 0
TX
$Comp
L mycelium_pcb-rescue:CONN_01X01 J13
U 1 1 5B3FB995
P 8750 1800
F 0 "J13" H 8669 1575 50  0000 C CNN
F 1 "BREAKOUT" H 8750 1700 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_SMD_5x10mm" H 8750 1800 50  0001 C CNN
F 3 "" H 8750 1800 50  0001 C CNN
	1    8750 1800
	-1   0    0    1   
$EndComp
Wire Wire Line
	8950 1800 9150 1800
Text Label 9150 1800 0    60   ~ 0
MUSH_555
Wire Wire Line
	7950 2950 8150 2950
Text Label 8150 2950 0    60   ~ 0
SPARE_ADC
Text Label 4800 2450 0    60   ~ 0
SPARE_ADC
$Comp
L mycelium_pcb-rescue:+5V-power #PWR022
U 1 1 5B3FBD52
P 10000 800
F 0 "#PWR022" H 10000 650 50  0001 C CNN
F 1 "+5V" H 10015 973 50  0000 C CNN
F 2 "" H 10000 800 50  0001 C CNN
F 3 "" H 10000 800 50  0001 C CNN
	1    10000 800 
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:GND-power #PWR023
U 1 1 5B3FBDDC
P 10000 1000
F 0 "#PWR023" H 10000 750 50  0001 C CNN
F 1 "GND" H 10005 827 50  0000 C CNN
F 2 "" H 10000 1000 50  0001 C CNN
F 3 "" H 10000 1000 50  0001 C CNN
	1    10000 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 1000 10300 1000
Text Label 10000 1400 0    60   ~ 0
PWM_LP_OUT
$Comp
L mycelium_pcb-rescue:CONN_01X01 J26
U 1 1 5B412E75
P 10550 1800
F 0 "J26" H 10469 1575 50  0000 C CNN
F 1 "BREAKOUT" H 10550 1700 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_SMD_5x10mm" H 10550 1800 50  0001 C CNN
F 3 "" H 10550 1800 50  0001 C CNN
	1    10550 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 1800 10000 1800
Text Label 10000 1800 0    60   ~ 0
RF_EN
Wire Wire Line
	4600 1400 4800 1400
Text Label 4800 1400 0    60   ~ 0
RF_EN
$Comp
L mycelium_pcb-rescue:Crystal_Small-device Y1
U 1 1 5B4166A2
P 4750 2050
F 0 "Y1" V 4796 1962 50  0000 R CNN
F 1 "16 MHz" V 4705 1962 50  0000 R CNN
F 2 "Crystals:Crystal_SMD_HC49-SD_HandSoldering" H 4750 2050 50  0001 C CNN
F 3 "" H 4750 2050 50  0001 C CNN
	1    4750 2050
	0    -1   -1   0   
$EndComp
$Comp
L mycelium_pcb-rescue:C_Small-device C24
U 1 1 5B416855
P 5000 1950
F 0 "C24" H 5092 1996 50  0000 L CNN
F 1 "22pF" H 5092 1905 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5000 1950 50  0001 C CNN
F 3 "" H 5000 1950 50  0001 C CNN
	1    5000 1950
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:C_Small-device C25
U 1 1 5B416AAE
P 5150 1950
F 0 "C25" H 5242 1996 50  0000 L CNN
F 1 "22pF" H 5242 1905 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5150 1950 50  0001 C CNN
F 3 "" H 5150 1950 50  0001 C CNN
	1    5150 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 2000 4650 2000
Wire Wire Line
	4650 2000 4650 1950
Wire Wire Line
	4650 1950 4750 1950
Wire Wire Line
	4600 2100 4600 2150
Wire Wire Line
	4600 2150 4750 2150
Wire Wire Line
	4900 1950 4900 1850
Wire Wire Line
	4900 1850 5000 1850
Connection ~ 4750 1950
$Comp
L mycelium_pcb-rescue:GND-power #PWR024
U 1 1 5B416C6E
P 5050 2050
F 0 "#PWR024" H 5050 1800 50  0001 C CNN
F 1 "GND" H 5055 1877 50  0000 C CNN
F 2 "" H 5050 2050 50  0001 C CNN
F 3 "" H 5050 2050 50  0001 C CNN
	1    5050 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 2150 4950 1800
Wire Wire Line
	4950 1800 5150 1800
Wire Wire Line
	5150 1800 5150 1850
Connection ~ 4750 2150
Wire Wire Line
	5000 2050 5150 2050
Wire Wire Line
	4600 2250 4800 2250
Text Label 9100 1450 0    60   ~ 0
SDA
$Comp
L mycelium_pcb-rescue:CONN_01X01 J25
U 1 1 5B4184BA
P 8750 1600
F 0 "J25" H 8669 1375 50  0000 C CNN
F 1 "BREAKOUT" H 8750 1500 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_SMD_5x10mm" H 8750 1600 50  0001 C CNN
F 3 "" H 8750 1600 50  0001 C CNN
	1    8750 1600
	-1   0    0    1   
$EndComp
Wire Wire Line
	8950 1600 9100 1600
Text Label 9100 1600 0    60   ~ 0
SCL
$Comp
L mycelium_pcb-rescue:LED_Small-device D1
U 1 1 5B41BA82
P 2200 3450
F 0 "D1" V 2246 3382 50  0000 R CNN
F 1 "LED_Small" V 2155 3382 50  0000 R CNN
F 2 "LEDs:LED_0805_HandSoldering" V 2200 3450 50  0001 C CNN
F 3 "" V 2200 3450 50  0001 C CNN
	1    2200 3450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2200 3650 2200 3550
Connection ~ 2550 3650
$Comp
L mycelium_pcb-rescue:+3.3V-power #PWR025
U 1 1 5B41BD57
P 2200 2950
F 0 "#PWR025" H 2200 2800 50  0001 C CNN
F 1 "+3.3V" H 2215 3123 50  0000 C CNN
F 2 "" H 2200 2950 50  0001 C CNN
F 3 "" H 2200 2950 50  0001 C CNN
	1    2200 2950
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:R-device R23
U 1 1 5B41BD9E
P 2200 3150
F 0 "R23" H 2270 3196 50  0000 L CNN
F 1 "330R" H 2270 3105 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2130 3150 50  0001 C CNN
F 3 "" H 2200 3150 50  0001 C CNN
	1    2200 3150
	-1   0    0    1   
$EndComp
Wire Wire Line
	2200 3350 2200 3300
Wire Wire Line
	2200 2950 2200 3000
Text Notes 9300 3350 0    60   ~ 0
edge con:\n5V\n3.3V\nGND\nPWM_LP_OUT\nSDA/SCL for humidity\nmuSH_555 in\n\nbreakout:\nGND\nco2 power=5V\nADC_CO2\nADC_LIGHT\nADC_MUSHROOM\nSPARE_ADC
Wire Wire Line
	5650 1750 5450 1750
Wire Wire Line
	5650 1650 5450 1650
Text Label 5450 1650 0    60   ~ 0
SS
Wire Wire Line
	4600 2550 4800 2550
Text Label 4800 2550 0    60   ~ 0
ADC_CO2
Wire Wire Line
	7950 2750 8150 2750
Text Label 8150 2750 0    60   ~ 0
ADC_CO2
Wire Wire Line
	4600 2650 4700 2650
Wire Wire Line
	4600 2750 4700 2750
Text Label 4700 2650 0    60   ~ 0
SDA
Text Label 4700 2750 0    60   ~ 0
SCL
Wire Wire Line
	4600 1500 4800 1500
Text Label 4800 1500 0    60   ~ 0
TEMP_CS
Text Notes 4750 5400 0    60   ~ 0
MOSI is SDI, MISO is SDO, SCK is CLK
Text Label 5450 1750 0    60   ~ 0
MOSI
Wire Wire Line
	2700 1800 2700 1700
Wire Wire Line
	10000 1400 10300 1400
Wire Wire Line
	10000 800  10300 800 
$Comp
L mycelium_pcb-rescue:Conn_01x08-Connector J2
U 1 1 5B3FC557
P 7750 2950
F 0 "J2" H 7670 2325 50  0000 C CNN
F 1 "Conn_01x08" H 7670 2416 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x08_Pitch2.54mm" H 7750 2950 50  0001 C CNN
F 3 "" H 7750 2950 50  0001 C CNN
	1    7750 2950
	-1   0    0    1   
$EndComp
Wire Wire Line
	7950 2650 8100 2650
Text Label 8100 2650 0    60   ~ 0
SCL
Wire Wire Line
	7950 2550 8150 2550
Text Label 8150 2550 0    60   ~ 0
SDA
$Comp
L mycelium_pcb-rescue:Conn_01x08-Connector J10
U 1 1 5B453A8F
P 3950 5500
F 0 "J10" H 3870 4875 50  0000 C CNN
F 1 "Conn_01x08" H 3870 4966 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x08_Pitch2.54mm" H 3950 5500 50  0001 C CNN
F 3 "" H 3950 5500 50  0001 C CNN
	1    3950 5500
	-1   0    0    1   
$EndComp
Wire Wire Line
	4150 5800 4250 5800
Wire Wire Line
	4250 5800 4250 5900
Wire Wire Line
	4250 5900 4400 5900
Wire Wire Line
	4150 5700 4300 5700
Wire Wire Line
	4300 5700 4300 5600
Wire Wire Line
	4300 5600 4400 5600
Connection ~ 6100 3600
Wire Wire Line
	7000 3600 7000 3550
Wire Wire Line
	7000 3600 6850 3600
Wire Wire Line
	6550 4000 6550 3900
Connection ~ 6550 3900
Wire Wire Line
	6100 3900 6550 3900
Wire Wire Line
	6000 3600 6100 3600
$Comp
L mycelium_pcb-rescue:GND-power #PWR013
U 1 1 5AD542D3
P 6550 4000
F 0 "#PWR013" H 6550 3750 50  0001 C CNN
F 1 "GND" H 6555 3827 50  0000 C CNN
F 2 "" H 6550 4000 50  0001 C CNN
F 3 "" H 6550 4000 50  0001 C CNN
	1    6550 4000
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:+5V-power #PWR012
U 1 1 5AD54210
P 6000 3600
F 0 "#PWR012" H 6000 3450 50  0001 C CNN
F 1 "+5V" H 6015 3773 50  0000 C CNN
F 2 "" H 6000 3600 50  0001 C CNN
F 3 "" H 6000 3600 50  0001 C CNN
	1    6000 3600
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:+3.3V-power #PWR011
U 1 1 5AD53D70
P 7000 3550
F 0 "#PWR011" H 7000 3400 50  0001 C CNN
F 1 "+3.3V" H 7015 3723 50  0000 C CNN
F 2 "" H 7000 3550 50  0001 C CNN
F 3 "" H 7000 3550 50  0001 C CNN
	1    7000 3550
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:CP-device C9
U 1 1 5AD53C3F
P 7000 3750
F 0 "C9" V 6745 3750 50  0000 C CNN
F 1 "10uF" V 6836 3750 50  0000 C CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-A_EIA-3216-18_Hand" H 7038 3600 50  0001 C CNN
F 3 "" H 7000 3750 50  0001 C CNN
	1    7000 3750
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:CP-device C8
U 1 1 5AD53B7D
P 6100 3750
F 0 "C8" V 5845 3750 50  0000 C CNN
F 1 "10uF" V 5936 3750 50  0000 C CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-A_EIA-3216-18_Hand" H 6138 3600 50  0001 C CNN
F 3 "" H 6100 3750 50  0001 C CNN
	1    6100 3750
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:LM1117-3.3-regul U2
U 1 1 5AD534E1
P 6550 3600
F 0 "U2" H 6550 3842 50  0000 C CNN
F 1 "LM1117-3.3" H 6550 3751 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:TO-263-2" H 6550 3600 50  0001 C CNN
F 3 "" H 6550 3600 50  0001 C CNN
	1    6550 3600
	1    0    0    -1  
$EndComp
Text Notes 5600 3900 0    60   ~ 0
3.3V reg\n
Text Notes 6750 4050 0    60   ~ 0
move this to sensor page
Text Notes 7650 3700 0    60   ~ 0
added 3.3v on pcb for 5933\n
Wire Wire Line
	2700 3600 2700 3650
Wire Wire Line
	2700 3650 2700 3700
Wire Wire Line
	4800 2850 4900 2850
Wire Wire Line
	2550 1400 2700 1400
Wire Wire Line
	2400 1500 2550 1500
Wire Wire Line
	2200 1800 2700 1800
Wire Wire Line
	3950 4150 4200 4150
Wire Wire Line
	4750 1950 4900 1950
Wire Wire Line
	4750 2150 4950 2150
Wire Wire Line
	2550 3650 2700 3650
Wire Wire Line
	6100 3600 6250 3600
Wire Wire Line
	6550 3900 7000 3900
$EndSCHEMATC
