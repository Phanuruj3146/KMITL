    .data
n:  .word   0x2, 0x3, 0x4

    .text
    .globl  main
main:
    la  $t5, n 
    lw  $t0, 0($t5)
    lw  $t1, 4($t5)
    addu $t2, $t0, $t1
    sw  $t2, 12($t5)