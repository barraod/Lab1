	.data 		# data goes in data segment
D1: 	.word 0,1,2,3,4 	# data stored in words
D2: 	.word 5,6,7,8,9
 	.text		# code goes in text segment
	.globl main 	# must be global symbol
main: 	la $t0, D1 	# load address pseudo-instruction
 	la $t4, D2
	lw $t2, 0($t0)
 	lw $t3, 0($t4)
 	sw $t2, 0($t4)
	sw $t3, 0($t0)
 	lw $t2, 4($t0)
 	lw $t3, 4($t4)
 	sw $t2, 4($t4)
 	sw $t3, 4($t0)
 	lw $t2, 8($t0)
 	lw $t3, 8($t4)
 	sw $t2, 8($t4)
 	sw $t3, 8($t0)
 	lw $t2, 12($t0)
 	lw $t3, 12($t4)
 	sw $t2, 12($t4)
	sw $t3, 12($t0)
	lw $t2, 16($t0)
 	lw $t3, 16($t4)
 	sw $t2, 16($t4)
	sw $t3, 16($t0)
	#
 	li $v0, 10 # system call for exit
 	syscall # Exit!