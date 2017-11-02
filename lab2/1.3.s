.data 
Chuoi: .space 100

.text
la $a0, Chuoi
addi $a1, $0, 11
li $v0, 8
syscall

li $v0, 4
syscall