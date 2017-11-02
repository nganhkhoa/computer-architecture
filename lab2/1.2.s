.data

MonHoc: .asciiz "\nKien Truc May Tinh\n"

.text

main:
li $v0, 4
la $a0, MonHoc
syscall