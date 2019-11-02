EESchema Schematic File Version 4
LIBS:knuth-gateway-cache
EELAYER 29 0
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
L knuth:tpl5110 U4
U 1 1 5D196517
P 2350 4350
F 0 "U4" H 2106 4715 50  0000 C CNN
F 1 "tpl5111" H 2106 4624 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x05_P2.54mm_Vertical" H 2350 4350 50  0001 C CNN
F 3 "" H 2350 4350 50  0001 C CNN
	1    2350 4350
	1    0    0    -1  
$EndComp
$Comp
L knuth-gateway-rescue:GND-power #PWR0102
U 1 1 5D196982
P 2900 4350
F 0 "#PWR0102" H 2900 4100 50  0001 C CNN
F 1 "GND" H 2905 4177 50  0000 C CNN
F 2 "" H 2900 4350 50  0001 C CNN
F 3 "" H 2900 4350 50  0001 C CNN
	1    2900 4350
	1    0    0    -1  
$EndComp
Connection ~ 2900 4350
$Comp
L knuth-gateway-rescue:Conn_01x02_Female-Connector R_Delay1
U 1 1 5D197A39
P 3950 4450
F 0 "R_Delay1" H 3977 4426 50  0000 L CNN
F 1 "Conn_01x02_Female" H 3977 4335 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 3950 4450 50  0001 C CNN
F 3 "~" H 3950 4450 50  0001 C CNN
	1    3950 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 4450 2550 4450
Wire Wire Line
	2550 4450 2550 4650
Wire Wire Line
	2350 4550 2450 4550
Wire Wire Line
	2450 4550 2450 5150
Wire Wire Line
	3750 4650 3750 4550
$Comp
L knuth-gateway-rescue:Conn_01x12_Female-Connector J1
U 1 1 5D3A6009
P 9400 1750
F 0 "J1" H 9200 2400 50  0000 L CNN
F 1 "FeatherLora1" V 8750 1400 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x12_P2.54mm_Vertical" H 9400 1750 50  0001 C CNN
F 3 "~" H 9400 1750 50  0001 C CNN
	1    9400 1750
	1    0    0    -1  
$EndComp
$Comp
L knuth-gateway-rescue:Conn_01x16_Female-Connector J2
U 1 1 5D3A613C
P 10550 1950
F 0 "J2" H 10400 2800 50  0000 L CNN
F 1 "FeatherLora2" V 10700 1700 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x16_P2.54mm_Vertical" H 10550 1950 50  0001 C CNN
F 3 "~" H 10550 1950 50  0001 C CNN
	1    10550 1950
	1    0    0    -1  
$EndComp
Text GLabel 9200 1250 0    50   Input ~ 0
VBAT
Text GLabel 9200 1350 0    50   Input ~ 0
EN
Text GLabel 9200 1450 0    50   Input ~ 0
VBUS
Text GLabel 9200 1550 0    50   Input ~ 0
D13
Text GLabel 9200 1650 0    50   Input ~ 0
D12
Text GLabel 9200 1750 0    50   Input ~ 0
D11
Text GLabel 9200 1850 0    50   Input ~ 0
D10
Text GLabel 9200 1950 0    50   Input ~ 0
D9
Text GLabel 9200 2050 0    50   Input ~ 0
D6
Text GLabel 9200 2150 0    50   Input ~ 0
D5
Text GLabel 9200 2250 0    50   Input ~ 0
SCL
Text GLabel 9200 2350 0    50   Input ~ 0
SDA
Text GLabel 10350 1250 0    50   Input ~ 0
RESET
Wire Wire Line
	10350 1350 10000 1350
Wire Wire Line
	10000 1350 10000 1150
$Comp
L knuth-gateway-rescue:+3V3-power #PWR0101
U 1 1 5D3A928A
P 10000 1150
F 0 "#PWR0101" H 10000 1000 50  0001 C CNN
F 1 "+3V3" H 10015 1323 50  0000 C CNN
F 2 "" H 10000 1150 50  0001 C CNN
F 3 "" H 10000 1150 50  0001 C CNN
	1    10000 1150
	1    0    0    -1  
$EndComp
Text GLabel 10350 1450 0    50   Input ~ 0
AREF
Wire Wire Line
	10350 1550 10000 1550
Wire Wire Line
	10000 1550 10000 1600
