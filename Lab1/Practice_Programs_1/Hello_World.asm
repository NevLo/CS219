###############################################################################
#
#  Title: 	Hello World! MIPS assembly program
#  Filename:	Hello_World.asm	
#  Author:	Christian Pilley
#  Date:	2-21-19
#
#  Description: Hello World!
#
#  Input: 	none
#  Output:	String
#
###############################################################################

#### Data Segment #############################################################
.data
hello_w:	.asciiz "Hello World!"

#### Code Segment #############################################################

.globl main
.text
main:
	li	$v0, 4			#load print string call code
	la	$a0, hello_w		#loadd address of string
	syscall				#print string
	
	li 	$v0, 10			#load call code for terminate
	syscall				#exit
