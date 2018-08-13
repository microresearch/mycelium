EESchema Schematic File Version 4
LIBS:mycelium_pcb-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 700  1700 0    118  ~ 24
sensor board: \n\n555 into mushroom thing\nhumidity (3.3v)\nconn and amp for RF\n
$Comp
L mycelium_pcb-rescue:OP07-linear U6
U 1 1 5B404641
P 2300 3300
F 0 "U6" H 2641 3346 50  0000 L CNN
F 1 "OP07" H 2641 3255 50  0000 L CNN
F 2 "SMD_Packages:SOIC-8-N" H 2350 3350 50  0001 C CNN
F 3 "" H 2350 3450 50  0001 C CNN
	1    2300 3300
	1    0    0    -1  
$EndComp
Text Notes 2000 2100 0    60   ~ 0
rf amp/detektor
Text Notes 5600 2400 0    60   ~ 0
555 mushroom
Text Notes 7800 900  0    60   ~ 0
breakout right \nto micro
Text Notes 9450 900  0    60   ~ 0
breakout left to fm
$Comp
L mycelium_pcb-rescue:CONN_01X01 J35
U 1 1 5B4051FB
P 8450 1700
F 0 "J35" H 8369 1475 50  0000 C CNN
F 1 "BREAKOUT" H 8450 1600 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_SMD_5x10mm" H 8450 1700 50  0001 C CNN
F 3 "" H 8450 1700 50  0001 C CNN
	1    8450 1700
	-1   0    0    1   
$EndComp
$Comp
L mycelium_pcb-rescue:CONN_01X01 J33
U 1 1 5B405202
P 8450 1300
F 0 "J33" H 8369 1075 50  0000 C CNN
F 1 "BREAKOUT" H 8450 1200 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_SMD_5x10mm" H 8450 1300 50  0001 C CNN
F 3 "" H 8450 1300 50  0001 C CNN
	1    8450 1300
	-1   0    0    1   
$EndComp
$Comp
L mycelium_pcb-rescue:CONN_01X01 J34
U 1 1 5B405209
P 8450 1500
F 0 "J34" H 8369 1275 50  0000 C CNN
F 1 "BREAKOUT" H 8450 1400 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_SMD_5x10mm" H 8450 1500 50  0001 C CNN
F 3 "" H 8450 1500 50  0001 C CNN
	1    8450 1500
	-1   0    0    1   
$EndComp
$Comp
L mycelium_pcb-rescue:CONN_01X01 J36
U 1 1 5B405210
P 8450 1900
F 0 "J36" H 8369 1675 50  0000 C CNN
F 1 "BREAKOUT" H 8450 1800 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_SMD_5x10mm" H 8450 1900 50  0001 C CNN
F 3 "" H 8450 1900 50  0001 C CNN
	1    8450 1900
	-1   0    0    1   
$EndComp
$Comp
L mycelium_pcb-rescue:GND-power #PWR051
U 1 1 5B40522C
P 8800 1700
F 0 "#PWR051" H 8800 1450 50  0001 C CNN
F 1 "GND" H 8950 1650 50  0000 C CNN
F 2 "" H 8800 1700 50  0001 C CNN
F 3 "" H 8800 1700 50  0001 C CNN
	1    8800 1700
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:+3.3V-power #PWR052
U 1 1 5B405232
P 8800 1500
F 0 "#PWR052" H 8800 1350 50  0001 C CNN
F 1 "+3.3V" H 8815 1673 50  0000 C CNN
F 2 "" H 8800 1500 50  0001 C CNN
F 3 "" H 8800 1500 50  0001 C CNN
	1    8800 1500
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:CONN_01X01 J38
U 1 1 5B405244
P 8450 2300
F 0 "J38" H 8369 2075 50  0000 C CNN
F 1 "BREAKOUT" H 8450 2200 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_SMD_5x10mm" H 8450 2300 50  0001 C CNN
F 3 "" H 8450 2300 50  0001 C CNN
	1    8450 2300
	-1   0    0    1   
