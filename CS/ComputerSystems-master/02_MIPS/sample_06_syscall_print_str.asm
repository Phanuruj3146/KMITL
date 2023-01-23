        .data
str:    .asciiz "Computer Systems"

        .text
        .globl main
main:
    li  $v0, 4
    la  $a0, str
    syscall