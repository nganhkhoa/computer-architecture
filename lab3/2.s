.data

NhapA: .asciiz "Nhap vao a: "
NhapB: .asciiz "Nhap vao b: "
NhapC: .asciiz "Nhap vao c: "
Dapan: .asciiz "a = "

.text

li $v0, 4
la $a0, NhapA
syscall
li $v0, 5
syscall
or $s1, $0, $v0 # a


li $v0, 4
la $a0, NhapB
syscall
li $v0, 5
syscall
or $s2, $0, $v0 # b

li $v0, 4
la $a0, NhapC
syscall
li $v0, 5
syscall
or $s3, $0, $v0 # c


blt $s1, -5, else
bgt $s1, 5, else 

add $s1, $s2, $s3
j exit
else:
sub $s1, $s2, $s3

exit:


li $v0, 4
la $a0, Dapan
syscall
or $a0, $0, $s1
li $v0, 1
syscall
