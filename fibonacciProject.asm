.data

enter_fib_number: .asciiz “Insert a positive integer greater than or equal to 25:\n“
return_fib_number: .asciiz "Your Fibonacci number is:\n"

.text
# printing enter_fib_number
li $v0, 4
la $a0, enter_fib_number
syscall
# reading the string entered by user
li $v0, 5
syscall



# calling fib
move $a0, $v0
bge $t0, 25, fib
jal fibonacci
move $a1, $v0


# printing return_fib_number
li $v0, 4
la $a0, return_fib_number
syscall

# returning the result
li $v0, 1
move $a0, $a1
syscall 

#exit function
li $v0, 10
syscall


fib:
addi $sp, $sp, -12
sw $ra, 8($sp)
sw $s0, 4($sp)
sw $s1, 0($sp)
move $s0, $a0
li $v0, 1
ble $s0, 0x2, fibExit
addi $a0, $s0, -1
jal fib
move $s1, $v0
addi $a0, $s0, -2
jal fib
add $v0, $s1, $v0
fibExit:
#end of program
lw $ra, 8($sp)
lw $s0, 4($sp)
lw $s1, 0($sp)
addi $sp, $sp, 12
jr $ra
#finished the fib program


