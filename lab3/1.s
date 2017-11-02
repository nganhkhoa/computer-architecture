.data
str1: .asciiz "Computer Architecture is so easy!"
str2: .asciiz "You are right!"
Nhap: .asciiz "Nhap vao mot so: "
.text

li $v0, 4
la $a0, Nhap
syscall
li $v0, 5
syscall

or $t0, $v0, $0

bge $t0, $0, if
la $a0, str2
li $v0, 4
syscall
j exit
if:
la $a0, str1
li $v0, 4
syscall
exit:
