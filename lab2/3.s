.data
Ham: .asciiz "\nf = ax^3 - bx^2 - cx + d\n"
Ketqua: .asciiz "Ket qua: "
Nhap: .asciiz "Nhap "

.text

li $v0, 4
la $a0, Ham
syscall

li $v0, 4
la $a0, Nhap
syscall
li $v0, 11
addi $a0, $0, 'A'
syscall
addi $a0, $s0, ':'
syscall
addi $a0, $s0, ' '
syscall
# a
li $v0, 5
syscall
add $s1, $0, $v0

li $v0, 4
la $a0, Nhap
syscall
li $v0, 11
addi $a0, $0, 'B'
syscall
addi $a0, $s0, ':'
syscall
addi $a0, $s0, ' '
syscall
# b
li $v0, 5
syscall
add $s2, $0, $v0

li $v0, 4
la $a0, Nhap
syscall
li $v0, 11
addi $a0, $0, 'C'
syscall
addi $a0, $s0, ':'
syscall
addi $a0, $s0, ' '
syscall
# c
li $v0, 5
syscall
add $s3, $0, $v0

li $v0, 4
la $a0, Nhap
syscall
li $v0, 11
addi $a0, $0, 'D'
syscall
addi $a0, $s0, ':'
syscall
addi $a0, $s0, ' '
syscall
# d
li $v0, 5
syscall
add $s4, $0, $v0

li $v0, 4
la $a0, Nhap
syscall
li $v0, 11
addi $a0, $0, 'x'
syscall
addi $a0, $s0, ':'
syscall
addi $a0, $s0, ' '
syscall
# x
li $v0, 5
syscall
add $s5, $0, $v0


# a = $s1
# b = $s2
# c = $s3
# d = $s4
# x = $s5


ori $s0, 0
mul $s0, $s1, $s5
subu $s0, $s0, $s2
mul $s0, $s0, $s5
subu $s0, $s0, $s3
mul $s0, $s0, $s5
addu $s0, $s0, $s4

li $v0, 4
la $a0, Ketqua
syscall

addu $a0, $0, $s0
li $v0, 1
syscall