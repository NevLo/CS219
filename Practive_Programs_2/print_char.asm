###############################################################################
#
#  Title: 	Print Characters MIPS assembly Program
#  Filename:	print_char.asm	
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
	li $t1, 32		# Register to check for lower limit
	li $t2, 255		# Register to check for upper limit
	
	li $v0, 4		# system call code print string
	la $a0, prompt1		# load address of promt into arguement register
	syscall			# print the prompt message
	
	li $v0, 5		# system call code for read integer
	syscall			# get the integer
	move $t0, $v0		# store the number in register $t0
	blt $t0, $t1, out	# if too low, branch to out message
	bgt $t0, $t2, out	# if too high, branch to out message
	
print:				# if okay, print the ASCII character
	li $v0,4		# system call code for print string
	la $a0, prompt2		# load address of prompt into arguement register
	syscall			# print the prompt message
	li $v0, 11		# system call code for print character
	move $a0, $t0		# load value into the arguement register
	syscall			# print character
	j Exit			# jump to exit label
	
out: 
	li $v0, 4		# system call code for print string
	la $a0, outside		# load address of message into arguement register
	syscall			# print message
	
Exit: 
	li $v0, 10		# system call code for exit program
	syscall			# termination.