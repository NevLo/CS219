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
	li 	$t1, 32			#load lower limit
	li 	$t2, 255		#load upper limit
loop:
	li 	$v0, 4			#load print string call code
	la 	$a0, prompt1		#load string to be printed
	syscall				#print string
	
	li 	$v0, 5			#load read int call code
	syscall				#read the int
	move 	$t0,$v0			#store the int into t0
	blt 	$t0, $t1, out		#if(t0 < t1) out();
	bgt 	$t0, $t2, out		#if(t0 > t2) out();
	jal 	print			#jump to the print statement
	j 	loop			#return to top of the loop
out:
	li 	$v0, 4			#load print string call code
	la 	$a0, outside		#load address of string to be printed
	syscall				#print string
Exit:
	li 	$v0, 10			#load terminate call code
	syscall				#exit
	
###############################################################################
# Function Name:	print
# Description:		Prints Ascii Characters
###############################################################################

print:
	li 	$v0, 4			#load print string call code
	la 	$a0, prompt2		#load address of string to be printed
	syscall				#print string
	li 	$v0, 11			#load print character call code
	move 	$a0, $t0		#load value into a0
	syscall				#print character
	jr 	$ra			#return to main function
