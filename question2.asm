	.data
D1: 	.word 1,0,3,5,0,4,8,9		
 	.text		
	.globl main
main: 	la $t0, D1
	li $t1, 0 #initialize to zero
	li $t2, 7 #count
Num:	addi $t2, $t2, 0
	addi $t3, $t2, 0 #position
	lw $t5, 0($t0)
	beq $t5, $zero, END
	#beq $t3, $zero, END
Mult:	
	sll $t6, $t5, 3
	sll $t7, $t5, 1
	add $t5, $t6, $t7
	addi $t3, $t3, -1
	#beq $t2, $zero, END
	bne $t3, $zero, Mult
END:	add $t1, $t1, $t5
	addi $t0, $t0, 4
	addi $t2, $t2, -1
	addi $t3, $t2, -1 #position
	bne $t2, $zero, Num
	lw $t5, 0($t0)
	add $t1, $t1, $t5
	li $v0, 10 # system call for exit
 	syscall # Exit!
	
	
	
	

	