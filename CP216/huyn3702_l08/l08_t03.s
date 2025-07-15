/*
-------------------------------------------------------
l08_t03.s
-------------------------------------------------------
Author:	 Benjamin Huynh
ID:		 169,053,702
Email:	 huyn3702@mylaurier.ca
Date:    2024-02-21
-------------------------------------------------------
Uses a subroutine to read strings from the UART into memory.
-------------------------------------------------------
*/
.org 0x1000   // Start at memory location 1000
.text         // Code section
.global _start
_start:

bl    EchoString

_stop:
b _stop

// Subroutine constants
.equ UART_BASE, 0xff201000  // UART base address
.equ VALID, 0x8000          // Valid data in UART mask
.equ ENTER, 0x0A            // The enter key code

EchoString:
/*
-------------------------------------------------------
Echoes a string from the UART to the UART.
-------------------------------------------------------
Uses:
  r0 - holds character to print
  r1 - address of UART
-------------------------------------------------------
*/

//=======================================================

// your code here

//=======================================================
stmfd   sp!, {r0-r1, lr}
ldr     r1, =UART_BASE
rsLOOP:
ldr     r0, [r1]        // read the UART data register
tst     r0, #VALID      // check if there is new data
andne   r0, r0, #0x00FF
beq		_PrintString
cmp		r0, #ENTER
strb	r0, [r1]
beq		_PrintString
b       rsLOOP
_PrintString:
ldmfd   sp!, {r0-r1, lr}
bx    lr                    // return from subroutine

.end