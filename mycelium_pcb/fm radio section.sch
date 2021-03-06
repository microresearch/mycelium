EESchema Schematic File Version 4
LIBS:mycelium_pcb-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Connection ~ 5000 1250
Wire Wire Line
	5000 1100 5300 1100
Wire Wire Line
	5000 1250 5000 1100
Connection ~ 5300 1600
Wire Wire Line
	5300 1600 5300 1400
$Comp
L mycelium_pcb-rescue:CTRIM-device C4
U 1 1 5B3BDC9C
P 5300 1250
F 0 "C4" H 5416 1296 50  0000 L CNN
F 1 "10pF-50pF" H 5416 1205 50  0000 L CNN
F 2 "Capacitors_SMD:C_Trimmer_Murata_TZC3" H 5300 1250 50  0001 C CNN
F 3 "" H 5300 1250 50  0001 C CNN
F 4 "TZC03 30P (reich)" H 5300 1250 50  0001 C CNN "Notes"
	1    5300 1250
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:GND-power #PWR026
U 1 1 5B3BDCA3
P 5100 2650
F 0 "#PWR026" H 5100 2400 50  0001 C CNN
F 1 "GND" H 5105 2477 50  0000 C CNN
F 2 "" H 5100 2650 50  0001 C CNN
F 3 "" H 5100 2650 50  0001 C CNN
	1    5100 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 2300 5500 2300
$Comp
L mycelium_pcb-rescue:CONN_01X01 J9
U 1 1 5B3BDCAA
P 5700 2300
F 0 "J9" H 5778 2341 50  0000 L CNN
F 1 "ANTENNA" H 5778 2250 50  0000 L CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 5700 2300 50  0001 C CNN
F 3 "" H 5700 2300 50  0001 C CNN
	1    5700 2300
	1    0    0    -1  
$EndComp
Connection ~ 5450 2100
Wire Wire Line
	5450 1600 5450 1500
$Comp
L mycelium_pcb-rescue:CONN_01X01 J6
U 1 1 5B3BDCB3
P 5700 2100
F 0 "J6" H 5778 2141 50  0000 L CNN
F 1 "CAP" H 5778 2050 50  0000 L CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 5700 2100 50  0001 C CNN
F 3 "" H 5700 2100 50  0001 C CNN
	1    5700 2100
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:CONN_01X01 J5
U 1 1 5B3BDCBA
P 5650 1500
F 0 "J5" H 5728 1541 50  0000 L CNN
F 1 "CAP" H 5728 1450 50  0000 L CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 5650 1500 50  0001 C CNN
F 3 "" H 5650 1500 50  0001 C CNN
	1    5650 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 1450 4250 1350
Connection ~ 4600 1350
Wire Wire Line
	4550 1350 4600 1350
$Comp
L mycelium_pcb-rescue:GND-power #PWR027
U 1 1 5B3BDCCB
P 4250 1450
F 0 "#PWR027" H 4250 1200 50  0001 C CNN
F 1 "GND" H 4255 1277 50  0000 C CNN
F 2 "" H 4250 1450 50  0001 C CNN
F 3 "" H 4250 1450 50  0001 C CNN
	1    4250 1450
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:C-device C1
U 1 1 5B3BDCD1
P 4400 1350
F 0 "C1" V 4148 1350 50  0000 C CNN
F 1 "10nF" V 4239 1350 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4438 1200 50  0001 C CNN
F 3 "" H 4400 1350 50  0001 C CNN
	1    4400 1350
	0    1    1    0   
$EndComp
Connection ~ 5100 2100
Wire Wire Line
	5100 2100 5450 2100
Wire Wire Line
	5450 1900 5450 2100
Wire Wire Line
	5450 1600 5300 1600
Connection ~ 4600 1250
Wire Wire Line
	4600 1250 5000 1250
Wire Wire Line
	5100 1600 5100 1550
$Comp
L mycelium_pcb-rescue:L-device L1
U 1 1 5B3BDCDF
P 5100 1400
F 0 "L1" H 5153 1446 50  0000 L CNN
F 1 "COIL" H 5153 1355 50  0000 L CNN
F 2 "Inductors:INDUCTOR_V" H 5100 1400 50  0001 C CNN
F 3 "" H 5100 1400 50  0001 C CNN
F 4 "0.8mmm handwound coil" H 5100 1400 50  0001 C CNN "Notes"
	1    5100 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 2650 5100 2450
Wire Wire Line
	5100 2150 5100 2100
Wire Wire Line
	4800 1800 4800 1900
Connection ~ 4600 2400
Wire Wire Line
	4800 2400 4800 2200
Wire Wire Line
	4600 2400 4800 2400
Wire Wire Line
	4600 2450 4600 2400
Connection ~ 4600 1800
Wire Wire Line
	4600 1700 4600 1800
Wire Wire Line
	4600 900  4600 1250
Wire Wire Line
	4550 1800 4600 1800
