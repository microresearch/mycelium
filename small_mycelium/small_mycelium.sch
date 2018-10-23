EESchema Schematic File Version 4
LIBS:small_mycelium-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L small_mycelium-rescue:C-device-mycelium_pcb-rescue C3
U 1 1 5B3C6146
P 4350 1950
F 0 "C3" H 4465 1996 50  0000 L CNN
F 1 "100nF" H 4450 1900 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D7.5mm_W5.0mm_P5.00mm" H 4388 1800 50  0001 C CNN
F 3 "" H 4350 1950 50  0001 C CNN
	1    4350 1950
	1    0    0    -1  
$EndComp
$Comp
L small_mycelium-rescue:74HC04-Logic_74xx-mycelium_pcb-rescue U1
U 4 1 5B3D7748
P 5850 2850
F 0 "U1" H 5850 3167 50  0000 C CNN
F 1 "74HC04" H 5850 3076 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm_LongPads" H 5850 2850 50  0001 C CNN
F 3 "" H 5850 2850 50  0001 C CNN
	4    5850 2850
	1    0    0    -1  
$EndComp
$Comp
L small_mycelium-rescue:74HC04-Logic_74xx-mycelium_pcb-rescue U1
U 1 1 5B3D76CA
P 3350 2850
F 0 "U1" H 3350 3167 50  0000 C CNN
F 1 "74HC04" H 3350 3076 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm_LongPads" H 3350 2850 50  0001 C CNN
F 3 "" H 3350 2850 50  0001 C CNN
	1    3350 2850
	1    0    0    -1  
$EndComp
$Comp
L small_mycelium-rescue:74HC04-Logic_74xx-mycelium_pcb-rescue U1
U 6 1 5B3D7E31
P 4450 2850
F 0 "U1" H 4450 3167 50  0000 C CNN
F 1 "74HC04" H 4450 3076 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm_LongPads" H 4450 2850 50  0001 C CNN
F 3 "" H 4450 2850 50  0001 C CNN
	6    4450 2850
	1    0    0    -1  
$EndComp
$Comp
L small_mycelium-rescue:74HC04-Logic_74xx-mycelium_pcb-rescue U1
U 5 1 5B3D7E38
P 5150 2850
F 0 "U1" H 5150 3167 50  0000 C CNN
F 1 "74HC04" H 5150 3076 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm_LongPads" H 5150 2850 50  0001 C CNN
F 3 "" H 5150 2850 50  0001 C CNN
	5    5150 2850
	1    0    0    -1  
$EndComp
$Comp
L small_mycelium-rescue:C-device-mycelium_pcb-rescue C2
U 1 1 5B3DA422
P 3850 2850
F 0 "C2" H 3965 2896 50  0000 L CNN
F 1 "33pF" H 3965 2805 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D7.5mm_W5.0mm_P5.00mm" H 3888 2700 50  0001 C CNN
F 3 "" H 3850 2850 50  0001 C CNN
	1    3850 2850
	0    1    1    0   
$EndComp
$Comp
L small_mycelium-rescue:C-device-mycelium_pcb-rescue C4
U 1 1 5B3DB211
P 5350 3250
F 0 "C4" H 5465 3296 50  0000 L CNN
F 1 "10pF" H 5465 3205 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D7.5mm_W5.0mm_P5.00mm" H 5388 3100 50  0001 C CNN
F 3 "" H 5350 3250 50  0001 C CNN
	1    5350 3250
	0    1    1    0   
$EndComp
$Comp
L small_mycelium-rescue:R-device-mycelium_pcb-rescue R3
U 1 1 5B3DB807
P 4800 3100
F 0 "R3" H 4870 3146 50  0000 L CNN
F 1 "1K" H 4870 3055 50  0000 L CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4730 3100 50  0001 C CNN
F 3 "" H 4800 3100 50  0001 C CNN
	1    4800 3100
	-1   0    0    1   
$EndComp
$Comp
L small_mycelium-rescue:C-device-mycelium_pcb-rescue C1
U 1 1 5B3DBB72
P 3000 3450
F 0 "C1" H 3115 3496 50  0000 L CNN
F 1 "10pF" H 3115 3405 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D7.5mm_W5.0mm_P5.00mm" H 3038 3300 50  0001 C CNN
F 3 "" H 3000 3450 50  0001 C CNN
	1    3000 3450
	-1   0    0    1   
$EndComp
Wire Wire Line
	3700 2850 3650 2850
Wire Wire Line
	4000 2850 4050 2850
Wire Wire Line
	4750 2850 4800 2850
Wire Wire Line
	4050 2850 4050 3250
Wire Wire Line
	4050 3250 4800 3250
Connection ~ 4050 2850
Wire Wire Line
	4800 2950 4800 2850
Connection ~ 4800 2850
Connection ~ 4800 3250
Wire Wire Line
	5450 2850 5500 2850
Wire Wire Line
	5500 3250 5500 2850
Connection ~ 5500 2850
$Comp
L small_mycelium-rescue:CONN_01X01-mycelium_pcb-rescue J3
U 1 1 5B3DEA6D
P 6450 2850
F 0 "J3" H 6528 2891 50  0000 L CNN
F 1 "transmit antenna" H 6528 2800 50  0000 L CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 6450 2850 50  0001 C CNN
F 3 "" H 6450 2850 50  0001 C CNN
	1    6450 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 2850 6250 2850