$EndComp
Text Label 8850 2300 0    60   ~ 0
MUSH_555
$Comp
L mycelium_pcb-rescue:CONN_01X01 J40
U 1 1 5B405A36
P 10450 1750
F 0 "J40" H 10528 1791 50  0000 L CNN
F 1 "EDGE" H 10528 1700 50  0000 L CNN
F 2 "Wire_Pads:SolderWirePad_single_SMD_5x10mm" H 10450 1750 50  0001 C CNN
F 3 "" H 10450 1750 50  0001 C CNN
	1    10450 1750
	1    0    0    1   
$EndComp
Text Label 9900 1750 2    60   ~ 0
HF_OUTT
$Comp
L mycelium_pcb-rescue:CONN_01X01 J39
U 1 1 5B405A41
P 10450 1200
F 0 "J39" H 10528 1241 50  0000 L CNN
F 1 "EDGE" H 10528 1150 50  0000 L CNN
F 2 "Wire_Pads:SolderWirePad_single_SMD_5x10mm" H 10450 1200 50  0001 C CNN
F 3 "" H 10450 1200 50  0001 C CNN
	1    10450 1200
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:GND-power #PWR053
U 1 1 5B405A48
P 10150 1250
F 0 "#PWR053" H 10150 1000 50  0001 C CNN
F 1 "GND" H 10155 1077 50  0000 C CNN
F 2 "" H 10150 1250 50  0001 C CNN
F 3 "" H 10150 1250 50  0001 C CNN
	1    10150 1250
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:CONN_01X01 J41
U 1 1 5B405A50
P 10450 2000
F 0 "J41" H 10528 2041 50  0000 L CNN
F 1 "EDGE" H 10528 1950 50  0000 L CNN
F 2 "Wire_Pads:SolderWirePad_single_SMD_5x10mm" H 10450 2000 50  0001 C CNN
F 3 "" H 10450 2000 50  0001 C CNN
	1    10450 2000
	1    0    0    1   
$EndComp
Text Label 9900 2000 2    60   ~ 0
MUSH_555
$Comp
L mycelium_pcb-rescue:VCC-power #PWR054
U 1 1 5B4069E7
P 8800 1200
F 0 "#PWR054" H 8800 1050 50  0001 C CNN
F 1 "VCC" H 8817 1373 50  0000 C CNN
F 2 "" H 8800 1200 50  0001 C CNN
F 3 "" H 8800 1200 50  0001 C CNN
	1    8800 1200
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:VCC-power #PWR055
U 1 1 5B4071E4
P 2200 2450
F 0 "#PWR055" H 2200 2300 50  0001 C CNN
F 1 "VCC" H 2217 2623 50  0000 C CNN
F 2 "" H 2200 2450 50  0001 C CNN
F 3 "" H 2200 2450 50  0001 C CNN
	1    2200 2450
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:GND-power #PWR056
U 1 1 5B40743C
P 2200 4100
F 0 "#PWR056" H 2200 3850 50  0001 C CNN
F 1 "GND" H 2205 3927 50  0000 C CNN
F 2 "" H 2200 4100 50  0001 C CNN
F 3 "" H 2200 4100 50  0001 C CNN
	1    2200 4100
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:R-device R27
U 1 1 5B407480
P 2500 2900
F 0 "R27" H 2570 2946 50  0000 L CNN
F 1 "100K" H 2570 2855 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2430 2900 50  0001 C CNN
F 3 "" H 2500 2900 50  0001 C CNN
	1    2500 2900
	0    1    1    0   
$EndComp
$Comp
L mycelium_pcb-rescue:C-device C27
U 1 1 5B40754C
P 2500 2650
F 0 "C27" V 2248 2650 50  0000 C CNN
F 1 "10nF" V 2339 2650 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2538 2500 50  0001 C CNN
F 3 "" H 2500 2650 50  0001 C CNN
	1    2500 2650
	0    -1   -1   0   
$EndComp
$Comp
L mycelium_pcb-rescue:C-device C26
U 1 1 5B40765D
P 1550 3400
F 0 "C26" V 1298 3400 50  0000 C CNN
F 1 "100nF" V 1389 3400 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1588 3250 50  0001 C CNN
F 3 "" H 1550 3400 50  0001 C CNN
	1    1550 3400
	0    -1   -1   0   