$Comp
L mycelium_pcb-rescue:GND-power #PWR028
U 1 1 5B3BDCF2
P 4600 2450
F 0 "#PWR028" H 4600 2200 50  0001 C CNN
F 1 "GND" H 4605 2277 50  0000 C CNN
F 2 "" H 4600 2450 50  0001 C CNN
F 3 "" H 4600 2450 50  0001 C CNN
	1    4600 2450
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:C-device C3
U 1 1 5B3BDCFF
P 4800 2050
F 0 "C3" H 4915 2096 50  0000 L CNN
F 1 "1nF" H 4915 2005 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4838 1900 50  0001 C CNN
F 3 "" H 4800 2050 50  0001 C CNN
	1    4800 2050
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:C-device C10
U 1 1 5B3BDD06
P 5450 1750
F 0 "C10" H 5565 1796 50  0000 L CNN
F 1 "10pf or replace conns" H 5565 1705 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 5488 1600 50  0001 C CNN
F 3 "" H 5450 1750 50  0001 C CNN
	1    5450 1750
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:R-device R6
U 1 1 5B3BDD0D
P 4600 1550
F 0 "R6" H 4670 1596 50  0000 L CNN
F 1 "27K" H 4670 1505 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4530 1550 50  0001 C CNN
F 3 "" H 4600 1550 50  0001 C CNN
	1    4600 1550
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:R-device R7
U 1 1 5B3BDD14
P 4600 2150
F 0 "R7" H 4670 2196 50  0000 L CNN
F 1 "10K" H 4670 2105 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4530 2150 50  0001 C CNN
F 3 "" H 4600 2150 50  0001 C CNN
	1    4600 2150
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:R-device R8
U 1 1 5B3BDD1B
P 5100 2300
F 0 "R8" H 5170 2346 50  0000 L CNN
F 1 "470R" H 5170 2255 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5030 2300 50  0001 C CNN
F 3 "" H 5100 2300 50  0001 C CNN
	1    5100 2300
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:BC547 Q1
U 1 1 5B3BDD22
P 5000 1800
AR Path="/5B3BDD22" Ref="Q1"  Part="1" 
AR Path="/5B3BD90D/5B3BDD22" Ref="Q1"  Part="1" 
F 0 "Q1" H 5191 1846 50  0000 L CNN
F 1 "2n2222" H 5191 1755 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 5200 1725 50  0001 L CIN
F 3 "" H 5000 1800 50  0001 L CNN
F 4 "2N 2222A SMD (reich)" H 5000 1800 50  0001 C CNN "Notes"
	1    5000 1800
	1    0    0    -1  
$EndComp
Text Notes 8550 700  0    79   ~ 16
FM transmission + amp + 4093 + 74xx
Text Notes 1250 4400 0    60   ~ 12
4093 as theremin and as straight HF (only one side)
Text Notes 6250 4550 0    60   ~ 12
7404 as transmitter
$Comp
L mycelium_pcb-rescue:HEF4093B-Logic_CMOS_4000 U4
U 1 1 5B3C40F4
P 1850 6500
F 0 "U4" H 1850 6825 50  0000 C CNN
F 1 "HEF4093B" H 1850 6734 50  0000 C CNN
F 2 "SMD_Packages:SSOP-14" H 1850 6500 50  0001 C CNN
F 3 "" H 1850 6500 50  0001 C CNN
	1    1850 6500
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:HEF4093B-Logic_CMOS_4000 U4
U 2 1 5B3C4200
P 1950 5500
F 0 "U4" H 1950 5825 50  0000 C CNN
F 1 "HEF4093B" H 1950 5734 50  0000 C CNN
F 2 "SMD_Packages:SSOP-14" H 1950 5500 50  0001 C CNN
F 3 "" H 1950 5500 50  0001 C CNN
	2    1950 5500
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:C-device C12
U 1 1 5B3C493D
P 850 4650
F 0 "C12" H 965 4696 50  0000 L CNN
F 1 "100nF" H 950 4600 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 888 4500 50  0001 C CNN
F 3 "" H 850 4650 50  0001 C CNN
	1    850  4650
	1    0    0    -1  
$EndComp
Text Notes 900  4550 0    60   ~ 0
decouple
$Comp
L mycelium_pcb-rescue:VCC-power #PWR029
U 1 1 5B3C4DAD
P 3200 1200
F 0 "#PWR029" H 3200 1050 50  0001 C CNN
F 1 "VCC" H 3217 1373 50  0000 C CNN
F 2 "" H 3200 1200 50  0001 C CNN
F 3 "" H 3200 1200 50  0001 C CNN
	1    3200 1200
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:VCC-power #PWR030
U 1 1 5B3C4E47
P 5750 650
F 0 "#PWR030" H 5750 500 50  0001 C CNN
F 1 "VCC" H 5767 823 50  0000 C CNN
F 2 "" H 5750 650 50  0001 C CNN
F 3 "" H 5750 650 50  0001 C CNN
	1    5750 650 
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:VCC-power #PWR031
U 1 1 5B3C4F91
P 3850 1100
F 0 "#PWR031" H 3850 950 50  0001 C CNN
F 1 "VCC" H 3867 1273 50  0000 C CNN
F 2 "" H 3850 1100 50  0001 C CNN
F 3 "" H 3850 1100 50  0001 C CNN
	1    3850 1100
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:MCP602-linear U3
U 1 1 5B3C5524
P 2950 5600
F 0 "U3" H 3050 5800 50  0000 L CNN
F 1 "MCP602" H 2950 5400 50  0000 L CNN
F 2 "SMD_Packages:SOIC-8-N" H 2950 5600 50  0001 C CNN
F 3 "" H 2950 5600 50  0001 C CNN
	1    2950 5600
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:C-device C22
U 1 1 5B3C6146
P 7400 4500
F 0 "C22" H 7515 4546 50  0000 L CNN
F 1 "100nF" H 7500 4450 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 7438 4350 50  0001 C CNN
F 3 "" H 7400 4500 50  0001 C CNN
	1    7400 4500
	1    0    0    -1  
