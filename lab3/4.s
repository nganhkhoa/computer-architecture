.data
Nhap: .asciiz "Nhap vao mot so: "
Dapan: .asciiz "a = "
.text
li $v0, 4
la $a0, Nhap
syscall
li $v0, 5
syscall

ori $s0, $0, 0 # return var

beq $v0, 0, return0
beq $v0, 1, return1

# else
ori $t0, 0
ori $t1, 1
ori $t2, 2 # bien tam

for:
bgt $t2, $v0, exit
add $s0, $t0, $t1
ori $t0, $t1, 0
ori $t1, $s0, 0
add $t2, $t2, 1
j for

return0:
ori $s0, $v0, 0
j exit

return1:
ori $s0, $v0, 1
j exit

exit:

li $v0, 4
la $a0, Dapan
syscall
or $a0, $0, $s0
li $v0, 1
syscall
