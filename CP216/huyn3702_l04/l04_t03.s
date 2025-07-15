/*
-------------------------------------------------------
list_demo.s
-------------------------------------------------------
Author:  Benjamin Huynh
ID:      169,053,702
Email:   huyn3702@mylaurier.ca
Date:    2025-02-11
-------------------------------------------------------
A simple list demo program. Traverses all elements of an integer list.
r0: temp storage of value in list
r2: address of start of list
r3: address of end of list
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

mov    r0, #0
mov    r1, #0
mov    r4, #0

ldr    r2, =Data    // Store address of start of list
ldr    r3, =_Data   // Store address of end of list

sub    r5, r3, r2

ldr    r6, [r2]
ldr    r7, [r2]

Loop:
ldr    r0, [r2], #4 // Read address with post-increment (r0 = *r2, r2 += 4)
add	   r1, r1, r0
add    r4, r4, #1

cmp    r0, r6
bgt    NotMin
mov r6, r0
NotMin:

cmp    r0, r7
blt    NotMax
mov r7, r0
NotMax:

cmp    r3, r2       // Compare current address with end of list
bne    Loop         // If not at end, continue

_stop:
b _stop

.data
.align
Data:
.word   4,5,-9,0,3,0,8,-7,12    // The list of data
_Data: // End of list address

.end