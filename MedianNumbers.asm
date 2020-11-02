# MedianNumbers.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

.data

	# TODO: Complete these declarations / initializations

	prompt: .asciiz "Enter the next number:\n"

	result: .asciiz "Median: "

#Text Area (i.e. instructions)
.text

main:

	# TODO: Write your code here
	la $a0, prompt
	li $v0, 4
	syscall

	li $v0, 5
	syscall
	move $t0, $v0

	la $a0, prompt
	li $v0, 4
	syscall

	li $v0, 5
	syscall
	move $t1, $v0

	la $a0, prompt
	li $v0, 4
	syscall

	li $v0, 5
	syscall
	move $t2, $v0

	la $a0, result
	li $v0, 4
	syscall

	li $v0, 1

	# when t0 is greater than t1 check if it still the middle number
	# otherwise check if t1 is the middle number
	bge $t0, $t1, t0check
	bge $t2, $t1, t1median
	bge $t2, $t0, t2median
	j t0median
	
t0check:
	bge $t2, $t0, t0median
	bge $t2, $t1, t2median
	j t1median
t0median:
	move $a0, $t0
	syscall
	j exit
t1median:
	move $a0, $t1
	syscall
	j exit
t2median:
	move $a0, $t2
	syscall
	j exit

exit:
	li $v0, 10
	syscall
	# TODO: Write code to properly exit a SPIM simulation