$EndComp
Text Notes 7750 4550 0    60   ~ 0
decouple
$Comp
L mycelium_pcb-rescue:VCC-power #PWR032
U 1 1 5B3C6556
P 1450 6250
F 0 "#PWR032" H 1450 6100 50  0001 C CNN
F 1 "VCC" H 1467 6423 50  0000 C CNN
F 2 "" H 1450 6250 50  0001 C CNN
F 3 "" H 1450 6250 50  0001 C CNN
	1    1450 6250
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:VCC-power #PWR033
U 1 1 5B3C65F2
P 1600 5250
F 0 "#PWR033" H 1600 5100 50  0001 C CNN
F 1 "VCC" H 1617 5423 50  0000 C CNN
F 2 "" H 1600 5250 50  0001 C CNN
F 3 "" H 1600 5250 50  0001 C CNN
	1    1600 5250
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:VCC-power #PWR034
U 1 1 5B3C66A8
P 3000 5100
F 0 "#PWR034" H 3000 4950 50  0001 C CNN
F 1 "VCC" H 3000 5050 50  0000 C CNN
F 2 "" H 3000 5100 50  0001 C CNN
F 3 "" H 3000 5100 50  0001 C CNN
	1    3000 5100
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:GND-power #PWR035
U 1 1 5B3C670A
P 1300 6850
F 0 "#PWR035" H 1300 6600 50  0001 C CNN
F 1 "GND" H 1305 6677 50  0000 C CNN
F 2 "" H 1300 6850 50  0001 C CNN
F 3 "" H 1300 6850 50  0001 C CNN
	1    1300 6850
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:VCC-power #PWR036
U 1 1 5B3C6862
P 850 4350
F 0 "#PWR036" H 850 4200 50  0001 C CNN
F 1 "VCC" H 850 4500 50  0000 C CNN
F 2 "" H 850 4350 50  0001 C CNN
F 3 "" H 850 4350 50  0001 C CNN
	1    850  4350
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:GND-power #PWR037
U 1 1 5B3C68A7
P 1450 5850
F 0 "#PWR037" H 1450 5600 50  0001 C CNN
F 1 "GND" H 1455 5677 50  0000 C CNN
F 2 "" H 1450 5850 50  0001 C CNN
F 3 "" H 1450 5850 50  0001 C CNN
	1    1450 5850
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:GND-power #PWR038
U 1 1 5B3C6DBF
P 850 4850
F 0 "#PWR038" H 850 4600 50  0001 C CNN
F 1 "GND" H 855 4677 50  0000 C CNN
F 2 "" H 850 4850 50  0001 C CNN
F 3 "" H 850 4850 50  0001 C CNN
	1    850  4850
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:C-device C13
U 1 1 5B3C6ED1
P 1300 6650
F 0 "C13" H 1415 6696 50  0000 L CNN
F 1 "100pF" H 1415 6605 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 1338 6500 50  0001 C CNN
F 3 "" H 1300 6650 50  0001 C CNN
	1    1300 6650
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:C-device C14
U 1 1 5B3C700E
P 1450 5650
F 0 "C14" H 1565 5696 50  0000 L CNN
F 1 "100pF" H 1565 5605 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 1488 5500 50  0001 C CNN
F 3 "" H 1450 5650 50  0001 C CNN
	1    1450 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 6500 1300 6500
Wire Wire Line
	1450 6250 1450 6400
Wire Wire Line
	1450 6400 1550 6400
Wire Wire Line
	1600 5250 1600 5400
Wire Wire Line
	1600 5400 1650 5400
Wire Wire Line
	1650 5600 1650 5500
Wire Wire Line
	1650 5500 1600 5500
Wire Wire Line
	850  4500 850  4350
Wire Wire Line
	850  4850 850  4800
$Comp
L mycelium_pcb-rescue:R-device R9
U 1 1 5B3C754C
P 1700 6850
F 0 "R9" H 1770 6896 50  0000 L CNN
F 1 "15K" H 1770 6805 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1630 6850 50  0001 C CNN
F 3 "" H 1700 6850 50  0001 C CNN
	1    1700 6850
	0    1    1    0   
$EndComp
Wire Wire Line
	1850 6850 2150 6850
Wire Wire Line
	2150 6850 2150 6500
$Comp
L mycelium_pcb-rescue:R-device R10
U 1 1 5B3C7876
P 1750 5850
F 0 "R10" H 1820 5896 50  0000 L CNN
F 1 "10K" H 1820 5805 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1680 5850 50  0001 C CNN
F 3 "" H 1750 5850 50  0001 C CNN
	1    1750 5850
	0    1    1    0   
$EndComp
Wire Wire Line
	1600 5850 1600 5500
Connection ~ 1600 5500
$Comp
L mycelium_pcb-rescue:POT_TRIM-device RV1
U 1 1 5B3C7A6D
P 2100 5850
F 0 "RV1" V 1893 5850 50  0000 C CNN
F 1 "10K" V 1984 5850 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer-EVM3E" H 2100 5850 50  0001 C CNN
F 3 "" H 2100 5850 50  0001 C CNN
	1    2100 5850
	0    1    1    0   
$EndComp
Wire Wire Line
	1900 5850 1950 5850
$Comp
L mycelium_pcb-rescue:R-device R11
U 1 1 5B3C7F18
P 2350 6500
F 0 "R11" H 2420 6546 50  0000 L CNN
F 1 "10K" H 2420 6455 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2280 6500 50  0001 C CNN
F 3 "" H 2350 6500 50  0001 C CNN
	1    2350 6500
	0    1    1    0   
$EndComp
$Comp
L mycelium_pcb-rescue:R-device R12
U 1 1 5B3C7F8C
P 2450 5500
F 0 "R12" H 2520 5546 50  0000 L CNN
F 1 "10K" H 2520 5455 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2380 5500 50  0001 C CNN
F 3 "" H 2450 5500 50  0001 C CNN
	1    2450 5500
	0    1    1    0   
$EndComp
Wire Wire Line
	2250 5500 2300 5500
Wire Wire Line
	2600 5500 2650 5500
Wire Wire Line
	2150 6500 2200 6500
Wire Wire Line
	2500 6500 2650 6500
Wire Wire Line
	2650 6500 2650 6300
Text Notes 1000 5500 0    60   ~ 0
ANT
$Comp
L mycelium_pcb-rescue:CONN_01X01 J18
U 1 1 5B3C8C35
P 900 6500
F 0 "J18" H 819 6275 50  0000 C CNN
F 1 "CONN_01X01" H 900 6350 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 900 6500 50  0001 C CNN
F 3 "" H 900 6500 50  0001 C CNN
	1    900  6500
	-1   0    0    1   
$EndComp
Connection ~ 2250 5500
Text Notes 900  6150 0    60   ~ 0
ANT
$Comp
L mycelium_pcb-rescue:R-device R13
U 1 1 5B3C9566
P 2600 5150
F 0 "R13" H 2670 5196 50  0000 L CNN
F 1 "10K" H 2670 5105 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2530 5150 50  0001 C CNN
F 3 "" H 2600 5150 50  0001 C CNN
	1    2600 5150
	-1   0    0    1   
$EndComp
Wire Wire Line
	2600 5500 2600 5300
