EESchema Schematic File Version 4
EELAYER 30 0
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
L Connector:DB25_Male J?
U 1 1 5F14CD4F
P 7700 2600
F 0 "J?" H 7880 2646 50  0000 L CNN
F 1 "DB25_Male" H 7880 2555 50  0000 L CNN
F 2 "" H 7700 2600 50  0001 C CNN
F 3 " ~" H 7700 2600 50  0001 C CNN
	1    7700 2600
	1    0    0    -1  
$EndComp
$Comp
L Connector:AudioJack4 J?
U 1 1 5F14EFB0
P 4800 2700
F 0 "J?" H 4757 3025 50  0000 C CNN
F 1 "AudioJack4" H 4757 2934 50  0000 C CNN
F 2 "" H 4800 2700 50  0001 C CNN
F 3 "~" H 4800 2700 50  0001 C CNN
	1    4800 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 2600 7400 2600
Text Label 7100 2600 0    50   ~ 0
E
Wire Wire Line
	7400 2700 6200 2700
Wire Wire Line
	6200 2700 6200 2900
Wire Wire Line
	6200 2900 5000 2900
Text Label 7100 2700 0    50   ~ 0
DEO
Wire Wire Line
	7400 1400 5600 1400
Wire Wire Line
	5600 1400 5600 2700
Wire Wire Line
	5600 2700 5000 2700
Text Label 7100 1400 0    50   ~ 0
DI
Wire Wire Line
	7400 3600 5600 3600
Wire Wire Line
	5600 3600 5600 2800
Wire Wire Line
	5600 2800 5000 2800
Text Label 7100 3600 0    50   ~ 0
AI1
Text Label 5100 2900 0    50   ~ 0
AUDIO_IN
Text Label 5100 2800 0    50   ~ 0
PTT
Text Label 5100 2700 0    50   ~ 0
AUDIO_OUT
Text Label 5100 2600 0    50   ~ 0
GND
$EndSCHEMATC
