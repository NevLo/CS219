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
	jal	show_array		#jumps to show array label
	jal	read_input		#jumps to read input label
	jal	show_array		#jumps to show array label
	
Exit:	
	li $v0, 10			#loads exit call code
	syscall				#exits
	
###############################################################################
# Function Name:	read_input
# Description:		Read Integers and puts in array
###############################################################################
read_input:
	la	$s0, array		#loads array into s0
	li	$s1, 4			#loads the value 4 into s1
	li 	$t1, 1			#loads the value 1 into t1
	
loop1:
	bgt	$t1, $s1, ret1		#branches to ret1 if t1 is greater than s1
	
	li	$v0, 4			#load print string call code
	la	$a0, prompt1		#load address into prompt
	add	$t2, $t1, '0'		#calculates ascii value
	sb	$t2, 15($a0)		#stores in prompt[15]
	syscall				#print prompt message
	
	li 	$v0, 5			#load read int call code
	syscall				#reads int
	
	sw	$v0, ($s0)		#store into into the array
	addi	$s0, $s0, 4		#increment array pointer to the next word
	addi	$t1, $t1, 1		#increment loop counter
	j	loop1			#jump to top of loop
ret1:
	jr	$ra			#return to main
	
###############################################################################
# Function Name: show_array
# Prints Integers in array
###############################################################################

show_array:
	li	$v0, 4			#load print string call code
	la	$a0, prompt2		#load address of prompt
	syscall				#print string
	
	la	$s0, array		#initialize address param
	li	$s1, 4			#set length of array
	
loop2:
	blez 	$s1, ret2		#if(s1 <-0) branch to return
	addi 	$s1, $s1, -1		#decrement loop counter
	lw 	$t0, ($s0)		#get value from array, store in t0
	addi 	$s0, $s0, 4		#increment array pointer to the next word
	
	li	$v0, 1			#load print int call code
	move 	$a0, $t0		#load value into a0
	syscall				#print int
	
	li	$v0, 11			#load print character call code
	li	$a0, ' '		#load in a space
	syscall				#print character
	j	loop2			#jump to top of loop

ret2:					
	li 	$v0, 11			#load print character call code
	li	$a0, '\n'		#load value into a0
	syscall				#return to main
	
	jr 	$ra










