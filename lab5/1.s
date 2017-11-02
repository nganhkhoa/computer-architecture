.data

prompt: .asciiz "Nhap so: "
P: .asciiz "Chu vi:    "
S: .asciiz "Dien tich: "

.text


.globl main


main:

la $a0, prompt

li $v0, 4
syscall
li $v0, 6
syscall
mov.d $f2, $f0

li $v0, 4
syscall
li $v0, 6
syscall
mov.d $f4, $f0

mtc1.d $0, $f0
mtc1.d $0, $f1

# compare if negative
c.le.d $f2, $f0
bc1t exit
c.le.d $f4, $f0
bc1t exit

# compare if zero
c.eq.d $f2, $f0
bc1t zero
c.eq.d $f4, $f0
bc1t zero

# else do calculation 
# and save in f6 and f8

# S
mul.d $f6, $f2, $f4

# P
add.d $f8, $f2, $f4
li $t0, 2
mtc1.d $t0, $f0
mul.d $f8, $f8, $f0

# print out answer
la $a0, P
li $v0, 4
syscall
mov.d $f12, $f8
li $v0, 2
syscall

la $a0, S
li $v0, 4
syscall
mov.d $f12, $f6
li $v0, 2
syscall

j exit


zero:
la $a0, P
li $v0, 4
syscall
mov.d $f12, $f0
li $v0, 2
syscall

la $a0, S
li $v0, 4
syscall
mov.d $f12, $f0
li $v0, 2
syscall

exit:
# exit
li $v0, 10
syscall