$Comp
L mycelium_pcb-rescue:GND-power #PWR039
U 1 1 5B3C966C
P 2800 5000
F 0 "#PWR039" H 2800 4750 50  0001 C CNN
F 1 "GND" H 2805 4827 50  0000 C CNN
F 2 "" H 2800 5000 50  0001 C CNN
F 3 "" H 2800 5000 50  0001 C CNN
	1    2800 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 5000 2800 5000
Wire Wire Line
	3000 5100 3000 5300
Wire Wire Line
	3000 5300 2850 5300
$Comp
L mycelium_pcb-rescue:GND-power #PWR040
U 1 1 5B3C9964
P 2850 5950
F 0 "#PWR040" H 2850 5700 50  0001 C CNN
F 1 "GND" H 2855 5777 50  0000 C CNN
F 2 "" H 2850 5950 50  0001 C CNN
F 3 "" H 2850 5950 50  0001 C CNN
	1    2850 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 5900 2850 5950
$Comp
L mycelium_pcb-rescue:R-device R14
U 1 1 5B3C9C4A
P 2950 6300
F 0 "R14" H 3020 6346 50  0000 L CNN
F 1 "10K" H 3020 6255 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2880 6300 50  0001 C CNN
F 3 "" H 2950 6300 50  0001 C CNN
	1    2950 6300
	0    1    1    0   
$EndComp
Wire Wire Line
	2650 6300 2800 6300
Connection ~ 2650 6300
Wire Wire Line
	3100 6300 3250 6300
Wire Wire Line
	3250 6300 3250 5600
$Comp
L mycelium_pcb-rescue:R-device R17
U 1 1 5B3C9DE3
P 3500 5600
F 0 "R17" H 3570 5646 50  0000 L CNN
F 1 "6.8K" H 3570 5555 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3430 5600 50  0001 C CNN
F 3 "" H 3500 5600 50  0001 C CNN
	1    3500 5600
	0    1    1    0   
$EndComp
Wire Wire Line
	1450 5800 1450 5850
$Comp
L mycelium_pcb-rescue:GND-power #PWR041
U 1 1 5B3CA17D
P 3650 6000
F 0 "#PWR041" H 3650 5750 50  0001 C CNN
F 1 "GND" H 3655 5827 50  0000 C CNN
F 2 "" H 3650 6000 50  0001 C CNN
F 3 "" H 3650 6000 50  0001 C CNN
	1    3650 6000
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:C-device C17
U 1 1 5B3CA24B
P 3650 5800
F 0 "C17" H 3765 5846 50  0000 L CNN
F 1 "1nF" H 3765 5755 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 3688 5650 50  0001 C CNN
F 3 "" H 3650 5800 50  0001 C CNN
	1    3650 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 5600 3350 5600
Wire Wire Line
	3650 5650 3650 5600
Wire Wire Line
	3650 6000 3650 5950
Wire Wire Line
	3650 5600 3800 5600
Text Notes 5750 -50  0    60   ~ 0
Edge conns:\n5V=VCC\nGND\nSIGNAL FROM PWM_LP_OUT\nSIGNAL FROM RF\nSIGNAL FROM MEMS\n
$Comp
L mycelium_pcb-rescue:Jumper_NO_Small-device JP3
U 1 1 5B3D468A
P 1650 1400
F 0 "JP3" H 1650 1585 50  0000 C CNN
F 1 "Jumper_NO_Small" H 1650 1494 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 1650 1400 50  0001 C CNN
F 3 "" H 1650 1400 50  0001 C CNN
	1    1650 1400
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:Jumper_NO_Small-device JP4
U 1 1 5B3D46F2
P 1650 1700
F 0 "JP4" H 1650 1885 50  0000 C CNN
F 1 "Jumper_NO_Small" H 1650 1794 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 1650 1700 50  0001 C CNN
F 3 "" H 1650 1700 50  0001 C CNN
	1    1650 1700
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:74HC04-Logic_74xx U5
U 4 1 5B3D7748
P 8900 5400
F 0 "U5" H 8900 5717 50  0000 C CNN
F 1 "74HC04" H 8900 5626 50  0000 C CNN
F 2 "SMD_Packages:SOIC-14_N" H 8900 5400 50  0001 C CNN
F 3 "" H 8900 5400 50  0001 C CNN
	4    8900 5400
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:74HC04-Logic_74xx U5
U 3 1 5B3D76CA
P 6400 5400
F 0 "U5" H 6400 5717 50  0000 C CNN
F 1 "74HC04" H 6400 5626 50  0000 C CNN
F 2 "SMD_Packages:SOIC-14_N" H 6400 5400 50  0001 C CNN
F 3 "" H 6400 5400 50  0001 C CNN
	3    6400 5400
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:74HC04-Logic_74xx U5
U 2 1 5B3D761F
P 5700 5400
F 0 "U5" H 5700 5717 50  0000 C CNN
F 1 "74HC04" H 5700 5626 50  0000 C CNN
F 2 "SMD_Packages:SOIC-14_N" H 5700 5400 50  0001 C CNN
F 3 "" H 5700 5400 50  0001 C CNN
	2    5700 5400
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:74HC04-Logic_74xx U5
U 1 1 5B3D7575
P 5350 4900
F 0 "U5" H 5400 5000 50  0000 C CNN
F 1 "74HC04" H 5350 5100 50  0000 C CNN
F 2 "SMD_Packages:SOIC-14_N" H 5350 4900 50  0001 C CNN
F 3 "" H 5350 4900 50  0001 C CNN
	1    5350 4900
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:74HC04-Logic_74xx U5
U 6 1 5B3D7E31
P 7500 5400
F 0 "U5" H 7500 5717 50  0000 C CNN
F 1 "74HC04" H 7500 5626 50  0000 C CNN
F 2 "SMD_Packages:SOIC-14_N" H 7500 5400 50  0001 C CNN
F 3 "" H 7500 5400 50  0001 C CNN
	6    7500 5400
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:74HC04-Logic_74xx U5
U 5 1 5B3D7E38
P 8200 5400
F 0 "U5" H 8200 5717 50  0000 C CNN
F 1 "74HC04" H 8200 5626 50  0000 C CNN
F 2 "SMD_Packages:SOIC-14_N" H 8200 5400 50  0001 C CNN
F 3 "" H 8200 5400 50  0001 C CNN
	5    8200 5400
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:CP-device C19
U 1 1 5B3D91D2
P 4500 4900
F 0 "C19" V 4245 4900 50  0000 C CNN
F 1 "10uF" V 4336 4900 50  0000 C CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-A_EIA-3216-18_Hand" H 4538 4750 50  0001 C CNN
F 3 "" H 4500 4900 50  0001 C CNN
	1    4500 4900
	0    1    1    0   
