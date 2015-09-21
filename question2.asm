	.data
D1: 	.word 1,0,3,5,0,4,8,9		
 	.text		
	.globl main
main: 	la $t0, D1
	li $t1, 0 #initialize to zero
	li $t2, 7 #count
Num:	addi $t3, $t2, 0 #position
	lw $t5, 0($t0)
	beq $t5, $zero, ENDFOR
Mult:	sll $t6, $t5, 3		# Multiply by 10^n where n is its position from the least significant digit
	sll $t7, $t5, 1		# This uses left bit shifting of n by 3 and 1 bits, then adds the results to make 10*n.
	add $t5, $t6, $t7	# This can be repeated as many times as necessary using a loop.
	addi $t3, $t3, -1
	bne $t3, $zero, Mult
ENDFOR:	add $t1, $t1, $t5
	addi $t0, $t0, 4
	addi $t2, $t2, -1
	bne $t2, $zero, Num
	lw $t5, 0($t0)
	add $t1, $t1, $t5
	li $v0, 10 # system call for exit
 	syscall # Exit!
	
	
	
	

	
