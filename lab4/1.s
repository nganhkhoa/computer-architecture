.data
cArray: .asciiz "Computer Architecture 2017"
first_idx: .word 2
swap_idx: .word 4

.text

.globl main

main:

la $a0, cArray
lw $a1, first_idx
lw $a2, swap_idx
jal swap

li $v0, 4
syscall


# exit
li      $v0, 10
syscall



swap:

bltz $a1, fail
bltz $a2, fail

# get cArray[first_idx]
add $t0, $a0, $a1
lbu $t1, 0($t0)

# get cArray[swap_idx]
add $t2, $a0, $a2
lbu $t3, 0($t2)

sb $t3, 0($t0)
sb $t1, 0($t2)

li $v0, 0
jr $ra


fail:
li $v0, -1
jr $ra