$EndComp
$Comp
L mycelium_pcb-rescue:R-device R18
U 1 1 5B3D93F9
P 4850 4900
F 0 "R18" H 4920 4946 50  0000 L CNN
F 1 "4.7K" H 4920 4855 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4780 4900 50  0001 C CNN
F 3 "" H 4850 4900 50  0001 C CNN
	1    4850 4900
	0    1    1    0   
$EndComp
$Comp
L mycelium_pcb-rescue:R-device R20
U 1 1 5B3D9EDA
P 5900 4900
F 0 "R20" H 5970 4946 50  0000 L CNN
F 1 "4.7K" H 5970 4855 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5830 4900 50  0001 C CNN
F 3 "" H 5900 4900 50  0001 C CNN
	1    5900 4900
	0    1    1    0   
$EndComp
$Comp
L mycelium_pcb-rescue:R-device R19
U 1 1 5B3D9F74
P 5350 4400
F 0 "R19" H 5420 4446 50  0000 L CNN
F 1 "47K" H 5420 4355 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5280 4400 50  0001 C CNN
F 3 "" H 5350 4400 50  0001 C CNN
	1    5350 4400
	0    1    1    0   
$EndComp
$Comp
L mycelium_pcb-rescue:C-device C21
U 1 1 5B3DA422
P 6900 5400
F 0 "C21" H 7015 5446 50  0000 L CNN
F 1 "33pF" H 7015 5355 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6938 5250 50  0001 C CNN
F 3 "" H 6900 5400 50  0001 C CNN
	1    6900 5400
	0    1    1    0   
$EndComp
$Comp
L mycelium_pcb-rescue:C-device C23
U 1 1 5B3DB211
P 8400 5800
F 0 "C23" H 8515 5846 50  0000 L CNN
F 1 "10pF" H 8515 5755 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 8438 5650 50  0001 C CNN
F 3 "" H 8400 5800 50  0001 C CNN
	1    8400 5800
	0    1    1    0   
$EndComp
$Comp
L mycelium_pcb-rescue:R-device R22
U 1 1 5B3DB807
P 7850 5650
F 0 "R22" H 7920 5696 50  0000 L CNN
F 1 "1K" H 7920 5605 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 7780 5650 50  0001 C CNN
F 3 "" H 7850 5650 50  0001 C CNN
	1    7850 5650
	-1   0    0    1   
$EndComp
$Comp
L mycelium_pcb-rescue:R-device R21
U 1 1 5B3DBA5A
P 6050 5700
F 0 "R21" H 6120 5746 50  0000 L CNN
F 1 "1K" H 6120 5655 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5980 5700 50  0001 C CNN
F 3 "" H 6050 5700 50  0001 C CNN
	1    6050 5700
	-1   0    0    1   
$EndComp
$Comp
L mycelium_pcb-rescue:C-device C20
U 1 1 5B3DBB72
P 6200 6450
F 0 "C20" H 6315 6496 50  0000 L CNN
F 1 "33pF" H 6315 6405 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6238 6300 50  0001 C CNN
F 3 "" H 6200 6450 50  0001 C CNN
	1    6200 6450
	0    1    1    0   
$EndComp
Wire Wire Line
	2100 6000 2350 6000
Wire Wire Line
	2350 6000 2350 5850
Wire Wire Line
	2350 5750 2250 5750
Wire Wire Line
	2250 5750 2250 5500
$Comp
L mycelium_pcb-rescue:POT_TRIM-device RV2
U 1 1 5B3DC26B
P 6050 6100
F 0 "RV2" V 5843 6100 50  0000 C CNN
F 1 "2.5K" V 5934 6100 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer-EVM3E" H 6050 6100 50  0001 C CNN
F 3 "" H 6050 6100 50  0001 C CNN
	1    6050 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 4900 4700 4900
Wire Wire Line
	4350 4900 4200 4900
Wire Wire Line
	5000 4900 5050 4900
Wire Wire Line
	5650 4900 5750 4900
Wire Wire Line
	5050 4900 5050 4400
Wire Wire Line
	5050 4400 5200 4400
Wire Wire Line
	5500 4400 5650 4400
Wire Wire Line
	5650 4400 5650 4900
Wire Wire Line
	6000 5400 6050 5400
Wire Wire Line
	6050 4900 6050 5400
Connection ~ 6050 5400
Wire Wire Line
	6050 5850 6050 5950
Wire Wire Line
	6050 6450 5400 6450
Wire Wire Line
	5400 6450 5400 5400
Wire Wire Line
	6750 5400 6700 5400
Wire Wire Line
	6350 6450 6750 6450
Wire Wire Line
	6750 6450 6750 5400
Wire Wire Line
	7050 5400 7100 5400
Wire Wire Line
	7800 5400 7850 5400
Wire Wire Line
	7100 5400 7100 5800
Wire Wire Line
	7100 5800 7850 5800
Connection ~ 7100 5400
Wire Wire Line
	7850 5500 7850 5400
Connection ~ 7850 5400
Connection ~ 7850 5800
Wire Wire Line
	8500 5400 8550 5400
Wire Wire Line
	8550 5800 8550 5400
Connection ~ 8550 5400
$Comp
L mycelium_pcb-rescue:CONN_01X01 J24
U 1 1 5B3DEA6D
P 9500 5400
F 0 "J24" H 9578 5441 50  0000 L CNN
F 1 "ANTENNA" H 9578 5350 50  0000 L CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 9500 5400 50  0001 C CNN
F 3 "" H 9500 5400 50  0001 C CNN
	1    9500 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 5400 9300 5400
