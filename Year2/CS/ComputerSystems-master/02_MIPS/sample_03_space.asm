    .data
n:  .word   0x7
m:  .word   0x8
r:  .space  12
q:  .word   0x9

    .text
    .globl  main

main:
    li      $t5, 0x7
    lw		$t0, n
    lw      $t1, m
    addu    $t2, $t0, $t1
    sw		$t2, r	
    lw      $t3, q
    # li  $v0, 4
    # la  $a0, str
    # syscall