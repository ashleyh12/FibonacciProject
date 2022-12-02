.data

enter_fib_number: .asciiz “Insert a positive integer greater than or equal to 25:\n“
return_fib_number: .asciiz "Your Fibonacci number is:\n"
error: .asciiz “That is an illegal number\n”

.text
# printing enter_fib_number
li $v0, 4
la $a0, enter_fib_number
syscall
# reading the string entered by user
li $v0, 5