$Comp
L knuth-gateway-rescue:GND-power #PWR0103
U 1 1 5D3AC17C
P 10000 1600
F 0 "#PWR0103" H 10000 1350 50  0001 C CNN
F 1 "GND" H 10005 1427 50  0000 C CNN
F 2 "" H 10000 1600 50  0001 C CNN
F 3 "" H 10000 1600 50  0001 C CNN
	1    10000 1600
	1    0    0    -1  
$EndComp
Text GLabel 10350 1650 0    50   Input ~ 0
A0
Text GLabel 10350 1750 0    50   Input ~ 0
A1
Text GLabel 10350 1850 0    50   Input ~ 0
A2
Text GLabel 10350 1950 0    50   Input ~ 0
A3
Text GLabel 10350 2050 0    50   Input ~ 0
A4
Text GLabel 10350 2150 0    50   Input ~ 0
A5
Text GLabel 10350 2250 0    50   Input ~ 0
SCK
Text GLabel 10350 2350 0    50   Input ~ 0
MOSI
Text GLabel 10350 2450 0    50   Input ~ 0
MISO
Text GLabel 10350 2550 0    50   Input ~ 0
D0
Text GLabel 10350 2650 0    50   Input ~ 0
D1
Text GLabel 10350 2750 0    50   Input ~ 0
DI01
Wire Wire Line
	2350 4350 2900 4350
Wire Wire Line
	2550 4650 3750 4650
$Comp
L knuth-gateway-rescue:Conn_01x03_Female-Connector EC-5
U 1 1 5D3CA29A
P 6900 4600
F 0 "EC-5" H 6928 4626 50  0000 L CNN
F 1 "Conn_01x03_Female" H 6600 4200 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 6900 4600 50  0001 C CNN
F 3 "~" H 6900 4600 50  0001 C CNN
	1    6900 4600
	1    0    0    -1  
$EndComp
$Comp
L knuth-gateway-rescue:Conn_01x03_Female-Connector 1-Wire1
U 1 1 5D3CC155
P 6900 3800
F 0 "1-Wire1" H 6928 3826 50  0000 L CNN
F 1 "Conn_01x03_Female" H 6850 3450 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 6900 3800 50  0001 C CNN
F 3 "~" H 6900 3800 50  0001 C CNN
	1    6900 3800
	1    0    0    -1  
$EndComp
$Comp
L knuth-gateway-rescue:GND-power #PWR0104
U 1 1 5D3D0428
P 6400 3300
F 0 "#PWR0104" H 6400 3050 50  0001 C CNN
F 1 "GND" H 6405 3127 50  0000 C CNN
F 2 "" H 6400 3300 50  0001 C CNN
F 3 "" H 6400 3300 50  0001 C CNN
	1    6400 3300
	1    0    0    -1  
$EndComp
Text GLabel 6600 4500 0    50   Input ~ 0
A0
$Comp
L knuth-gateway-rescue:GND-power #PWR0105
U 1 1 5D3D5056
P 6050 4600
F 0 "#PWR0105" H 6050 4350 50  0001 C CNN
F 1 "GND" H 6055 4427 50  0000 C CNN
F 2 "" H 6050 4600 50  0001 C CNN
F 3 "" H 6050 4600 50  0001 C CNN
	1    6050 4600
	1    0    0    -1  
$EndComp
$Comp
L knuth-gateway-rescue:R-Device RP1
U 1 1 5D3DC753
P 5900 3650
F 0 "RP1" H 5830 3604 50  0000 R CNN
F 1 "4.7K" V 6000 3750 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5830 3650 50  0001 C CNN
F 3 "~" H 5900 3650 50  0001 C CNN
	1    5900 3650
	-1   0    0    1   
$EndComp
$Comp
L knuth-gateway-rescue:+3V3-power #PWR0106
U 1 1 5D3CF14A
P 6200 3350
F 0 "#PWR0106" H 6200 3200 50  0001 C CNN
F 1 "+3V3" H 6215 3523 50  0000 C CNN
F 2 "" H 6200 3350 50  0001 C CNN
F 3 "" H 6200 3350 50  0001 C CNN
	1    6200 3350
	1    0    0    -1  
