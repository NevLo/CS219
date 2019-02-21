# Assembly Program

# A polynomial evaluator program...
# Evaluates a quardatic polynomial...
# Ex:		f(x) = a*x^2 + b*x + c
# Input: 	a, b, c, and x
# Output:	f(x), the value of the polynomial at x

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
    
.text
#Entry point into the program.
    main:
    	jal get_input			# Jumps to label get_input
    	jal compute_f_of_x		# Jumps to label compute_f_of_x
	jal display_output		# Jumps to label display_output
	jal exit			# Jumps to label exit
	

#prompts the user to input values for A, B, C, and X 
    get_input:
    	li $v0,4			# Load String I/O
    	
    	la $a0, function_String		# Print( "f(x) = A*X^2 + B*X + C" )
    	syscall
    			
    	la $a0, ECA			# Print( "Enter coefficient [a]: " )
    	syscall
    	
    	li $v0,5			# Load Input I/O
    	syscall
    	sw $v0, input_A			# Store input into input_A
    	
    	li $v0,4			# Load String I/O
    	la $a0, ECB			# Print( "Enter coefficient [b]: " )
    	syscall
    	
    	li $v0,5			# Load Input I/O
    	syscall
    	sw $v0, input_B			# Store input into input_B
    	
    	li $v0,4			# Load String I/O
    	la $a0, ECC			# Print( "Enter coefficient [c]: " )
    	syscall
    	
    	li $v0,5			# Load Input I/O
    	syscall
    	sw $v0, input_C			# Store input into input_C
    	
    	li $v0,4			# Load String I/O
    	la $a0, EIX			# Print( "Enter coefficient [x]: " )
    	syscall
    	
    	li $v0,5			# Load Input I/O
    	syscall
    	sw $v0, input_X			# Store input into input_X
	
	jr $ra				# Return
#Displays the function, and its return value.
    display_output:
    	li $v0, 4			# Load String I/O
    	la $a0, FOXE			# Prints( "f(x) = " )
    	syscall
    	li $v0, 1			# Load Integer I/O
    	lw $a0, input_A			# Prints( input_A )
	syscall
	li $v0, 4			# Load String I/O
    	la $a0, multi			# Prints( "*" )
    	syscall
    	li $v0, 1			# Load Integer I/O
    	lw $a0, input_X			# Prints( input_X )
	syscall
	li $v0, 4			# Load String I/O
    	la $a0, Squared			# Prints( "^2" )
    	syscall
	la $a0, plus			# Prints( " + " )
    	syscall
    	li $v0, 1			# Load Integer I/O
    	lw $a0, input_B			# Prints( input_B )
	syscall
	li $v0, 4			# Load String I/O
    	la $a0, multi			# Prints( "*" )
    	syscall
    	li $v0, 1			# Load Integer I/O
    	lw $a0, input_X			# Prints( input_X )
	syscall
	li $v0, 4			# Load String I/O
    	la $a0, plus			# Prints( " + " )
    	syscall
    	li $v0, 1			# Load Integer I/O
    	lw $a0, input_C			# Prints( input_C )
	syscall
    	li $v0, 4			# Load String I/O
    	la $a0, equals			# Prints( " = " )
    	syscall
    	li $v0, 1			# Load Integer I/O
    	lw $a0, output_Y		# Prints( output_Y )
	syscall
 
	jr $ra				# Return
#Computes F(X) for the given x and cooefs.

    compute_f_of_x:
    
    
    
    
    
    
    
    
	jr $ra
#Exits the program.
    exit:
    	li $v0, 10			# Loads Exit Command
	syscall
