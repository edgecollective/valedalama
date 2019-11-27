EESchema Schematic File Version 4
LIBS:ib4-cache
EELAYER 26 0
EELAYER END
$Descr User 12296 8468
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
L Device:Q_NPN_EBC Q1
U 1 1 5DBE059E
P 2200 7500
F 0 "Q1" H 2391 7546 50  0000 L CNN
F 1 "Q_NPN_EBC" H 2391 7455 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92" H 2400 7600 50  0001 C CNN
F 3 "~" H 2200 7500 50  0001 C CNN
	1    2200 7500
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_PNP_BCE Q2
U 1 1 5DBE12A5
P 2700 6800
F 0 "Q2" H 2890 6846 50  0000 L CNN
F 1 "Q_PNP_BCE" H 2890 6755 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 2900 6900 50  0001 C CNN
F 3 "~" H 2700 6800 50  0001 C CNN
	1    2700 6800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5DBE1A2E
P 2300 6950
F 0 "R2" H 2370 6996 50  0000 L CNN
F 1 "R" H 2370 6905 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P5.08mm_Vertical" V 2230 6950 50  0001 C CNN
F 3 "~" H 2300 6950 50  0001 C CNN
	1    2300 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 6800 2300 6800
Wire Wire Line
	2300 7100 2300 7300
Wire Wire Line
	2000 7500 1800 7500
$Comp
L Device:R R1
U 1 1 5DBE8137
P 1650 7500
F 0 "R1" V 1443 7500 50  0000 C CNN
F 1 "R" V 1534 7500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P5.08mm_Vertical" V 1580 7500 50  0001 C CNN
F 3 "~" H 1650 7500 50  0001 C CNN
	1    1650 7500
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5DBE8F5D
P 2300 7900
F 0 "#PWR0103" H 2300 7650 50  0001 C CNN
F 1 "GND" H 2305 7727 50  0000 C CNN
F 2 "" H 2300 7900 50  0001 C CNN
F 3 "" H 2300 7900 50  0001 C CNN
	1    2300 7900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 7700 2300 7900
Wire Wire Line
	1500 7500 1300 7500
Wire Wire Line
	2800 6600 2800 6450
Text GLabel 1300 7500 0    50   Input ~ 0
DECAGON_SWITCH
$Comp
L Connector:Conn_01x01_Female J3
U 1 1 5DC21FF1
P 4550 7100
F 0 "J3" H 4578 7126 50  0000 L CNN
F 1 "Conn_01x01_Female" H 4578 7035 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 4550 7100 50  0001 C CNN
F 3 "~" H 4550 7100 50  0001 C CNN
	1    4550 7100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Female J4
U 1 1 5DC22EEB
P 4550 7400
F 0 "J4" H 4578 7426 50  0000 L CNN
F 1 "Conn_01x01_Female" H 4578 7335 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 4550 7400 50  0001 C CNN
F 3 "~" H 4550 7400 50  0001 C CNN
	1    4550 7400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Female J5
U 1 1 5DC2371B
P 4550 7700
F 0 "J5" H 4578 7726 50  0000 L CNN
F 1 "Conn_01x01_Female" H 4578 7635 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x01_P2.54mm_Vertical" H 4550 7700 50  0001 C CNN
F 3 "~" H 4550 7700 50  0001 C CNN
	1    4550 7700
	1    0    0    -1  
$EndComp
Text GLabel 2800 7150 2    50   Input ~ 0
5V_SWITCHED
Wire Wire Line
	2800 7000 2800 7150
Text GLabel 2800 6450 0    50   Input ~ 0
5V_BOOST
Text Notes 3100 6150 0    118  ~ 0
Decagon
$Comp
L power:GND #PWR0105
U 1 1 5DD96540
P 4350 7700
F 0 "#PWR0105" H 4350 7450 50  0001 C CNN
F 1 "GND" H 4355 7527 50  0000 C CNN
F 2 "" H 4350 7700 50  0001 C CNN
F 3 "" H 4350 7700 50  0001 C CNN
	1    4350 7700
	1    0    0    -1  
$EndComp
Text GLabel 4350 7400 0    50   Input ~ 0
RX
Text GLabel 4350 7100 0    50   Input ~ 0
5V_SWITCHED
Text GLabel 700  6550 0    50   Input ~ 0
DECAGON_SWITCH
Text GLabel 700  6650 0    50   Input ~ 0
5V
Text GLabel 700  6750 0    50   Input ~ 0
RX
$Comp
L power:GND #PWR0101
U 1 1 5DBF622B
P 700 6850
F 0 "#PWR0101" H 700 6600 50  0001 C CNN
F 1 "GND" H 705 6677 50  0000 C CNN
F 2 "" H 700 6850 50  0001 C CNN
F 3 "" H 700 6850 50  0001 C CNN
	1    700  6850
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male J1
U 1 1 5DBF644C
P 900 6750
F 0 "J1" H 873 6630 50  0000 R CNN
F 1 "Conn_01x04_Male" H 873 6721 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 900 6750 50  0001 C CNN
F 3 "~" H 900 6750 50  0001 C CNN
	1    900  6750
	-1   0    0    1   
$EndComp
$EndSCHEMATC
