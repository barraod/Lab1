	.data
D1: 	.word 0,3,8,10,11
D2:	.word 1,4,5,9,12
num:	.word 5	
res:	.word 
 	.text		
	.globl main
main:	la $t0, D1 		#A
	la $t1, D2 		#B
	la $t2, num  		#number of elements to address
	lw $t3, 0($t2)		#number of elements to word
	la $t4 res		#pointer to store results
	li $s0, 5		#i counter for A elements
	li $s1, 5		#j counter for B elements
loop:	lw $t5 0($t0)		#load A[i]
	lw $t6 0($t1)		#load B[j]
	beq $s0, $zero, Aempty
	beq $s1, $zero, Bempty
	slt $s2, $t6, $t5	
	bne $s2, $zero, Abig
	beq $t5, $t6, Abig
	beq $s1,$zero,Bbig
Bbig:	sw $t5, 0($t4)		# B is bigger, so we place in A[i]
	addi $t4, $t4, 4	# increment result pointer
	addi $s0, $s0, -1	# reduce i
	addi $t0, $t0, 4
	j loop
Abig:	sw $t6, 0($t4)		# A is bigger, so we place in B[j]
	addi $t4, $t4, 4	# increment result pointer
	addi $s1, $s1, -1	# reduce j
	addi $t1, $t1, 4
	j loop
Aempty: sw $t6, 0($t4) ## TODO: WHat if both are empty
	addi $t4, $t4, 4
	addi $s1, $s1, -1
	bne $s1, $zero, Aempty
	j Finished
Bempty:	sw $t5, 0($t4)
	addi $t4, $t4, 4
	addi $s0, $s0, -1
	bne $s0, $zero, Bempty
	j Finished
#ENDIF:	addi $t4, $t4, 4
#	addi $t0, $t0, 4
#	addi $t1, $t1, 4
#	addi $t3, $t3, -1
#	bne $t3, $zero, loop
Finished:	
	li $v0, 10 # system call for exit
 	syscall # Exit!
	