Wire Wire Line
	6200 6100 6200 6350
Wire Wire Line
	6200 6350 6050 6350
Wire Wire Line
	6050 6250 6050 6350
Wire Wire Line
	3200 1700 3400 1700
Wire Wire Line
	3300 1150 3300 1900
Wire Wire Line
	3850 1400 3850 1100
Wire Wire Line
	3600 1400 3850 1400
Wire Wire Line
	3600 1500 3600 1400
Wire Wire Line
	4000 1800 4200 1800
Wire Wire Line
	4000 1150 4000 1800
Wire Wire Line
	3800 1150 4000 1150
Wire Wire Line
	3300 1150 3500 1150
$Comp
L mycelium_pcb-rescue:R-device R5
U 1 1 5B3BE87F
P 3650 1150
F 0 "R5" H 3720 1196 50  0000 L CNN
F 1 "10K" H 3720 1105 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3580 1150 50  0001 C CNN
F 3 "" H 3650 1150 50  0001 C CNN
	1    3650 1150
	0    1    1    0   
$EndComp
Wire Wire Line
	3600 2100 3600 2250
$Comp
L mycelium_pcb-rescue:GND-power #PWR042
U 1 1 5B3BE81F
P 3600 2250
F 0 "#PWR042" H 3600 2000 50  0001 C CNN
F 1 "GND" H 3605 2077 50  0000 C CNN
F 2 "" H 3600 2250 50  0001 C CNN
F 3 "" H 3600 2250 50  0001 C CNN
	1    3600 2250
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:GND-power #PWR043
U 1 1 5B3BE7AF
P 3000 2250
F 0 "#PWR043" H 3000 2000 50  0001 C CNN
F 1 "GND" H 3005 2077 50  0000 C CNN
F 2 "" H 3000 2250 50  0001 C CNN
F 3 "" H 3000 2250 50  0001 C CNN
	1    3000 2250
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:R-device R3
U 1 1 5B3BE767
P 3000 2000
F 0 "R3" H 3070 2046 50  0000 L CNN
F 1 "100K" H 3070 1955 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2930 2000 50  0001 C CNN
F 3 "" H 3000 2000 50  0001 C CNN
	1    3000 2000
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:R-device R2
U 1 1 5B3BE6E7
P 3200 1550
F 0 "R2" H 3270 1596 50  0000 L CNN
F 1 "100K" H 3270 1505 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3130 1550 50  0001 C CNN
F 3 "" H 3200 1550 50  0001 C CNN
	1    3200 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 1400 3200 1200
$Comp
L mycelium_pcb-rescue:CP-device C2
U 1 1 5B3BDCF8
P 2850 1750
F 0 "C2" V 2595 1750 50  0000 C CNN
F 1 "1uF" V 2686 1750 50  0000 C CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-A_EIA-3216-18_Hand" H 2888 1600 50  0001 C CNN
F 3 "" H 2850 1750 50  0001 C CNN
	1    2850 1750
	0    1    1    0   
$EndComp
Wire Wire Line
	3000 1750 3200 1750
$Comp
L mycelium_pcb-rescue:C-device C18
U 1 1 5B3E4C35
P 4400 1800
F 0 "C18" V 4148 1800 50  0000 C CNN
F 1 "330nF" V 4239 1800 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 4438 1650 50  0001 C CNN
F 3 "" H 4400 1800 50  0001 C CNN
	1    4400 1800
	0    1    1    0   
$EndComp
$Comp
L mycelium_pcb-rescue:R-device R16
U 1 1 5B3E4F71
P 3350 2250
F 0 "R16" H 3420 2296 50  0000 L CNN
F 1 "1K5" H 3420 2205 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3280 2250 50  0001 C CNN
F 3 "" H 3350 2250 50  0001 C CNN
	1    3350 2250
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:GND-power #PWR044
U 1 1 5B3E5003
P 3350 2850
F 0 "#PWR044" H 3350 2600 50  0001 C CNN
F 1 "GND" H 3355 2677 50  0000 C CNN
F 2 "" H 3350 2850 50  0001 C CNN
F 3 "" H 3350 2850 50  0001 C CNN
	1    3350 2850
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:C-device C16
U 1 1 5B3E50B9
P 3350 2600
F 0 "C16" V 3098 2600 50  0000 C CNN
F 1 "4.7nF" V 3189 2600 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" H 3388 2450 50  0001 C CNN
F 3 "" H 3350 2600 50  0001 C CNN
	1    3350 2600
	-1   0    0    1   
$EndComp
Wire Wire Line
	3350 2100 3350 1900
Connection ~ 3350 1900
Wire Wire Line
	3350 2450 3350 2400
Wire Wire Line
	3350 2850 3350 2750
Wire Wire Line
	3200 1750 3200 1700
Wire Wire Line
	3000 1850 3000 1750
Wire Wire Line
	3000 2250 3000 2150
Text Notes 1150 2500 0    60   ~ 0
see values here:\nhttp://sound.whsites.net/project54.htm
Connection ~ 1750 1400
Wire Wire Line
	1550 1400 1000 1400
Text Label 3800 5600 0    60   ~ 0
THER_OUT
Text Label 1000 1400 0    60   ~ 0
THER_OUT
$Comp
L mycelium_pcb-rescue:Jumper_NO_Small-device JP1
U 1 1 5B3E9E27
P 1650 900
F 0 "JP1" H 1650 1085 50  0000 C CNN
F 1 "Jumper_NO_Small" H 1650 994 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 1650 900 50  0001 C CNN
F 3 "" H 1650 900 50  0001 C CNN
	1    1650 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 900  1000 900 
Connection ~ 4200 1800
Text Label 1000 900  0    60   ~ 0
PWM_LF_OUTT
Text Label 1050 1700 0    60   ~ 0
HF_OUTT
$Comp
L mycelium_pcb-rescue:CONN_01X01 J19
U 1 1 5B3ED833
P 7250 1250
F 0 "J19" H 7328 1291 50  0000 L CNN
F 1 "EDGE" H 7328 1200 50  0000 L CNN
F 2 "Wire_Pads:SolderWirePad_single_SMD_5x10mm" H 7250 1250 50  0001 C CNN
F 3 "" H 7250 1250 50  0001 C CNN
	1    7250 1250
	-1   0    0    1   
