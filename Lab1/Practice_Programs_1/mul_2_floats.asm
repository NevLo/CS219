###############################################################################
#
#  Title: 	multiply two floats MIPS assembly program
#  Filename:	mul_2_floats.asm	
#  Author:	Christian Pilley
#  Date:	2-21-19
#
#  Description: A program to multiplies 2 floats
#
#  Input: 	floats
#  Output:	floats
#
###############################################################################
# Cross Reference
# f0: sum
# f1:  x
# f2:  y
###############################################################################

#### Data Segment #############################################################
.data
prompt_X:	.asciiz		" Input value for X = "
prompt_Y:	.asciiz		" Input value for Y = "
sum:		.asciiz		"\t X * Y = "
bye:		.asciiz		"\n Nice product!\n"
#### Code Segment #############################################################
.globl main
.text

main:
	li $v0, 4			#Load Print String call code
	la $a0, prompt_X		#load address of prompt
	syscall				#print
	
	li $v0, 6			#load read float call code
	syscall				#read
	mov.s $f1, $f0			#store float
	
	li $v0, 4			#Load Print String call code
	la $a0, prompt_Y		#load address of prompt
	syscall				#print
	
	li $v0, 6			#load read float call code
	syscall				#read
	mov.s $f2, $f0			#store float
	 				
	mul.s $f0, $f1, $f2		#multiply and store

	li $v0, 4			#Load Print String call code
	la $a0, sum			#load address of prompt
	syscall				#print

	li $v0, 2			#load print float call code
	mov.s  $f12, $f0		#load address of float
	syscall				#print
	
	li $v0, 4			#Load Print String call code
	la $a0, bye			#load address of prompt
	syscall				#print
	
	li $v0, 10			#load terminate call code
	syscall				#exit