$EndComp
$Comp
L knuth-gateway-rescue:+3V3-power #PWR0107
U 1 1 5D3F51C7
P 6350 4500
F 0 "#PWR0107" H 6350 4350 50  0001 C CNN
F 1 "+3V3" H 6365 4673 50  0000 C CNN
F 2 "" H 6350 4500 50  0001 C CNN
F 3 "" H 6350 4500 50  0001 C CNN
	1    6350 4500
	1    0    0    -1  
$EndComp
Text GLabel 2450 5150 2    50   Input ~ 0
VBUS
Wire Wire Line
	2350 4650 2350 4900
Wire Wire Line
	2350 4900 2800 4900
Text GLabel 2800 4900 2    50   Input ~ 0
D10
$Comp
L knuth-gateway-rescue:Conn_01x03_Female-Connector switch1
U 1 1 5D40388A
P 2850 3050
F 0 "switch1" V 3100 3250 50  0000 R CNN
F 1 "Conn_01x03_Female" V 2950 3400 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 2850 3050 50  0001 C CNN
F 3 "~" H 2850 3050 50  0001 C CNN
	1    2850 3050
	1    0    0    -1  
$EndComp
$Comp
L knuth-gateway-rescue:R-Device RD1
U 1 1 5D3B9AD0
P 1400 2700
F 0 "RD1" H 1470 2746 50  0000 L CNN
F 1 "R" H 1470 2655 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 1330 2700 50  0001 C CNN
F 3 "~" H 1400 2700 50  0001 C CNN
	1    1400 2700
	1    0    0    -1  
$EndComp
$Comp
L knuth-gateway-rescue:R-Device RD2
U 1 1 5D3B9B54
P 1400 3000
F 0 "RD2" H 1470 3046 50  0000 L CNN
F 1 "R" H 1470 2955 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 1330 3000 50  0001 C CNN
F 3 "~" H 1400 3000 50  0001 C CNN
	1    1400 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 2850 1250 2850
Connection ~ 1400 2850
Text GLabel 1250 2850 0    50   Input ~ 0
A5
$Comp
L knuth-gateway-rescue:GND-power #PWR0108
U 1 1 5D3BB55A
P 1400 3150
F 0 "#PWR0108" H 1400 2900 50  0001 C CNN
F 1 "GND" H 1405 2977 50  0000 C CNN
F 2 "" H 1400 3150 50  0001 C CNN
F 3 "" H 1400 3150 50  0001 C CNN
	1    1400 3150
	1    0    0    -1  
$EndComp
$Comp
L knuth-gateway-rescue:Conn_01x02_Female-Connector J3
U 1 1 5D3E3A64
P 1500 850
F 0 "J3" H 1527 826 50  0000 L CNN
F 1 "Conn_01x02_Female" H 1527 735 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 1500 850 50  0001 C CNN
F 3 "~" H 1500 850 50  0001 C CNN
	1    1500 850 
	1    0    0    -1  
$EndComp
$Comp
L knuth-gateway-rescue:Conn_01x02_Female-Connector J4
U 1 1 5D3E3B00
P 1500 1250
F 0 "J4" H 1527 1226 50  0000 L CNN
F 1 "Conn_01x02_Female" H 1527 1135 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 1500 1250 50  0001 C CNN
F 3 "~" H 1500 1250 50  0001 C CNN
	1    1500 1250
	1    0    0    -1  
$EndComp
$Comp
L knuth-gateway-rescue:GND-power #PWR0109
U 1 1 5D3E3B54
P 1300 1350
F 0 "#PWR0109" H 1300 1100 50  0001 C CNN
F 1 "GND" H 1305 1177 50  0000 C CNN
F 2 "" H 1300 1350 50  0001 C CNN
F 3 "" H 1300 1350 50  0001 C CNN
	1    1300 1350
	1    0    0    -1  
$EndComp
$Comp
L knuth-gateway-rescue:GND-power #PWR0110
U 1 1 5D3E3BA5
P 1300 950
F 0 "#PWR0110" H 1300 700 50  0001 C CNN
F 1 "GND" H 1305 777 50  0000 C CNN
F 2 "" H 1300 950 50  0001 C CNN
F 3 "" H 1300 950 50  0001 C CNN
	1    1300 950 
	1    0    0    -1  
