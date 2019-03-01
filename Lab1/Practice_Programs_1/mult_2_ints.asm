###############################################################################
#
#  Title: 	Mult two ints MIPS assembly program
#  Filename:	mult_2_ints.asm	
#  Author:	Christian Pilley
#  Date:	2-21-19
#
#  Description: A program to multiply two integers
#
#  Input: 	Integers
#  Output:	Integers
#
###############################################################################
# Cross Reference
# t0: Product
# t1:  X
# t2:  Y
###############################################################################

#### Data Segment #############################################################
.data
prompt_X:	.asciiz		" Input value for X = "
prompt_Y:	.asciiz		" Input value for Y = "
result:		.asciiz		" \t X * Y = "
bye:		.asciiz		"\n Nice Product! \n"

#### Code Segment #############################################################
.globl main
.text

main:

	li	$v0, 4			#Load print string call code
	la 	$a0, prompt_X		#load addresss of string
	syscall				#print string
	
	li	$v0 5			#load read int call code
	syscall				#read int
	move 	$t1, $v0		#store int
	
	li	$v0, 4			#Load print string call code
	la 	$a0, prompt_Y		#load addresss of string
	syscall				#print string
	
	li	$v0 5			#load read int call code
	syscall				#read int
	move 	$t2, $v0		#store int
	
	mult $t1, $t2			#multiply t1 and t2
	mflo $t0			#store product in t0

	li	$v0, 4			#Load print string call code
	la 	$a0, result		#load addresss of string
	syscall				#print string
	
	li	$v0, 1			#Load print int call code
	move 	$a0, $t0		#load address of int
	syscall				#print int
	
	
	li	$v0, 4			#Load print string call code
	la 	$a0, bye		#load addresss of string
	syscall				#print string
			
	li 	$v0,10			#load terminate call code
	syscall				#exit