$EndComp
$Comp
L mycelium_pcb-rescue:R-device R24
U 1 1 5B407722
P 1800 2850
F 0 "R24" H 1870 2896 50  0000 L CNN
F 1 "10K" H 1870 2805 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1730 2850 50  0001 C CNN
F 3 "" H 1800 2850 50  0001 C CNN
	1    1800 2850
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:R-device R25
U 1 1 5B407830
P 1800 3850
F 0 "R25" H 1870 3896 50  0000 L CNN
F 1 "10K" H 1870 3805 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1730 3850 50  0001 C CNN
F 3 "" H 1800 3850 50  0001 C CNN
	1    1800 3850
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:R-device R26
U 1 1 5B4078E6
P 2200 2800
F 0 "R26" H 2270 2846 50  0000 L CNN
F 1 "100R" H 2270 2755 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2130 2800 50  0001 C CNN
F 3 "" H 2200 2800 50  0001 C CNN
	1    2200 2800
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:CONN_01X01 J30
U 1 1 5B408227
P 1100 3400
F 0 "J30" H 1019 3175 50  0000 C CNN
F 1 "RFIN" H 1100 3300 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 1100 3400 50  0001 C CNN
F 3 "" H 1100 3400 50  0001 C CNN
	1    1100 3400
	-1   0    0    1   
$EndComp
Text Label 3100 3300 0    60   ~ 0
HF_OUTT
$Comp
L mycelium_pcb-rescue:C-device C28
U 1 1 5B40AB80
P 2950 2650
F 0 "C28" H 3065 2696 50  0000 L CNN
F 1 "100nF" H 3050 2600 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2988 2500 50  0001 C CNN
F 3 "" H 2950 2650 50  0001 C CNN
	1    2950 2650
	1    0    0    -1  
$EndComp
Text Notes 3000 2550 0    60   ~ 0
decouple
$Comp
L mycelium_pcb-rescue:VCC-power #PWR057
U 1 1 5B40AB88
P 2950 2350
F 0 "#PWR057" H 2950 2200 50  0001 C CNN
F 1 "VCC" H 2950 2500 50  0000 C CNN
F 2 "" H 2950 2350 50  0001 C CNN
F 3 "" H 2950 2350 50  0001 C CNN
	1    2950 2350
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:GND-power #PWR058
U 1 1 5B40AB8E
P 2950 2850
F 0 "#PWR058" H 2950 2600 50  0001 C CNN
F 1 "GND" H 2955 2677 50  0000 C CNN
F 2 "" H 2950 2850 50  0001 C CNN
F 3 "" H 2950 2850 50  0001 C CNN
	1    2950 2850
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:+3.3V-power #PWR059
U 1 1 5B40B99D
P 5850 2800
F 0 "#PWR059" H 5850 2650 50  0001 C CNN
F 1 "+3.3V" H 5865 2973 50  0000 C CNN
F 2 "" H 5850 2800 50  0001 C CNN
F 3 "" H 5850 2800 50  0001 C CNN
	1    5850 2800
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:GND-power #PWR060
U 1 1 5B40B9CE
P 5850 4000
F 0 "#PWR060" H 5850 3750 50  0001 C CNN
F 1 "GND" H 5855 3827 50  0000 C CNN
F 2 "" H 5850 4000 50  0001 C CNN
F 3 "" H 5850 4000 50  0001 C CNN
	1    5850 4000
	1    0    0    -1  
$EndComp
Text Label 6900 3500 0    60   ~ 0
MUSH_555
$Comp
L mycelium_pcb-rescue:LMC555xM-linear U7
U 1 1 5B40BC12
P 5850 3500
F 0 "U7" H 5850 4078 50  0000 C CNN
F 1 "LMC555xM" H 5850 3987 50  0000 C CNN
F 2 "SMD_Packages:SOIC-8-N" H 5850 3500 50  0001 C CNN
F 3 "" H 5850 3500 50  0001 C CNN
	1    5850 3500
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:R-device R29
U 1 1 5B40C0A3
P 5150 3100
F 0 "R29" H 5220 3146 50  0000 L CNN
F 1 "150K" H 5220 3055 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5080 3100 50  0001 C CNN
F 3 "" H 5150 3100 50  0001 C CNN
	1    5150 3100
	-1   0    0    1   
