###############################################################################
#
#  Title: 	Project 1: Function evaluator
#  Filename:	eval_func.asm	
#  Author:	Christian Pilley
#  Date:	2-19-19
#
#  Description: A program that calculates a function using user inputed info
#
#  Input: 	Integers
#  Output:	Integers
#
###############################################################################
#  Cross Reference:
#	$s0:	X
#	$s1:	A
#	$s2:	B
#	$s3:	C
#
###############################################################################



###### Data Segment ###########################################################
.data
    input_A:		.word 0	#Input Coeff A
    input_B:		.word 0 #Input Coeff B
    input_C:		.word 0 #Input Coeff C
    input_X:		.word 0 #Input Evaluation value X
    output_Y:		.word 0 #Output Value
    function_String:	.asciiz "f(x) = A*x^2 + B*x + C\n\n"
    ECA:		.asciiz "Enter coefficient [a]: "
    ECB:		.asciiz "Enter coefficient [b]: "
    ECC:		.asciiz "Enter coefficient [c]: "
    EIX:		.asciiz "Enter input value [x]: "
    FOXE:		.asciiz "f(x) = "
    Squared:		.asciiz "^2"
    plus:		.asciiz " + "
    multi:		.asciiz "*"
    equals:		.asciiz " = "
###### Code Segment ###########################################################
.globl main
.text
###############################################################################
# Function Name:	main
# Description:		Entry point into the program
###############################################################################
    main:
       
    	jal get_input			# Jumps to label get_input
    	
    	lw 	$s0, input_X
    	lw	$s1, input_A
    	lw	$s2, input_B
    	lw	$s3, input_C
    	
    	jal 	compute_f_of_x		# Jumps to label compute_f_of_x
	
	jal 	display_output		# Jumps to label display_output
	
	jal 	exit			# Jumps to label exit
	
###############################################################################
# Function Name:	get_input
# Description:		prompts the user to input values for A, B, C, and X 
###############################################################################
    get_input:
    	li 	$v0,4			# Load String I/O
    	
    	la 	$a0, function_String	# Print( "f(x) = A*X^2 + B*X + C" )
    	syscall
    			
    	la 	$a0, ECA		# Print( "Enter coefficient [a]: " )
    	syscall
    	
    	li	$v0,5			# Load Input I/O
    	syscall
    	sw 	$v0, input_A		# Store input into input_A
    	
    	li 	$v0,4			# Load String I/O
    	la 	$a0, ECB		# Print( "Enter coefficient [b]: " )
    	syscall
    	
    	li 	$v0,5			# Load Input I/O
    	syscall
    	sw 	$v0, input_B		# Store input into input_B
    	
    	li 	$v0,4			# Load String I/O
    	la 	$a0, ECC		# Print( "Enter coefficient [c]: " )
    	syscall
    	
    	li 	$v0,5			# Load Input I/O
    	syscall
    	sw 	$v0, input_C		# Store input into input_C
    	
    	li 	$v0,4			# Load String I/O
    	la 	$a0, EIX		# Print( "Enter coefficient [x]: " )
    	syscall
    	
    	li 	$v0,5			# Load Input I/O
    	syscall
    	sw 	$v0, input_X		# Store input into input_X
	
	
	
	jr 	$ra			# Return
	
###############################################################################
#Function Name:		display_output
#Description:		Displays the function, and its return value.
###############################################################################
    display_output:
    	li 	$v0, 4			# Load String I/O
    	la 	$a0, FOXE		# Prints( "f(x) = " )
    	syscall
    	li 	$v0, 1			# Load Integer I/O
    	lw 	$a0, input_A		# Prints( input_A )
	syscall
	li	$v0, 4			# Load String I/O
    	la 	$a0, multi		# Prints( "*" )
    	syscall
    	li 	$v0, 1			# Load Integer I/O
    	lw 	$a0, input_X		# Prints( input_X )
	syscall
	li 	$v0, 4			# Load String I/O
    	la 	$a0, Squared		# Prints( "^2" )
    	syscall
	la 	$a0, plus		# Prints( " + " )
    	syscall
    	li 	$v0, 1			# Load Integer I/O
    	lw 	$a0, input_B		# Prints( input_B )
	syscall
	li 	$v0, 4			# Load String I/O
    	la 	$a0, multi		# Prints( "*" )
    	syscall
    	li 	$v0, 1			# Load Integer I/O
    	lw 	$a0, input_X		# Prints( input_X )
	syscall
	li 	$v0, 4			# Load String I/O
    	la 	$a0, plus		# Prints( " + " )
    	syscall
    	li 	$v0, 1			# Load Integer I/O
    	lw 	$a0, input_C		# Prints( input_C )
	syscall
    	li 	$v0, 4			# Load String I/O
    	la 	$a0, equals		# Prints( " = " )
    	syscall
    	li 	$v0, 1			# Load Integer I/O
    	lw 	$a0, output_Y		# Prints( output_Y )
	syscall
 
	jr 	$ra				# Return
	
###############################################################################
# Function Name: 	compute_f_of_x
# Description:		Computes F(X) for the given x and cooefs.
###############################################################################
# $t0	X^2
# $t1   A*X^2
# $t2	B*X
# $t3	A*X^2 + B*X
############################
    compute_f_of_x:
, 
  	mult	$s0, $s0
  	mflo	$t0	
    	mult    $s1, $t0
    	mflo	$t1
    	mult 	$s2, $s0
    	mflo	$t2
    	add	$t3, $t1, $t2
    	add	$t4, $t3, $s3
    	sw	$t4, output_Y
	jr 	$ra
###############################################################################
# Function Name: 	exit
# Description:		Exits the program.
###############################################################################
    exit:
    	li 	$v0, 10			# Loads Exit Command
	syscall
