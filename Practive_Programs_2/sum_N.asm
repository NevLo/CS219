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
	li	$v0,4
	la	$a0,prompt1
	syscall
	
	li	$v0, 5
	syscall
	
	blez 	$v0, end
	li 	$t0, 0

loop:
	add 	$t0,$t0,$v0
	addi 	$v0, $v0, -1
	bnez 	$v0, loop
	
	li 	$v0, 4
	la	$a0, prompt2
	syscall
	
	li 	$v0, 1
	move 	$a0, $t0
	syscall
	b	main

end: 	li	$v0, 4
	la	$a0, outside
	syscall
	
	li $v0, 10
	syscall















