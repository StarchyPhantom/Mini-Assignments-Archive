/*
-------------------------------------------------------
count3.s
-------------------------------------------------------
Author:  Benjamin Huynh
ID:      169053702
Email:   huyn3702@mylaurier.ca
Date:    Jan 21 2025
-------------------------------------------------------
An infinite loop program with a timer delay and
LED display.
-------------------------------------------------------
*/
// Constants
.equ TIMER,     0xfffec600
.equ LEDS,      0xff200000
//.equ LED_BITS,  0x0F0F0F0F

.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

ldr r0, =LEDS       // LEDs base address
ldr r1, =TIMER      // private timer base address
ldr r5, =LED_BITS
ldr r2, [r5]   // value to set LEDs
ldr r6, =DELAY_TIME
ldr r3, [r6]  // timeout = 1/(200 MHz) x 200x10^6 = 1 sec
str r3, [r1]        // write timeout to timer load register
mov r3, #0b011      // set bits: mode = 1 (auto), enable = 1
str r3, [r1, #0x8]  // write to timer control register
LOOP:
str r2, [r0]        // load the LEDs
WAIT:
ldr r3, [r1, #0xC]  // read timer status
cmp r3, #0
beq WAIT            // wait for timer to expire
str r3, [r1, #0xC]  // reset timer flag bit
ror r2, #1          // rotate the LED bits
b LOOP

.data
LED_BITS:
.word 0x0000000F
DELAY_TIME:
.word 100000000 

.end