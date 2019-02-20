# Assembly Program

# A polynomial evaluator program...
# Evaluates a quardatic polynomial...
# Ex:		f(x) = a*x^2 + b*x + c
# Input: 	a, b, c, and x
# Output:	f(x), the value of the polynomial at x

.data
    input_A:		.word 5	#Input Coeff A
    input_B:		.word 4 #Input Coeff B
    input_C:		.word 3 #Input Coeff C
    input_X:		.word 2 #Input Evaluation value X
    output_Y:		.word 1 #Output Value
    function_String:	.asciiz "f(x) = A*x^2 + B*x + C\n\n"
    ECA:		.asciiz "Enter coefficient [a]: "
    ECB:		.asciiz "Enter coefficient [b]: "
    ECC:		.asciiz "Enter coefficient [c]: "
    EIX:		.asciiz "Enter input value [x]: "
    FOXE:		.asciiz "f(x) = "
.text
#Entry point into the program.
    main:
    	jal get_input
    	jal compute_f_of_x
	jal display_output
	jal exit
	

#prompts the user to input values for A, B, C, and X 
    get_input:
    	li $v0,4
    	la $a0, function_String
    	syscall
    	la $a0, ECA
    	syscall
	jr $ra
#Displays the function, and its return value.
    display_output:
    	li $v0, 1
	lw $a0, input_A
	syscall
	jr $ra
#Computes F(X) for the given x and cooefs.

    compute_f_of_x:
	jr $ra
#Exits the program.
    exit:
    	li $v0, 10
	syscall