$Comp
L small_mycelium-rescue:GND-power-mycelium_pcb-rescue #PWR02
U 1 1 5B415875
P 4350 2250
F 0 "#PWR02" H 4350 2000 50  0001 C CNN
F 1 "GND" H 4355 2077 50  0000 C CNN
F 2 "" H 4350 2250 50  0001 C CNN
F 3 "" H 4350 2250 50  0001 C CNN
	1    4350 2250
	1    0    0    -1  
$EndComp
$Comp
L small_mycelium-rescue:VCC-power-mycelium_pcb-rescue #PWR01
U 1 1 5B41590C
P 4350 1700
F 0 "#PWR01" H 4350 1550 50  0001 C CNN
F 1 "VCC" H 4367 1873 50  0000 C CNN
F 2 "" H 4350 1700 50  0001 C CNN
F 3 "" H 4350 1700 50  0001 C CNN
	1    4350 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 1800 4350 1700
Wire Wire Line
	4350 2100 4350 2250
Wire Wire Line
	4050 2850 4150 2850
Wire Wire Line
	4800 2850 4850 2850
Wire Wire Line
	4800 3250 5200 3250
Wire Wire Line
	5500 2850 5550 2850
$Comp
L small_mycelium-rescue:Conn_01x02-Connector-mycelium_pcb-rescue J2
U 1 1 5BBDFC9E
P 5250 1925
F 0 "J2" H 5330 1917 50  0000 L CNN
F 1 "4.5 V battery connection" H 5330 1826 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 5250 1925 50  0001 C CNN
F 3 "" H 5250 1925 50  0001 C CNN
	1    5250 1925
	1    0    0    -1  
$EndComp
$Comp
L small_mycelium-rescue:GND-power-mycelium_pcb-rescue #PWR04
U 1 1 5BBDFD54
P 5000 2125
F 0 "#PWR04" H 5000 1875 50  0001 C CNN
F 1 "GND" H 5005 1952 50  0000 C CNN
F 2 "" H 5000 2125 50  0001 C CNN
F 3 "" H 5000 2125 50  0001 C CNN
	1    5000 2125
	1    0    0    -1  
$EndComp
$Comp
L small_mycelium-rescue:VCC-power-mycelium_pcb-rescue #PWR03
U 1 1 5BBDFD7B
P 4950 1875
F 0 "#PWR03" H 4950 1725 50  0001 C CNN
F 1 "VCC" H 4967 2048 50  0000 C CNN
F 2 "" H 4950 1875 50  0001 C CNN
F 3 "" H 4950 1875 50  0001 C CNN
	1    4950 1875
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 1875 4950 1925
Wire Wire Line
	4950 1925 5050 1925
Wire Wire Line
	5000 2125 5000 2025
Wire Wire Line
	5000 2025 5050 2025
Wire Wire Line
	3000 2850 3050 2850
$Comp
L small_mycelium-rescue:CONN_01X01-mycelium_pcb-rescue J4
U 1 1 5BBECDB7
P 2575 2900
F 0 "J4" H 2653 2941 50  0000 L CNN
F 1 "mushroom antenna" V 2750 2550 50  0000 L CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 2575 2900 50  0001 C CNN
F 3 "" H 2575 2900 50  0001 C CNN
	1    2575 2900
	0    -1   -1   0   
$EndComp
Connection ~ 3650 2850
Wire Wire Line
	3650 3250 3000 3250
Wire Wire Line
	3000 3250 3000 2850
Wire Wire Line
	3650 2850 3650 3250
$Comp
L small_mycelium-rescue:GND-power-mycelium_pcb-rescue #PWR?
U 1 1 5BCDA59C
P 3000 3675
F 0 "#PWR?" H 3000 3425 50  0001 C CNN
F 1 "GND" H 3005 3502 50  0000 C CNN
F 2 "" H 3000 3675 50  0001 C CNN
F 3 "" H 3000 3675 50  0001 C CNN
	1    3000 3675
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 3250 3000 3300
Connection ~ 3000 3250
Wire Wire Line
	3000 3600 3000 3675
$Comp
L small_mycelium-rescue:GND-power-mycelium_pcb-rescue #PWR?
U 1 1 5BCDAC2E
P 2575 3200
F 0 "#PWR?" H 2575 2950 50  0001 C CNN
F 1 "GND" H 2580 3027 50  0000 C CNN
F 2 "" H 2575 3200 50  0001 C CNN
F 3 "" H 2575 3200 50  0001 C CNN
	1    2575 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2575 3100 2575 3200
$Comp
L small_mycelium-rescue:CONN_01X01-mycelium_pcb-rescue J?
U 1 1 5BCDAF62
P 3650 2450
F 0 "J?" H 3728 2491 50  0000 L CNN
F 1 "ANTENNA" H 3728 2400 50  0000 L CNN
F 2 "Wire_Pads:SolderWirePad_single_1mmDrill" H 3650 2450 50  0001 C CNN
F 3 "" H 3650 2450 50  0001 C CNN
	1    3650 2450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3650 2850 3650 2650
$EndSCHEMATC
