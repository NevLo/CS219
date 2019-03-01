###############################################################################
#
#  Title: 	Sum of Integers
#  Filename:	sum_N.asm	
#  Author:	Christian Pilley
#  Date:	2-21-19
#
#  Description: A program to find the sum of integers from 1 to N, where n is
#		a value input from the keyboard.
#
#  Input: 	Integer
#  Output:	Character
#
###############################################################################
#  Cross References:
#    v0:  N
#    t0:  Sum

###############################################################################

#### Data Segment #############################################################
.data
prompt1:	.asciiz "\nPlease input a value for N = "
prompt2:	.asciiz "The sum of the integers from 1 to N is "
outside:	.asciiz " *** Thanks for playing! ***"
#### Code Segment #############################################################
.globl main
.text

main:
	li	$v0,4			#load print string call code
	la	$a0,prompt1		#load address of the prompt
	syscall				#print string
	
	li	$v0, 5			#load read int call code
	syscall				#read int
	
	blez 	$v0, end		# if(v0 < 0) end();
	li 	$t0, 0			#load zero into $t0

loop:
	add 	$t0,$t0,$v0		# t0 += v0;
	addi 	$v0, $v0, -1		# v0--;
	bnez 	$v0, loop		# if(v0 != 0) loop();
	
	li 	$v0, 4			#load print string call code
	la	$a0, prompt2		#load address of prompt
	syscall				#print string
	
	li 	$v0, 1			#load print int call code
	move 	$a0, $t0		#load value into a0
	syscall				#print int
	b	main			#branch back to main

end: 	li	$v0, 4			#load print string call code
	la	$a0, outside		#load address of prompt
	syscall				#print string
	
	li $v0, 10			#load terminate call code
	syscall				#exit















