.data
Nhap: .asciiz "Nhap vao mot so: "
Dapan: .asciiz "a = "
.text
ori $s0, $0, 0 # a
ori $s1, $0, 10 # b
ori $s2, $0, 5 # c

li $v0, 4
la $a0, Nhap
syscall
li $v0, 5
syscall


beq $v0, 0, case0
beq $v0, 1, case1
beq $v0, 2, case2
beq $v0, 3, case3
j donothing

case0:
add $s0, $s1, $s2
j showAns

case1:
sub $s0, $s1, $s2
j showAns

case2:
mul $s0, $s1, $s2
j showAns

case3:
div $s0, $s1, $s2

showAns:

li $v0, 4
la $a0, Dapan
syscall
or $a0, $0, $s0
li $v0, 1
syscall

donothing:
