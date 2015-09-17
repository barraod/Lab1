# 2011 Assignment 1, Question 3 
# Write a program to determine whether a (variable length) sequence of digits and a checksum are 
# consistent. The length of the sequence, the digits and the checksum should be held in memory 
# prior to execution of the program. The program should store a valid/invalid indicator in memory. 
# The program should use a loop.
# Test the program using valid and invalid sequences and checksums based on your student number.
#
            .data
DataIn:     .word       1,2,3,4,5,6,7,8
Len:        .word       8
CheckSum:   .word       36
ValidFlag:  .word       2
            .text       
            .globl      main
main:       la          $t0, DataIn         # t0 = *DataIn
            la          $t1, Len            # t1 = *Len
            lw          $t2, 0($t1)         # t2 = Len (counter)
            li          $t3, 0              # t3 = 0  (total)
Loop:       lw          $t4, 0($t0)         # t4 = DataIn
            add         $t3, $t3, $t4       # total = total + DataIN        
            addi        $t0, $t0, 4         # *DataIn = *DataIn + 4
            addi        $t2, $t2, -1        # counter - counter -1
            bne         $t2, $zero, Loop    # if counter != 0 then goto Loop
            la          $t5, CheckSum       # t5 = *CheckSum
            lw          $t6, 0($t5)         # t6 = CheckSum
            bne         $t6, $t3, Invalid   # if CheckSum != total then goto Invalid
Valid:      li          $t7, 1              # t7 = 1 (ValidFlag = true)
            j           IfEnd               # goto IfEnd
Invalid:    li          $t7, 0              # t7 = 0 (ValidFlag - false)
IfEnd:      la          $t8, ValidFlag      # t8 = *ValidFlag
            sw          $t7, 0($t8)         # store ValidFlag at *ValidFlag
            li          $v0, 10             # system call for exit
            syscall                         # Exit!     