$EndComp
Text GLabel 1300 850  0    50   Input ~ 0
BATT
Text GLabel 1300 1250 0    50   Input ~ 0
LOAD
Text GLabel 2650 2950 0    50   Input ~ 0
LOAD
Text GLabel 2650 3050 0    50   Input ~ 0
SWITCHED_LOAD
Text GLabel 2350 4250 2    50   Input ~ 0
SWITCHED_LOAD
Wire Wire Line
	3750 4350 3750 4450
Wire Wire Line
	2900 4350 3750 4350
Text GLabel 1400 2400 2    50   Input ~ 0
BATT
Wire Wire Line
	1400 2550 1400 2400
$Comp
L knuth-gateway-rescue:Screw_Terminal_01x03-Connector J5
U 1 1 5D3E8957
P 7450 3800
F 0 "J5" H 7370 3475 50  0000 C CNN
F 1 "Screw_Terminal_01x03" H 7370 3566 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PT-1,5-3-3.5-H_1x03_P3.50mm_Horizontal" H 7450 3800 50  0001 C CNN
F 3 "~" H 7450 3800 50  0001 C CNN
	1    7450 3800
	-1   0    0    1   
$EndComp
$Comp
L knuth-gateway-rescue:Screw_Terminal_01x03-Connector J6
U 1 1 5D3E8A32
P 7450 4600
F 0 "J6" H 7370 4275 50  0000 C CNN
F 1 "Screw_Terminal_01x03" H 7370 4366 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PT-1,5-3-3.5-H_1x03_P3.50mm_Horizontal" H 7450 4600 50  0001 C CNN
F 3 "~" H 7450 4600 50  0001 C CNN
	1    7450 4600
	-1   0    0    1   
$EndComp
Wire Wire Line
	6700 3700 6550 3700
Wire Wire Line
	6550 3700 6550 3300
Wire Wire Line
	6550 3300 6400 3300
Wire Wire Line
	6200 3350 6200 3500
Wire Wire Line
	5900 3500 6200 3500
Connection ~ 6200 3500
Wire Wire Line
	6200 3500 6200 3800
Wire Wire Line
	5900 3900 5900 3800
Text GLabel 5800 3900 0    50   Input ~ 0
D5
Wire Wire Line
	5900 3900 5800 3900
Connection ~ 5900 3900
Wire Wire Line
	6200 3800 6700 3800
Wire Wire Line
	5900 3900 6700 3900
Connection ~ 6700 3900
Connection ~ 6700 3800
Connection ~ 6700 3700
Wire Wire Line
	6700 4700 6350 4700
Wire Wire Line
	6350 4500 6350 4700
Wire Wire Line
	6700 4600 6050 4600
Connection ~ 6700 4600
Connection ~ 6700 4700
Wire Wire Line
	6700 4500 6600 4500
Connection ~ 6700 4500
Wire Wire Line
	6700 3700 7650 3700
Wire Wire Line
	6700 3800 7650 3800
Wire Wire Line
	6700 3900 7650 3900
Wire Wire Line
	6700 4500 7650 4500
Wire Wire Line
	6700 4600 7650 4600
Wire Wire Line
	6700 4700 7650 4700
$Comp
L knuth-gateway-rescue:R-Device RE1
U 1 1 5D3E5CB9
P 7300 1200
F 0 "RE1" H 7370 1246 50  0000 L CNN
F 1 "R" H 7370 1155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7230 1200 50  0001 C CNN
F 3 "~" H 7300 1200 50  0001 C CNN
	1    7300 1200
	1    0    0    -1  
$EndComp
$Comp
L knuth-gateway-rescue:R-Device RE2
U 1 1 5D3E5CC0
P 7300 1500
F 0 "RE2" H 7370 1546 50  0000 L CNN
F 1 "=1/14th of top R" H 7370 1455 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7230 1500 50  0001 C CNN
F 3 "~" H 7300 1500 50  0001 C CNN
	1    7300 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 1350 7150 1350
Connection ~ 7300 1350
Text GLabel 7150 1350 0    50   Input ~ 0
A1
$Comp
L knuth-gateway-rescue:GND-power #PWR0111
U 1 1 5D3E5CCA
P 7300 1650
F 0 "#PWR0111" H 7300 1400 50  0001 C CNN
F 1 "GND" H 7305 1477 50  0000 C CNN
F 2 "" H 7300 1650 50  0001 C CNN
F 3 "" H 7300 1650 50  0001 C CNN
	1    7300 1650
	1    0    0    -1  