$EndComp
$Comp
L mycelium_pcb-rescue:R-device R28
U 1 1 5B40C2C3
P 4850 3300
F 0 "R28" H 4920 3346 50  0000 L CNN
F 1 "390R" H 4920 3255 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4780 3300 50  0001 C CNN
F 3 "" H 4850 3300 50  0001 C CNN
	1    4850 3300
	0    -1   -1   0   
$EndComp
$Comp
L mycelium_pcb-rescue:C-device C29
U 1 1 5B40C3EB
P 4500 2950
F 0 "C29" H 4615 2996 50  0000 L CNN
F 1 "2.2uF" H 4600 2900 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-A_EIA-3216-18_Hand" H 4538 2800 50  0001 C CNN
F 3 "" H 4500 2950 50  0001 C CNN
	1    4500 2950
	0    1    1    0   
$EndComp
$Comp
L mycelium_pcb-rescue:C-device C30
U 1 1 5B40C4E4
P 4500 3300
F 0 "C30" H 4615 3346 50  0000 L CNN
F 1 "2.2uF" H 4600 3250 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-A_EIA-3216-18_Hand" H 4538 3150 50  0001 C CNN
F 3 "" H 4500 3300 50  0001 C CNN
	1    4500 3300
	0    1    1    0   
$EndComp
$Comp
L mycelium_pcb-rescue:CONN_01X01 J31
U 1 1 5B40C6BB
P 4050 2950
F 0 "J31" H 3969 2725 50  0000 C CNN
F 1 "MUSH" H 4050 2850 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 4050 2950 50  0001 C CNN
F 3 "" H 4050 2950 50  0001 C CNN
	1    4050 2950
	-1   0    0    1   
$EndComp
$Comp
L mycelium_pcb-rescue:CONN_01X01 J32
U 1 1 5B40C7B2
P 4050 3300
F 0 "J32" H 3969 3075 50  0000 C CNN
F 1 "MUSH" H 4050 3200 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 4050 3300 50  0001 C CNN
F 3 "" H 4050 3300 50  0001 C CNN
	1    4050 3300
	-1   0    0    1   
$EndComp
$Comp
L mycelium_pcb-rescue:+3.3V-power #PWR061
U 1 1 5B40CC8F
P 4700 3800
F 0 "#PWR061" H 4700 3650 50  0001 C CNN
F 1 "+3.3V" H 4715 3973 50  0000 C CNN
F 2 "" H 4700 3800 50  0001 C CNN
F 3 "" H 4700 3800 50  0001 C CNN
	1    4700 3800
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:CP-device C32
U 1 1 5B40EF5A
P 6750 2600
F 0 "C32" V 6495 2600 50  0000 C CNN
F 1 "2.2uF" V 6586 2600 50  0000 C CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-A_EIA-3216-18_Hand" H 6788 2450 50  0001 C CNN
F 3 "" H 6750 2600 50  0001 C CNN
	1    6750 2600
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:+3.3V-power #PWR062
U 1 1 5B40F0CC
P 6750 2400
F 0 "#PWR062" H 6750 2250 50  0001 C CNN
F 1 "+3.3V" H 6765 2573 50  0000 C CNN
F 2 "" H 6750 2400 50  0001 C CNN
F 3 "" H 6750 2400 50  0001 C CNN
	1    6750 2400
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:GND-power #PWR063
U 1 1 5B40F10D
P 6750 2850
F 0 "#PWR063" H 6750 2600 50  0001 C CNN
F 1 "GND" H 6755 2677 50  0000 C CNN
F 2 "" H 6750 2850 50  0001 C CNN
F 3 "" H 6750 2850 50  0001 C CNN
	1    6750 2850
	1    0    0    -1  
