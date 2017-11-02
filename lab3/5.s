.data

str: .asciiz "Computr Architctur CSE-HCMUT"
Dapan: .asciiz "Chu e dau tien tai: "
.text

la $t0, str # run char
ori $t1, $0, 0 # count var
ori $s0, $0, 0 # ans var
addi $s1, $0, 'e' # char compare

while:
lb $t2, 0($t0)

beq $t2, 0, notfound
beq $t2, $s1, found

addi $t0, $t0, 1
addi $t1, $t1, 1
j while


notfound:
ori $s0, $0, -1
j exit

found:
or $s0, $t1, $0

exit:

li $v0, 4
la $a0, Dapan
syscall
or $a0, $0, $s0
li $v0, 1
syscall
