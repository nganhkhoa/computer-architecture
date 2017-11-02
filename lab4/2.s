.data
iArray: .word 1 2 3 4 5 6 7 8 9 10
iArray_size: .word 10

.text

.globl main

main:


la $a0, iArray
lw $a1, iArray_size
jal range

# print ans
addi $a0, $v0, 0
li $v0, 1
syscall

# exit
li $v0, 10
syscall


range:

# save the return addr
addi $sp, $sp, -4
sw $ra, 0($sp)

# find min
jal min
addu $s0, $0, $v0

# find max
jal max
addu $s1, $0, $v0

# calculate return value
subu $v0, $s0, $s1

# get return addr
lw $ra, 0($sp)
addi $sp, $sp, 4
jr $ra

# param as if
min:
# temp runner var
ori $t0, $a0, 0
lw $v0, 0($t0)
ori $t1, 1
addi $t0, $t0, 4
	min_for:
	beq $t1, $a1, min_for_end
	lw $t2, 0($t0)
	
	# if (iArray[t0] >= min) skip
	bge $t2, $v0, min_ignore
		ori $v0, $t2, 0	
	min_ignore:
	
	# increment
	addi $t0, $t0, 4
	addi $t1, $t1, 1
	j min_for
min_for_end:
jr $ra




# param as if
max:
ori $t0, $a0, 0
lw $v0, 0($t0)
addi $t1, $0, 1
addi $t0, $t0, 4
	max_for:
	beq $t1, $a1, max_for_end
	lw $t2, 0($t0)
	
	# if (iArray[t0] >= min) skip
	ble $t2, $v0, max_ignore
		ori $v0, $t2, 0	
	max_ignore:
	
	# increment
	addi $t0, $t0, 4
	addi $t1, $t1, 1
	j max_for
max_for_end:
jr $ra