$EndComp
Text Notes 6900 2350 0    60   ~ 0
decouple
Text Notes 8350 3150 0    60   ~ 0
humidity - HIH6131 3.3v -scl and sda - i2C
$Comp
L mycelium_pcb-rescue:+3.3V-power #PWR064
U 1 1 5B4115E8
P 8600 3900
F 0 "#PWR064" H 8600 3750 50  0001 C CNN
F 1 "+3.3V" H 8615 4073 50  0000 C CNN
F 2 "" H 8600 3900 50  0001 C CNN
F 3 "" H 8600 3900 50  0001 C CNN
	1    8600 3900
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:CONN_01X01 J37
U 1 1 5B419056
P 8450 2100
F 0 "J37" H 8369 1875 50  0000 C CNN
F 1 "BREAKOUT" H 8450 2000 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_SMD_5x10mm" H 8450 2100 50  0001 C CNN
F 3 "" H 8450 2100 50  0001 C CNN
	1    8450 2100
	-1   0    0    1   
$EndComp
$Comp
L mycelium_pcb-rescue:HIH6131-SparkFun-AnalogIC M1
U 1 1 5B4194B6
P 9300 4350
F 0 "M1" H 9300 4915 50  0000 C CNN
F 1 "HIH6131" H 9300 4824 50  0000 C CNN
F 2 "SMD_Packages:SOIC-8-N" H 9330 4500 20  0001 C CNN
F 3 "" H 9300 4350 60  0001 C CNN
F 4 "HIG6131-021-001" H 9300 4350 50  0001 C CNN "Notes"
	1    9300 4350
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:CP-device C34
U 1 1 5B419614
P 10450 3250
F 0 "C34" V 10195 3250 50  0000 C CNN
F 1 "220nF" V 10286 3250 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 10488 3100 50  0001 C CNN
F 3 "" H 10450 3250 50  0001 C CNN
	1    10450 3250
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:+3.3V-power #PWR065
U 1 1 5B41961B
P 10450 3050
F 0 "#PWR065" H 10450 2900 50  0001 C CNN
F 1 "+3.3V" H 10465 3223 50  0000 C CNN
F 2 "" H 10450 3050 50  0001 C CNN
F 3 "" H 10450 3050 50  0001 C CNN
	1    10450 3050
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:GND-power #PWR066
U 1 1 5B419621
P 10450 3500
F 0 "#PWR066" H 10450 3250 50  0001 C CNN
F 1 "GND" H 10455 3327 50  0000 C CNN
F 2 "" H 10450 3500 50  0001 C CNN
F 3 "" H 10450 3500 50  0001 C CNN
	1    10450 3500
	1    0    0    -1  
$EndComp
Text Notes 10600 3000 0    60   ~ 0
decouple
$Comp
L mycelium_pcb-rescue:R-device R30
U 1 1 5B41A094
P 10050 3900
F 0 "R30" H 10120 3946 50  0000 L CNN
F 1 "10K" H 10120 3855 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 9980 3900 50  0001 C CNN
F 3 "" H 10050 3900 50  0001 C CNN
	1    10050 3900
	-1   0    0    1   
$EndComp
$Comp
L mycelium_pcb-rescue:C-device C33
U 1 1 5B41A460
P 8450 4400
F 0 "C33" H 8565 4446 50  0000 L CNN
F 1 "100nF" H 8550 4350 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 8488 4250 50  0001 C CNN
F 3 "" H 8450 4400 50  0001 C CNN
	1    8450 4400
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:GND-power #PWR067
U 1 1 5B41A64B
P 8450 4650
F 0 "#PWR067" H 8450 4400 50  0001 C CNN
F 1 "GND" H 8455 4477 50  0000 C CNN
F 2 "" H 8450 4650 50  0001 C CNN
F 3 "" H 8450 4650 50  0001 C CNN
	1    8450 4650
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:C-device C31
U 1 1 5B40CB0F
P 5000 3550
F 0 "C31" H 5115 3596 50  0000 L CNN
F 1 "100nF" H 5100 3500 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5038 3400 50  0001 C CNN
F 3 "" H 5000 3550 50  0001 C CNN
	1    5000 3550
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:R-device R31
U 1 1 5B3F20BB
P 10700 3900
F 0 "R31" H 10770 3946 50  0000 L CNN
F 1 "10K" H 10770 3855 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 10630 3900 50  0001 C CNN
F 3 "" H 10700 3900 50  0001 C CNN
	1    10700 3900
	-1   0    0    1   