$EndComp
$Comp
L mycelium_pcb-rescue:CONN_01X01 J20
U 1 1 5B3EE182
P 7250 1500
F 0 "J20" H 7328 1541 50  0000 L CNN
F 1 "EDGE" H 7328 1450 50  0000 L CNN
F 2 "Wire_Pads:SolderWirePad_single_SMD_5x10mm" H 7250 1500 50  0001 C CNN
F 3 "" H 7250 1500 50  0001 C CNN
	1    7250 1500
	-1   0    0    1   
$EndComp
$Comp
L mycelium_pcb-rescue:CONN_01X01 J21
U 1 1 5B3EE218
P 7250 1750
F 0 "J21" H 7328 1791 50  0000 L CNN
F 1 "EDGE" H 7328 1700 50  0000 L CNN
F 2 "Wire_Pads:SolderWirePad_single_SMD_5x10mm" H 7250 1750 50  0001 C CNN
F 3 "" H 7250 1750 50  0001 C CNN
	1    7250 1750
	-1   0    0    1   
$EndComp
$Comp
L mycelium_pcb-rescue:CONN_01X01 J23
U 1 1 5B3EE346
P 9950 1600
F 0 "J23" H 10028 1641 50  0000 L CNN
F 1 "EDGE" H 10028 1550 50  0000 L CNN
F 2 "Wire_Pads:SolderWirePad_single_SMD_5x10mm" H 9950 1600 50  0001 C CNN
F 3 "" H 9950 1600 50  0001 C CNN
	1    9950 1600
	1    0    0    1   
$EndComp
$Comp
L mycelium_pcb-rescue:GND-power #PWR045
U 1 1 5B3EE607
P 7550 1500
F 0 "#PWR045" H 7550 1250 50  0001 C CNN
F 1 "GND" H 7555 1327 50  0000 C CNN
F 2 "" H 7550 1500 50  0001 C CNN
F 3 "" H 7550 1500 50  0001 C CNN
	1    7550 1500
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:VCC-power #PWR046
U 1 1 5B3EED51
P 7550 1250
F 0 "#PWR046" H 7550 1100 50  0001 C CNN
F 1 "VCC" H 7567 1423 50  0000 C CNN
F 2 "" H 7550 1250 50  0001 C CNN
F 3 "" H 7550 1250 50  0001 C CNN
	1    7550 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 1250 7550 1250
Wire Wire Line
	7450 1500 7550 1500
Wire Wire Line
	7450 1750 7800 1750
Wire Wire Line
	9750 1600 9400 1600
Text Label 7800 1750 0    60   ~ 0
PWM_LF_OUTT
Text Label 9400 1600 2    60   ~ 0
HF_OUTT
$Comp
L mycelium_pcb-rescue:Jumper_NO_Small-device JP5
U 1 1 5B3F513A
P 4200 2850
F 0 "JP5" V 4154 2898 50  0000 L CNN
F 1 "Jumper_NO_Small" V 4245 2898 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 4200 2850 50  0001 C CNN
F 3 "" H 4200 2850 50  0001 C CNN
	1    4200 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	4200 4900 4200 2950
Wire Wire Line
	4200 1800 4200 2750
Text Notes 7200 950  0    60   ~ 0
left from micro
Text Notes 9200 950  0    60   ~ 0
right from sensors
$Comp
L mycelium_pcb-rescue:CONN_01X01 J28
U 1 1 5B3FE4E5
P 9950 1200
F 0 "J28" H 10028 1241 50  0000 L CNN
F 1 "EDGE" H 10028 1150 50  0000 L CNN
F 2 "Wire_Pads:SolderWirePad_single_SMD_5x10mm" H 9950 1200 50  0001 C CNN
F 3 "" H 9950 1200 50  0001 C CNN
	1    9950 1200
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:GND-power #PWR047
U 1 1 5B3FE6CD
P 9650 1250
F 0 "#PWR047" H 9650 1000 50  0001 C CNN
F 1 "GND" H 9655 1077 50  0000 C CNN
F 2 "" H 9650 1250 50  0001 C CNN
F 3 "" H 9650 1250 50  0001 C CNN
	1    9650 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 1250 9650 1200
Wire Wire Line
	9650 1200 9750 1200
$Comp
L mycelium_pcb-rescue:Jumper_NO_Small-device JP2
U 1 1 5B402744
P 1650 700
F 0 "JP2" H 1650 885 50  0000 C CNN
F 1 "Jumper_NO_Small" H 1650 794 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 1650 700 50  0001 C CNN
F 3 "" H 1650 700 50  0001 C CNN
	1    1650 700 
	1    0    0    -1  
$EndComp
Connection ~ 1750 900 
Text Label 1000 700  0    60   ~ 0
555_OUTT
$Comp
L mycelium_pcb-rescue:CONN_01X01 J29
U 1 1 5B403A9B
P 9950 1850
F 0 "J29" H 10028 1891 50  0000 L CNN
F 1 "EDGE" H 10028 1800 50  0000 L CNN
F 2 "Wire_Pads:SolderWirePad_single_SMD_5x10mm" H 9950 1850 50  0001 C CNN
F 3 "" H 9950 1850 50  0001 C CNN
	1    9950 1850
	1    0    0    1   
$EndComp
Wire Wire Line
	9750 1850 9400 1850
Text Label 9400 1850 0    60   ~ 0
555_OUTT
Wire Wire Line
	1750 700  1750 900 
$Comp
L mycelium_pcb-rescue:Q_PMOS_GSD-device Q2
U 1 1 5B41E1D9
P 5850 950
F 0 "Q2" H 6056 904 50  0000 L CNN
F 1 "Q_PMOS_GSD" H 6056 995 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 6050 1050 50  0001 C CNN
F 3 "" H 5850 950 50  0001 C CNN
F 4 "NXP2301P-reichelt" H 5850 950 50  0001 C CNN "Notes"
	1    5850 950 
	-1   0    0    1   
