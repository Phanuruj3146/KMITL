        .data
str:    .asciiz "Computer"

        .text
        .globl main
main:
    li  $v0, 4
    la  $a0, str
    syscall