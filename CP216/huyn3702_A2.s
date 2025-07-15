/*
2/28/2024
Benjamin Huynh 169053702
huyn3702@mylaurier.ca
*/
.org 0x1000 // Start at memory location 1000
.text           // Code section
.global _start
_start:

ldr    r1, =0x1500
ldr    r2, =Data    // Store address of start of list
ldr    r3, =_Data   // Store address of end of list
ldr    r4, =LookUp    // Store address of start of list
//ldr    r5, =_LookUp   // Store address of end of list

Loop:
ldr    r0, [r2], #4 // Read address with post-increment (r0 = *r2, r2 += 4)

ldrb    r12, [r0, r4]

strb   r12, [r1], #1 // store the contents of r12 to [r1] and post-increment
cmp    r3, r2       // Compare current address with end of list
bne    Loop         // If not at end, continue

_stop:
b _stop

.data
.align
Data:
.word   0xA, 0xB, 0xC, 0x1, 0x2, 0x4, 0x9, 0x3    // The list of data
.word   0xD, 0xF, 0xE, 0x7, 0x5, 0x6, 0x8, 0x0
_Data: // End of list address

LookUp:
.byte   0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37    // The list of data
.byte   0x38, 0x39, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46
//_LookUp: // End of list address

//.bss
//Result:
//.space 64

.end