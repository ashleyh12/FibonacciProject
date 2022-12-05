.data

user_input: .asciiz "ENTER A POSITIVE INTEGER\n " 
return_fib_number: .asciiz "YOUR FIBONACCI VALUE IS:\n"

.globl main
.text
main:
##entering a fib number
li $v0, 4
la $a0, user_input
syscall
##reading the string entered by user
li $v0, 5
syscall


##calling fib
move $a0, $v0
jal fib
move $a1, $v0


##printing return_fib_number ( = some #)
la $a0, return_fib_number     
li $v0, 4
syscall

##returning the result
li $v0, 1
move $a0, $a1
syscall 

##exit function
li $v0, 10
syscall

##if n equals zero
returnZero:
  move $v0, $zero
  j exit

##if n equals 1
returnOne:
  move $v0, $zero
  addi $v0, $v0, 1
  j exit


fib:

  addi $sp, $sp, -12
  sw $ra, 8($sp)
  
  beq $a0, $zero, returnZero 
  li $s0, 1
  beq $a0, $s0, returnOne
  
  
  sw $s0, 4($sp)
  sw $s1, 0($sp)
  move $s0, $a0
  

  
  li $v0, 1
  ble $s0, 0x2, fibExit
  addi $a0, $s0, -1
  jal fib
  move $t0, $v0
  addi $a0, $s0, -2
  jal fib
  add $v0, $t0, $v0
  
  
fibExit:
  lw $ra, 8($sp)
  lw $s0, 4($sp)
  lw $t0, 0($sp)
  addi $sp, $sp, 12
  jr $ra
  ##finished the fib program
