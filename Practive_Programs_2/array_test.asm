###############################################################################
#
#  Title: 	Array I/O MIPS assembly program
#  Filename:	array_test.asm	
#  Author:	Christian Pilley
#  Date:	2-21-19
#
#  Description: A program to I/O integers using an array and functions
#
#  Input: 	Integers
#  Output:	Integers
#
###############################################################################


#### Data Segment #############################################################
.data
prompt1:	.asciiz "Enter Integer  0:  "
prompt2:	.asciiz "The Integers are:  "
		.align 2
array:		.space 16
#### Code Segment #############################################################
.globl main
.text

main:
	jal	show_array
	jal	read_input
	jal	show_array
	
Exit:	
	li $v0, 10
	syscall
	
###############################################################################
# Function Name:	read_input
# Description:		Read Integers and puts in array
###############################################################################
read_input:
	la	$s0, array
	li	$s1, 4
	li 	$t1, 1
	
loop1:
	bgt	$t1, $s1, ret1
	
	li	$v0, 4
	la	$a0, prompt1
	add	$t2, $t1, '0'
	sb	$t2, 15($a0)
	syscall
	
	li 	$v0, 5
	syscall
	
	sw	$v0, ($s0)
	addi	$s0, $s0, 4
	addi	$t1, $t1, 1
	j	loop1
ret1:
	jr	$ra
	
###############################################################################
# Function Name: show_array
# Prints Integers in array
###############################################################################

show_array:
	li	$v0, 4
	la	$a0, prompt2
	syscall
	
	la	$s0, array
	li	$s1, 4
	
loop2:
	blez 	$s1, ret2
	addi 	$s1, $s1, -1
	lw 	$t0, ($s0)
	addi 	$s0, $s0, 4
	
	li	$v0, 1
	move 	$a0, $t0
	syscall
	
	li	$v0, 11
	li	$a0, ' '
	syscall
	j	loop2

ret2:
	li 	$v0, 11
	li	$a0, '\n'
	syscall
	
	jr 	$ra










