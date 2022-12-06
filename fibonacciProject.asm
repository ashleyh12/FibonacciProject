.data

user_input: .asciiz "ENTER A POSITIVE INTEGER\n " 
return_fib_number: .asciiz "YOUR FIBONACCI VALUE IS:\n"

.globl main
.text
main:
##printing out fib number
li $v0, 4
la $a0, user_input
syscall
##prompt the user to input number n
li $v0, 5
syscall
beq $v0, 0, equalsZero



##calling fib
move $a0, $v0
jal fib
move $a1, $v0


##printing return_fib_number ( = some #)
li $v0, 4
la $a0, return_fib_number     
syscall

##returning the result
li $v0, 1
move $a0, $a1
syscall 

##exit function
li $v0, 10
syscall

##if the function n = 0
equalsZero:
  li $v0, 4
  la $a1, return_fib_number
  syscall

fib:

##
  ##beq $a0, $zero, returnZero  (evaluates returnZero and returnOne function)
  ##li $s0, 1
  ##beq $a0, $s0, returnOne
##

  addi $sp, $sp, -12
  sw $ra, 8($sp)            ##store the returned address
  sw $s0, 4($sp)            ##store n
  sw $s1, 0($sp)            ##store f(n-1)
  move $s0, $a0             ##using s0 to store a0
  
  li $v0, 1
  ble $s0, 0x2, fibExit     ##checking the function
  addi $a0, $s0, -1         ##creating arguments for f(N-1)
  jal fib                   ##call f(n-1)
  move $s1, $v0             ##storing f(n-1) to s1
  addi $a0, $s0, -2         ##creating arguments for f(n-2)
  jal fib                   #calling fib function for f(n-2)
  add $v0, $s1, $v0         ##adding f(n-1) to f(n-2)
  
  
fibExit:
  lw $ra, 8($sp)  
  lw $s0, 4($sp)  
  lw $s1, 0($sp) 
  addi $sp, $sp, 12
  jr $ra
  ##finished the fib program
  

##if n equals zero
##returnZero:
 ## move $v0, $zero
  ##j exit
  ##syscall

##if n equals 1
##returnOne:
##  move $v0, $zero
##addi $v0, $s0, 1
 ## j exit
 ## nop

