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
DATA
Text GLabel 4350 7100 0    50   Input ~ 0
5V
$Comp
L Connector:Screw_Terminal_01x03 J1
U 1 1 5DBF675D
P 2900 6800
F 0 "J1" H 2820 6475 50  0000 C CNN
F 1 "Screw_Terminal_01x03" H 2820 6566 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PT-1,5-3-3.5-H_1x03_P3.50mm_Horizontal" H 2900 6800 50  0001 C CNN
F 3 "~" H 2900 6800 50  0001 C CNN
	1    2900 6800
	-1   0    0    1   
$EndComp
Text GLabel 3100 6900 2    50   Input ~ 0
5V
Text GLabel 3100 6800 2    50   Input ~ 0
DATA
$Comp
L power:GND #PWR0101
U 1 1 5DBF682F
P 3500 6700
F 0 "#PWR0101" H 3500 6450 50  0001 C CNN
F 1 "GND" H 3505 6527 50  0000 C CNN
F 2 "" H 3500 6700 50  0001 C CNN
F 3 "" H 3500 6700 50  0001 C CNN
	1    3500 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 6700 3500 6700
$EndSCHEMATC
