/*
-------------------------------------------------------
l05_t02.s
-------------------------------------------------------
Author:	Benjamin Huynh
ID:		169,053,702
Email:	huyn3702@mylaurier.ca
Date:   2025-02-24
-------------------------------------------------------
Calculates stats on an integer list.
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

mov    r1, #0       // Initialize counters
mov    r2, #0
mov    r3, #0
ldr    r4, =Data    // Store address of start of list
ldr    r5, =_Data   // Store address of end of list
bl     list_stats   // Call subroutine - returned stats in counters

_stop:
b      _stop

//-------------------------------------------------------
list_stats:
/*
-------------------------------------------------------
Counts number of positive, negative, and 0 values in a list.
Equivalent of: void stats(*start, *end, *zero, *positive, *negatives)
-------------------------------------------------------
Parameters:
  r1 - number of zero values
  r2 - number of positive values
  r3 - number of negative values
  r4 - start address of list
  r5 - end address of list
Uses:
  r0 - temporary value
-------------------------------------------------------
*/

// your code here
stmfd   sp!, {r0, r4} 

Loop:
ldr r0, [r4]
cmp r0, #0

Pos:
ble Neg
add r2, r2, #1
bal Found
Neg:
beq Zero
add r3, r3, #1
bal Found
Zero:
add r1, r1, #1

Found:
add r4, r4, #4
cmp r4, r5
bne Loop

ldmfd   sp!, {r0, r4} 
bx lr

.data
.align
Data:
.word   4,5,-9,0,3,0,8,-7,12    // The list of data
_Data: // End of list address

.end