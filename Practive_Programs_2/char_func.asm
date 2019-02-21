###############################################################################
#
#  Title: 	Print Characters MIPS assembly Program
#  Filename:	char_func.asm	
#  Author:	Christian Pilley
#  Date:	2-21-19
#
#  Description: A program to print printable ASCII characters (32-127)
#		and beyond (128-255)
#
#  Input: 	Integer
#  Output:	Character
#
###############################################################################
#  Cross References:
#    t0:  Integer input
#    t1:  Lower limit
#    t2:  Upper limit
###############################################################################

#### Data Segment #############################################################
.data
prompt1:	.asciiz "\n\nEnter an integer:"
prompt2:	.asciiz "The character is:  "
outside:	.asciiz "Value out of bounds"
#### Code Segment #############################################################
.text
.globl main

main:
	li 	$t1, 32
	li 	$t2, 255
loop:
	li 	$v0, 4
	la 	$a0, prompt1
	syscall
	
	li 	$v0, 5
	syscall
	move 	$t0,$v0
	blt 	$t0, $t1, out
	bgt 	$t0, $t2, out
	jal 	print
	j 	loop
out:
	li 	$v0, 4
	la 	$a0, outside
	syscall
Exit:
	li 	$v0, 10
	syscall
	
###############################################################################
# Function Name:	print
# Description:		Prints Ascii Characters
###############################################################################

print:
	li 	$v0, 4
	la 	$a0, prompt2
	syscall
	li 	$v0, 11
	move 	$a0, $t0
	syscall
	jr 	$ra