$EndComp
Wire Wire Line
	5750 750  5750 650 
Wire Wire Line
	5750 1150 5450 1150
Wire Wire Line
	5450 1150 5450 900 
Wire Wire Line
	5450 900  4600 900 
$Comp
L mycelium_pcb-rescue:CONN_01X01 J27
U 1 1 5B420EF0
P 7250 1950
F 0 "J27" H 7328 1991 50  0000 L CNN
F 1 "EDGE" H 7328 1900 50  0000 L CNN
F 2 "Wire_Pads:SolderWirePad_single_SMD_5x10mm" H 7250 1950 50  0001 C CNN
F 3 "" H 7250 1950 50  0001 C CNN
	1    7250 1950
	-1   0    0    1   
$EndComp
Wire Wire Line
	7450 1950 7800 1950
Text Label 7800 1950 0    60   ~ 0
RF_EN
Wire Wire Line
	6050 950  6200 950 
Text Label 6200 950  0    60   ~ 0
RF_EN
Text Notes 7700 1150 0    60   ~ 0
5V
Text Notes 5900 700  0    60   ~ 0
checked
Wire Wire Line
	1300 6850 1300 6800
$Comp
L mycelium_pcb-rescue:GND-power #PWR048
U 1 1 5B415875
P 7400 4800
F 0 "#PWR048" H 7400 4550 50  0001 C CNN
F 1 "GND" H 7405 4627 50  0000 C CNN
F 2 "" H 7400 4800 50  0001 C CNN
F 3 "" H 7400 4800 50  0001 C CNN
	1    7400 4800
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:VCC-power #PWR049
U 1 1 5B41590C
P 7400 4250
F 0 "#PWR049" H 7400 4100 50  0001 C CNN
F 1 "VCC" H 7417 4423 50  0000 C CNN
F 2 "" H 7400 4250 50  0001 C CNN
F 3 "" H 7400 4250 50  0001 C CNN
	1    7400 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 4350 7400 4250
Wire Wire Line
	7400 4650 7400 4800
Wire Wire Line
	1050 1700 1550 1700
Wire Wire Line
	3300 1900 3350 1900
$Comp
L mycelium_pcb-rescue:MCP602-linear U3
U 2 1 5B3FE275
P 3700 1800
F 0 "U3" H 4041 1846 50  0000 L CNN
F 1 "MCP602" H 4041 1755 50  0000 L CNN
F 2 "SMD_Packages:SOIC-8-N" H 3700 1800 50  0001 C CNN
F 3 "" H 3700 1800 50  0001 C CNN
	2    3700 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 700  1550 700 
Connection ~ 1300 6500
Wire Wire Line
	2250 5850 2350 5850
Connection ~ 2350 5850
Connection ~ 6050 6350
$Comp
L mycelium_pcb-rescue:POT_TRIM-device RV3
U 1 1 5B467D8A
P 2300 1750
F 0 "RV3" V 2093 1750 50  0000 C CNN
F 1 "10K" V 2184 1750 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer-EVM3E" H 2300 1750 50  0001 C CNN
F 3 "" H 2300 1750 50  0001 C CNN
F 4 "23b-2.0K (reich)" V 2300 1750 50  0001 C CNN "Notes"
	1    2300 1750
	1    0    0    -1  
$EndComp
$Comp
L mycelium_pcb-rescue:GND-power #PWR050
U 1 1 5B4681DD
P 2300 1950
F 0 "#PWR050" H 2300 1700 50  0001 C CNN
F 1 "GND" H 2305 1777 50  0000 C CNN
F 2 "" H 2300 1950 50  0001 C CNN
F 3 "" H 2300 1950 50  0001 C CNN
	1    2300 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 1750 2700 1750
Wire Wire Line
	1750 1700 2100 1700
Wire Wire Line
	2100 1700 2100 1600
Wire Wire Line
	2100 1600 2300 1600
Wire Wire Line
	2300 1950 2300 1900
Text Notes 5000 3050 0    60   ~ 0
pins are wrong for smd 2n2222 - corrected on pcb
Wire Wire Line
	1450 5500 1450 5350
$Comp
L mycelium_pcb-rescue:CONN_01X01 J17
U 1 1 5B3C8AE9
P 1250 5350
F 0 "J17" H 1169 5125 50  0000 C CNN
F 1 "CONN_01X01" H 1250 5200 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 1250 5350 50  0001 C CNN
F 3 "" H 1250 5350 50  0001 C CNN
	1    1250 5350
	-1   0    0    1   
$EndComp
Wire Wire Line
	5000 1250 5100 1250
Wire Wire Line
	5300 1600 5100 1600
Wire Wire Line
	5450 2100 5500 2100
Wire Wire Line
	5450 2100 5450 2300
Wire Wire Line
	4600 1350 4600 1400
Wire Wire Line
	5100 2100 5100 2000
Wire Wire Line
	4600 1250 4600 1350
Wire Wire Line
	4600 2400 4600 2300
Wire Wire Line
	4600 1800 4600 2000
Wire Wire Line
	4600 1800 4800 1800
Wire Wire Line
	1600 5500 1450 5500
Wire Wire Line
	2650 6300 2650 5700
Wire Wire Line
	6050 5400 6100 5400
Wire Wire Line
	6050 5400 6050 5550
Wire Wire Line
	7100 5400 7200 5400
Wire Wire Line
	7850 5400 7900 5400
Wire Wire Line
	7850 5800 8250 5800
Wire Wire Line
	8550 5400 8600 5400
Wire Wire Line
	3350 1900 3400 1900
Wire Wire Line
	1750 1400 1750 1700
Wire Wire Line
	4200 1800 4250 1800
Wire Wire Line
	1750 900  1750 1400
Wire Wire Line
	1300 6500 1550 6500
Wire Wire Line
	2350 5850 2350 5750
Wire Wire Line
	6050 6350 6050 6450
Wire Wire Line
	1550 6500 1550 6850
$EndSCHEMATC
