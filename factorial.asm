# Factorial.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

# Assembly (NON-RECURSIVE) version of:
#   int n, fn=1;
#   cout << "Enter a number:\n";
#   cin >> n;
#   for (int x = 2; x <= n; x++) {
#       fn = fn * x;
#   }
#   cout << "Factorial of " << x << " is:\n" << fn << "\n";
#
.data

	# TODO: Write your initializations here
	prompt: .asciiz "Enter a number:\n"
	resultPt1: .asciiz "Factorial of "

	resultPt2: .asciiz " is:\n"

#Text Area (i.e. instructions)
.text
main:

	# TODO: Write your code here
	li $t0, 1

	la $a0, prompt
	li $v0, 4
	syscall

	li $v0, 5
	syscall
	move $t1, $v0

	# initializing loop values
	li $t2, 2
	j loop

loop:
	bgt $t2, $t1, printFactorial
	mult $t0, $t2
	mflo $t0
	addi $t2, $t2, 1
	j loop

printFactorial:
	
	# printing the result strings
	li $v0, 4
	la $a0, resultPt1
	syscall

	li $v0, 1
	move $a0, $t1
	syscall

	li $v0, 4
	la $a0, resultPt2
	syscall

	li $v0, 1
	move $a0, $t0
	syscall

exit:
	li $v0, 10
	syscall
	# TODO: Write code to properly exit a SPIM simulation
