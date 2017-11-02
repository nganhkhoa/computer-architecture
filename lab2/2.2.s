li $s0, 66000
addi $t0, $0, 2

# 300 = 2^8 + 2^5 + 2^4 - 2^2
sll $t1, $t0, 7
addu $s0, $t1, $s0 

sll $t1, $t0, 4
addu $s0, $t1, $s0

sll $t1, $t0, 3
addu $s0, $t1, $s0

sll $t1, $t0, 1
subu $s0, $s0, $t1

# 6000 = 2^12 + 2^10 + 2^9 + 2^8 + 2^7 - 2^4
sll $t1, $t0, 11
subu $s0, $s0, $t1

sll $t1, $t0, 9
subu $s0, $s0, $t1

sll $t1, $t0, 8
subu $s0, $s0, $t1

sll $t1, $t0, 7
subu $s0, $s0, $t1

sll $t1, $t0, 6
subu $s0, $s0, $t1

sll $t1, $t0, 3
addu $s0, $s0, $t1

# 25 = 2^4 + 2^3 + 2^0

sll $t1, $t0, 3
addu $s0, $s0, $t1

sll $t1, $t0, 2
addu $s0, $s0, $t1

addiu $s0, $s0, 1