$EndComp
Text Label 8800 1900 0    60   ~ 0
SDA
Text Label 8800 2100 0    60   ~ 0
SCL
Text Label 10900 4250 0    60   ~ 0
SDA
Text Label 10350 4050 0    60   ~ 0
SCL
Wire Wire Line
	8800 1300 8650 1300
Wire Wire Line
	8800 1200 8800 1300
Wire Wire Line
	8650 1500 8800 1500
Wire Wire Line
	8650 1700 8800 1700
Wire Wire Line
	8650 1900 8800 1900
Wire Wire Line
	8650 2300 8850 2300
Wire Wire Line
	10250 1750 9900 1750
Wire Wire Line
	10150 1250 10150 1200
Wire Wire Line
	10150 1200 10250 1200
Wire Wire Line
	10250 2000 9900 2000
Wire Wire Line
	2200 3000 2200 2950
Wire Wire Line
	2200 2650 2200 2550
Wire Wire Line
	2200 3600 2200 4000
Wire Wire Line
	1800 4000 2200 4000
Connection ~ 2200 4000
Wire Wire Line
	2000 3200 1800 3200
Wire Wire Line
	1800 3000 1800 3200
Connection ~ 1800 3200
Wire Wire Line
	1800 2700 1800 2550
Wire Wire Line
	1800 2550 2200 2550
Connection ~ 2200 2550
Wire Wire Line
	1300 3400 1400 3400
Wire Wire Line
	1950 3400 1950 2650
Wire Wire Line
	1950 2650 2350 2650
Connection ~ 1950 3400
Wire Wire Line
	2350 2650 2350 2900
Wire Wire Line
	2650 2650 2650 2900
Wire Wire Line
	2600 3300 2650 3300
Connection ~ 2650 2900
Connection ~ 2650 3300
Wire Wire Line
	2950 2500 2950 2350
Wire Wire Line
	2950 2850 2950 2800
Wire Wire Line
	6350 3500 6850 3500
Wire Wire Line
	5850 4000 5850 3950
Wire Wire Line
	5850 2800 5850 3100
Wire Wire Line
	6350 3700 6450 3700
Wire Wire Line
	6450 3700 6450 3100
Wire Wire Line
	6450 3100 5350 3100
Wire Wire Line
	5350 3100 5350 3300
Wire Wire Line
	6350 3300 6600 3300
Wire Wire Line
	6600 3300 6600 2950
Wire Wire Line
	6600 2950 5150 2950
Wire Wire Line
	5150 3300 5150 3250
Connection ~ 5150 2950
Connection ~ 5150 3300
Wire Wire Line
	4250 2950 4350 2950
Wire Wire Line
	5000 3700 5000 3950
Wire Wire Line
	5000 3950 5850 3950
Connection ~ 5850 3950
Wire Wire Line
	4700 3800 5350 3800
Wire Wire Line
	5350 3800 5350 3700
Wire Wire Line
	6750 2450 6750 2400
Wire Wire Line
	6750 2750 6750 2850
Wire Wire Line
	8650 2100 8800 2100
Wire Wire Line
	10450 3100 10450 3050
Wire Wire Line
	10450 3400 10450 3500
Wire Wire Line
	8600 3900 8600 4050
Wire Wire Line
	8700 4250 8450 4250
Wire Wire Line
	8700 4450 8450 4450
Wire Wire Line
	8450 4450 8450 4550
Connection ~ 8450 4550
Wire Wire Line
	9900 4050 10050 4050
Wire Wire Line
	8700 3750 10050 3750
Wire Wire Line
	9900 4250 10700 4250
Wire Wire Line
	5000 3400 5000 3300
