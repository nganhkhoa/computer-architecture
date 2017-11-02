.data
Chuoi: .asciiz "1611617 - Nguyen Anh Khoa"

.text

lb $t1, Chuoi           # 0(Chuoi)
lb $t2, Chuoi + 24      # 24(Chuoi)

sb $t2,Chuoi
sb $t1,Chuoi + 24

la $a0, Chuoi
li $v0, 4
syscall