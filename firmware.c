/**
* Raspberry Pi Pico 1 - Keyboard input sniffer firmware
*
* Author: @xelios9, @Dysthesis
* 8 May 2026 - Present
*
* Ref:
*
**/

#include <stdio.h>
#include "pico/stdlib"

#define LED_PIN 25 // Pico 1's LED PIN is GPIO25
#define DP_PIN 11 // USB D+ Pin
#define DM_PIN (DP_PIN + 1) // USB D- Pin, must be consecutive to D+