$EndComp
Text GLabel 7300 900  2    50   Input ~ 0
EXT_BAT
Wire Wire Line
	7300 1050 7300 900 
$Comp
L knuth-gateway-rescue:Conn_01x03_Female-Connector J7
U 1 1 5D3E7A20
P 3950 1850
F 0 "J7" H 3977 1876 50  0000 L CNN
F 1 "Conn_01x03_Female" H 3977 1785 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 3950 1850 50  0001 C CNN
F 3 "~" H 3950 1850 50  0001 C CNN
	1    3950 1850
	1    0    0    -1  
$EndComp
Text GLabel 3450 1750 0    50   Input ~ 0
EXT_BAT
$Comp
L knuth-gateway-rescue:GND-power #PWR0112
U 1 1 5D3E8299
P 2950 1950
F 0 "#PWR0112" H 2950 1700 50  0001 C CNN
F 1 "GND" H 2955 1777 50  0000 C CNN
F 2 "" H 2950 1950 50  0001 C CNN
F 3 "" H 2950 1950 50  0001 C CNN
	1    2950 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 1850 2950 1950
Text GLabel 3450 1950 0    50   Input ~ 0
5V_OUT
Wire Wire Line
	3450 1750 3750 1750
Wire Wire Line
	2950 1850 3600 1850
Wire Wire Line
	3450 1950 3750 1950
$Comp
L knuth-gateway-rescue:Conn_01x02_Female-Connector J8
U 1 1 5D3EC14C
P 4750 1500
F 0 "J8" H 4777 1476 50  0000 L CNN
F 1 "Conn_01x02_Female" H 4777 1385 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 4750 1500 50  0001 C CNN
F 3 "~" H 4750 1500 50  0001 C CNN
	1    4750 1500
	1    0    0    -1  
$EndComp
$Comp
L knuth-gateway-rescue:Conn_01x02_Female-Connector J9
U 1 1 5D3EC198
P 4750 2300
F 0 "J9" H 4777 2276 50  0000 L CNN
F 1 "Conn_01x02_Female" H 4777 2185 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 4750 2300 50  0001 C CNN
F 3 "~" H 4750 2300 50  0001 C CNN
	1    4750 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 1500 3750 1500
Wire Wire Line
	3750 1500 3750 1750
Connection ~ 3750 1750
Wire Wire Line
	3750 1850 4550 1850
Wire Wire Line
	4550 1850 4550 1600
Connection ~ 3750 1850
Wire Wire Line
	3750 1950 3750 2300
Wire Wire Line
	3750 2300 4550 2300
Connection ~ 3750 1950
Wire Wire Line
	3600 1850 3600 2400
Wire Wire Line
	3600 2400 4550 2400
Connection ~ 3600 1850
Wire Wire Line
	3600 1850 3750 1850
$Comp
L knuth-gateway-rescue:Screw_Terminal_01x02-Connector J10
U 1 1 5D3EECB9
P 5050 1600
F 0 "J10" H 4970 1275 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 4970 1366 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PT-1,5-2-3.5-H_1x02_P3.50mm_Horizontal" H 5050 1600 50  0001 C CNN
F 3 "~" H 5050 1600 50  0001 C CNN
	1    5050 1600
	-1   0    0    1   
$EndComp
Connection ~ 4550 1500
Wire Wire Line
	4550 1600 5250 1600
Connection ~ 4550 1600
Wire Wire Line
	4550 1500 5250 1500
$Comp
L knuth-gateway-rescue:Screw_Terminal_01x02-Connector J11
U 1 1 5D3F2E6B
P 5100 2300
F 0 "J11" H 5180 2292 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 5180 2201 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PT-1,5-2-3.5-H_1x02_P3.50mm_Horizontal" H 5100 2300 50  0001 C CNN
F 3 "~" H 5100 2300 50  0001 C CNN
	1    5100 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 2300 4900 2300
Connection ~ 4550 2300
Wire Wire Line
	4900 2400 4550 2400
Connection ~ 4550 2400
Text Notes 5550 1550 0    50   ~ 0
to alligator clips & battery
Text Notes 5300 2700 0    50   ~ 0
to 5.5 / 2.1 mm jack (positive inner pole)\n(plug into DC jack on solar lipo charger)
Text Notes 3950 1100 0    50   ~ 0
Backup Power into Lion Charger Jack\n(use up to 36V in)
$EndSCHEMATC