Connection ~ 5000 3300
Wire Wire Line
	4250 3300 4350 3300
Wire Wire Line
	4650 3300 4700 3300
Wire Wire Line
	5000 3300 5150 3300
Connection ~ 10050 4050
Connection ~ 10050 3750
Wire Wire Line
	10700 4250 10700 4050
Connection ~ 10700 4250
Wire Wire Line
	8600 4050 8650 4050
Wire Wire Line
	8700 3750 8700 4000
Wire Wire Line
	8700 4000 8650 4000
Wire Wire Line
	8650 4000 8650 4050
Connection ~ 8650 4050
Wire Wire Line
	1700 3400 1950 3400
$Comp
L mycelium_pcb-rescue:Conn_01x02-Connector J22
U 1 1 5B44F636
P 4300 1400
F 0 "J22" H 4220 1075 50  0000 C CNN
F 1 "Conn_01x02" H 4220 1166 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x02_Pitch2.54mm" H 4300 1400 50  0001 C CNN
F 3 "" H 4300 1400 50  0001 C CNN
	1    4300 1400
	-1   0    0    1   
$EndComp
Text Notes 4200 900  0    60   ~ 0
power in
$Comp
L mycelium_pcb-rescue:VCC-power #PWR068
U 1 1 5B44F777
P 4800 1250
F 0 "#PWR068" H 4800 1100 50  0001 C CNN
F 1 "VCC" H 4817 1423 50  0000 C CNN
F 2 "" H 4800 1250 50  0001 C CNN
F 3 "" H 4800 1250 50  0001 C CNN
	1    4800 1250
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:GND-power #PWR069
U 1 1 5B44F7C4
P 4800 1450
F 0 "#PWR069" H 4800 1200 50  0001 C CNN
F 1 "GND" H 4805 1277 50  0000 C CNN
F 2 "" H 4800 1450 50  0001 C CNN
F 3 "" H 4800 1450 50  0001 C CNN
	1    4800 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 1300 4800 1300
Wire Wire Line
	4800 1300 4800 1250
Wire Wire Line
	4500 1400 4800 1400
Wire Wire Line
	4800 1400 4800 1450
$Comp
L mycelium_pcb-rescue:R-device R15
U 1 1 5B46E339
P 6850 3300
F 0 "R15" H 6920 3346 50  0000 L CNN
F 1 "10K" H 6920 3255 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6780 3300 50  0001 C CNN
F 3 "" H 6850 3300 50  0001 C CNN
	1    6850 3300
	-1   0    0    1   
$EndComp
$Comp
L mycelium_pcb-rescue:+3.3V-power #PWR070
U 1 1 5B46E3CD
P 6950 3050
F 0 "#PWR070" H 6950 2900 50  0001 C CNN
F 1 "+3.3V" H 6965 3223 50  0000 C CNN
F 2 "" H 6950 3050 50  0001 C CNN
F 3 "" H 6950 3050 50  0001 C CNN
	1    6950 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 3150 6950 3150
Wire Wire Line
	6950 3150 6950 3050
Wire Wire Line
	6850 3450 6850 3500
Connection ~ 6850 3500
Text Notes 6650 3700 0    60   ~ 0
optional pullup
Wire Wire Line
	2200 4000 2200 4100
Wire Wire Line
	1800 3200 1800 3700
Wire Wire Line
	2200 2550 2200 2450
Wire Wire Line
	1950 3400 2000 3400
Wire Wire Line
	2650 2900 2650 3300
Wire Wire Line
	2650 3300 3100 3300
Wire Wire Line
	5150 2950 4650 2950
Wire Wire Line
	5150 3300 5350 3300
Wire Wire Line
	5850 3950 5850 3900
Wire Wire Line
	8450 4550 8450 4650
Wire Wire Line
	10050 4050 10350 4050
Wire Wire Line
	10050 3750 10700 3750
Wire Wire Line
	10700 4250 10900 4250
Wire Wire Line
	8650 4050 8700 4050
Wire Wire Line
	6850 3500 6900 3500
$EndSCHEMATC
