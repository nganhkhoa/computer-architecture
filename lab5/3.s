.data

f_zero:   .float 0.0
f_two:    .float 2.0

endl:     .asciiz "\n"

Nhap_x_A: .asciiz "Nhap xA:           "
Nhap_y_A: .asciiz "Nhap yA:           "

Nhap_x_B: .asciiz "Nhap xB:           "
Nhap_y_B: .asciiz "Nhap yB:           "

Nhap_x_C: .asciiz "Nhap xC:           "
Nhap_y_C: .asciiz "Nhap yC:           "


Dinhlonnhat: .asciiz "Dinh lon nhat:  "
Dientich:    .asciiz "Dien tich:      "

.text
.globl main

main:



#######################################
#     TEST CASES
# A(-2;4), B(-3;1), C(1;5) => S = 4
# A(1;1), B(-2;5), C(4,2) => S = 15/2 ~ 7.5
#
#
#
#


###########
#
# $f4 = xA
# $f5 = yA
# $f6 = xB
# $f7 = yB
# $f8 = xC
# $f9 = yC
#
# $12 = S of triangle
#


##########################
#     INPUT

# A point
# xA | $f4
      la $a0, Nhap_x_A
      li $v0, 4
      syscall
      li $v0, 6
      syscall
      mov.s $f4, $f0

# yA | $f5
      la $a0, Nhap_y_A
      li $v0, 4
      syscall
      li $v0, 6
      syscall
      mov.s $f5, $f0


# B point
# xB | $f6
      la $a0, Nhap_x_B
      li $v0, 4
      syscall
      li $v0, 6
      syscall
      mov.s $f6, $f0

# yB | $f5
      la $a0, Nhap_y_B
      li $v0, 4
      syscall
      li $v0, 6
      syscall
      mov.s $f7, $f0


# C point
# xC | $f4
      la $a0, Nhap_x_C
      li $v0, 4
      syscall
      li $v0, 6
      syscall
      mov.s $f8, $f0

# yC | $f5
      la $a0, Nhap_y_C
      li $v0, 4
      syscall
      li $v0, 6
      syscall
      mov.s $f9, $f0


#     END INPUT
#########################
#     Find maximum x

############
#
# $f4  : xA
# $f6  : xB
# $f8  : xC
# $f12 : result
#

c.lt.s $f4, $f6  # if (!(xA < xB)) // xA >= xB
bc1f a_ge_b      #     goto a_ge_b

# xA < xB
c.lt.s $f6, $f8  # if (!(xB < xC)) // xB >= xC
bc1f chose_b     # chose b else chose c
j chose_c

a_ge_b:
      # check if a == c
      # if not get bigger and return
      c.le.s $f4, $f8 # if (xA <= xC)
      bc1t chose_c
      j chose_a

chose_a:
      mov.s $f12, $f4
      j found_max
chose_b:
      mov.s $f12, $f6
      j found_max
chose_c:
      mov.s $f12, $f8
      j found_max

found_max:

      la $a0, Dinhlonnhat
      li $v0, 4
      syscall
      li $v0, 2
      syscall
      la $a0, endl
      li $v0, 4
      syscall

########################
#     Calculate the Square of Triangle

#######
# $f14 = AB
# $f15 = BC
# $f16 = AC
# $f12 = (AB + BC + AC) / 2


# Get AB
sub.s $f0, $f4, $f6
mul.s $f14, $f0, $f0    # $f14 = (xA - xB)^2
sub.s $f0, $f5, $f7
mul.s $f0, $f0, $f0
add.s $f14, $f14, $f0   # $f14 = (xA - xB)^2 + (yA - yB)^2

sqrt.s $f14, $f14
# END GET AB


# Get BC
sub.s $f0, $f8, $f6
mul.s $f15, $f0, $f0    # $f15 = (xC - xB)^2
sub.s $f0, $f9, $f7
mul.s $f0, $f0, $f0
add.s $f15, $f15, $f0   # $f15 = (xC - xB)^2 + (yC - yB)^2

sqrt.s $f15, $f15
# END GET BC


# Get AC
sub.s $f0, $f4, $f8
mul.s $f16, $f0, $f0    # $f16 = (xA - xC)^2
sub.s $f0, $f5, $f9
mul.s $f0, $f0, $f0
add.s $f16, $f16, $f0   # $f16 = (xA - xC)^2 + (yA - yC)^2

sqrt.s $f16, $f16
# END GET AC


# Get Average value
# need to do heron's formula
# S = √(P(P-A)(P-B)(P-C))
add.s $f12, $f14, $f15
add.s $f12, $f12, $f16
l.s $f0, f_two
div.s $f12, $f12, $f0

########
#     New State
# $f14 = P - A
# $f15 = P - B
# $f16 = P - C
# $f12 = P

sub.s $f14, $f12, $f14
sub.s $f15, $f12, $f15
sub.s $f16, $f12, $f16


# $f12 = P(P-A)(P-B)(P-C)
mul.s $f12, $f12, $f14
mul.s $f12, $f12, $f15
mul.s $f12, $f12, $f16

# square root to get answer
sqrt.s $f12, $f12

la $a0, Dientich
li $v0, 4
syscall
mov.s $f0, $f12
li $v0, 2
syscall
la $a0, endl
li $v0, 4
syscall

li $v0, 10
syscall