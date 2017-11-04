.data

prompt: .asciiz "Nhap so:   "
P: 	.asciiz "Chu vi:    "
S: 	.asciiz "Dien tich: "

v1: 		.float 2.0
zero_val: 	.float 0.0
endl: 		.asciiz "\n"

.text
.globl main


main:

#############
# Variables
# $f3 = canh 1
# $f4 = canh 2
# $f5 = dien tich
# $f6 = chu vi
#
# $f0 for temp
# $f2 is for compare flag
#


# data setup
l.s $f5, zero_val
l.s $f6, zero_val

# input data
la $a0, prompt

li $v0, 4
syscall
li $v0, 6
syscall
mov.s $f3, $f0 # input $f3

li $v0, 4
syscall
li $v0, 6
syscall
mov.s $f4, $f0 # input $f4

mtc1 $0, $f0

# compare if negative
c.le.s $f3, $f0
bc1t exit
c.le.s $f4, $f0
bc1t exit

# compare if zero
c.eq.s $f3, $f0
bc1t print
c.eq.s $f4, $f0
bc1t print

# else do calculation 
# and save in f8 and f10

# S
mul.s $f5, $f3, $f4

# P
add.s $f6, $f3, $f4
l.s $f0, v1 		# load $f0 = 2
mul.s $f6, $f6, $f0	# $f6 = $f6 * 2

# print out answer
print:
la $a0, P
li $v0, 4
syscall
mov.s $f12, $f6
li $v0, 2
syscall
la $a0, endl
li $v0, 4
syscall


la $a0, S
li $v0, 4
syscall
mov.s $f12, $f5
li $v0, 2
syscall
la $a0, endl
li $v0, 4
syscall


# exit
exit:
li $v0, 10
syscall
