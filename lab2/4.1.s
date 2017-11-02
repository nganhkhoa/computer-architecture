.data

Array: .word 1,2,3,4,5,6,7,8,9,10

.text

lw $t1, Array+8   # 8(Array)
lw $t2, Array+20  # 20(Array)

addu $a0, $t1, $t2
li $v0, 1
syscall