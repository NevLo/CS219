###############################################################################
#
#  Title: 	Add two ints MIPS assembly program
#  Filename:	add_2_ints.asm	
#  Author:	Christian Pilley
#  Date:	2-21-19
#
#  Description: A program to add 2 integers
#
#  Input: 	Integers
#  Output:	Integers
#
###############################################################################
# Cross Reference
# t0: Sum
# t1:  X
# t2:  Y
###############################################################################

#### Data Segment #############################################################
.data
prompt_X:	.asciiz		" Input value for X = "
prompt_Y:	.asciiz		" Input value for Y = "
result:		.asciiz		" \t X + Y = "
bye:		.asciiz		"\n Nice Sum! \n"

#### Code Segment #############################################################
.globl main
.text

main:

	li	$v0, 4			#load print string call code
	la 	$a0, prompt_X		#load address of prompt
	syscall				#print string
	
	li	$v0 5			#load read int call code
	syscall				#read int
	move 	$t1, $v0		#store int
	
	li	$v0, 4			#load print string call code
	la 	$a0, prompt_Y		#load address of prompt
	syscall				#print string
	
	li	$v0 5			#load read int call code
	syscall				#read int
	move 	$t2, $v0		#store int
	
	add	$t0, $t1, $t2		#add ints t1 and t2 and store in t0

	li	$v0, 4			#load print string call code
	la 	$a0, result		#load address of prompt
	syscall				#print string
	
	li	$v0, 1			#load print int call code
	move 	$a0, $t0		#load value of int
	syscall				#print int

	li	$v0, 4			#load print string call code
	la 	$a0, bye		#load address of prompt
	syscall				#print string
	
	li 	$v0,10			#load terminate call code
	syscall				#exit
