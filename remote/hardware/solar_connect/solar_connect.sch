EESchema Schematic File Version 4
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
Text GLabel 5600 1550 0    50   Input ~ 0
LI_ON
$Comp
L power:GND #PWR0101
U 1 1 5DBF3D5E
P 5600 1750
F 0 "#PWR0101" H 5600 1500 50  0001 C CNN
F 1 "GND" H 5605 1577 50  0000 C CNN
F 2 "" H 5600 1750 50  0001 C CNN
F 3 "" H 5600 1750 50  0001 C CNN
	1    5600 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5DBF3EEE
P 4500 1300
F 0 "R1" H 4570 1346 50  0000 L CNN
F 1 "R" H 4570 1255 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P2.54mm_Vertical" V 4430 1300 50  0001 C CNN
F 3 "~" H 4500 1300 50  0001 C CNN
	1    4500 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5DBF3F55
P 4500 1600
F 0 "R2" H 4570 1646 50  0000 L CNN
F 1 "R" H 4570 1555 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P2.54mm_Vertical" V 4430 1600 50  0001 C CNN
F 3 "~" H 4500 1600 50  0001 C CNN
	1    4500 1600
	1    0    0    -1  
$EndComp
Text GLabel 4500 1000 0    50   Input ~ 0
LI_ON
Wire Wire Line
	4500 1450 4400 1450
Connection ~ 4500 1450
$Comp
L power:GND #PWR0102
U 1 1 5DBF3FA4
P 4500 1750
F 0 "#PWR0102" H 4500 1500 50  0001 C CNN
F 1 "GND" H 4505 1577 50  0000 C CNN
F 2 "" H 4500 1750 50  0001 C CNN
F 3 "" H 4500 1750 50  0001 C CNN
	1    4500 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 1000 4500 1150
Text GLabel 5600 1650 0    50   Input ~ 0
ANALOG_MEAS
Text GLabel 5450 900  0    50   Input ~ 0
LI_ON
$Comp
L power:GND #PWR0103
U 1 1 5DBF4248
P 5450 1000
F 0 "#PWR0103" H 5450 750 50  0001 C CNN
F 1 "GND" H 5455 827 50  0000 C CNN
F 2 "" H 5450 1000 50  0001 C CNN
F 3 "" H 5450 1000 50  0001 C CNN
	1    5450 1000
	1    0    0    -1  
$EndComp
Text GLabel 4400 1450 0    50   Input ~ 0
ANALOG_MEAS
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 5DBF4373
P 5650 900
F 0 "J1" H 5730 892 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 5730 801 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PT-1,5-2-3.5-H_1x02_P3.50mm_Horizontal" H 5650 900 50  0001 C CNN
F 3 "~" H 5650 900 50  0001 C CNN
	1    5650 900 
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J2
U 1 1 5DBF4462
P 5800 1650
F 0 "J2" H 5773 1580 50  0000 R CNN
F 1 "Conn_01x03_Male" H 5773 1671 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 5800 1650 50  0001 C CNN
F 3 "~" H 5800 1650 50  0001 C CNN
	1    5800 1650
	-1   0    0    1   
$EndComp
$EndSCHEMATC
