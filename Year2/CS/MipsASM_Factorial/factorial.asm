    .data
text:   .asciiz "Enter a number: "

    .text
    .globl main

main:
    #print text
    li $v0, 4
    la $a0, text
    syscall

    #getting number input and move to register
    li $v0, 5
    syscall
    move $t0, $v0 

    li $t1, 0

    # li $t1, 0x3
    # addu $t2, $t0, $t1

# loop: 
    sub $t0, $t0, $t1 
    
    li $v0, 






    li $v0, 10
    syscall





    