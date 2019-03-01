###############################################################################
#
#  Title: 	Div two ints MIPS assembly program
#  Filename:	div_2_ints.asm	
#  Author:	Christian Pilley
#  Date:	2-21-19
#
#  Description: A program to divide two integers
#
#  Input: 	Integers
#  Output:	Integers
#
###############################################################################
# Cross Reference
# t0: Qoutient
# t1:  X
# t2:  Y
# t3: Remainder
###############################################################################

#### Data Segment #############################################################
.data
prompt_X:	.asciiz		" Input value for X = "
prompt_Y:	.asciiz		" Input value for Y = "
result:		.asciiz		" \t X / Y = "
remainder:	.asciiz		" \t with a remainder = "
bye:		.asciiz		"\n Nice Product! \n"

#### Code Segment #############################################################
.globl main
.text

main:

	li	$v0, 4			#load print string call code
	la 	$a0, prompt_X		#load address of string to print
	syscall				#print string
	
	li	$v0 5			#load read int call code
	syscall				#read int
	move 	$t1, $v0		#store int
	
	li	$v0, 4			#load print string call code
	la 	$a0, prompt_Y		#load address of string to print
	syscall				#print string
	
	li	$v0 5			#load read int call code
	syscall				#read int
	move 	$t2, $v0		#store int
		
	div $t1, $t2			#divide t1 by t2
	mflo $t0			#store quotient
	mfhi $t3			#store remainder

	li	$v0, 4			#load print string call code
	la 	$a0, result		#load address of string to print
	syscall				#print string
	
	li	$v0, 1			#load print int call code
	move 	$a0, $t0		#load value of int into a0
	syscall				#print int
	
	li	$v0, 4			#load print string call code
	la 	$a0, remainder		#load address of string to print
	syscall				#print string
	
	li	$v0, 1			#load print int call code
	move 	$a0, $t3		#load value of int into a0
	syscall				#print int
	
	
	li	$v0, 4			#load print string call code
	la 	$a0, bye		#load address of string to print
	syscall				#print string
	
	li 	$v0,10			#load terminate call code
	syscall				#exit
