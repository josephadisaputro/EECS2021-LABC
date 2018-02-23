.globl	MAX
.globl	SIZE
.globl	getCount
.globl	setCount
.globl	signum
.globl	isprime
.globl	isfactor
#-----------------------------
.data
MAX:	.word	2147483647;
SIZE:	.byte	32;
count:	.word	0
#-----------------------------
	.text
#-----------------------------
getCount: 
	lw	$v0, count($0)
	jr	$ra
#-----------------------------
setCount: 
	add	$t0, $0, $a0	
	sw	$t0, count($0)
	jr	$ra
#-----------------------------
signum:
	sw	$ra, 0($sp)
	addi	$sp, $sp, -4

	add	$t0, $0, $a0	#this is i, i = $t0
	add	$t1, $0, $0	#$t1 is just 0
	slt	$t2, $t0, $t1
	bne	$t2, $t1, then
	j	elsethen
then:	addi	$t9, $0, -1	#result is stored in $t9
	j	fini
elsethen:	
	beq	$t0, $t1, then2
	j	elsethen2
then2: 	addi	$t9, $0, 0
	j	fini
elsethen2:
	addi	$t9, $0, 1
	j	fini

fini:	jal	getCount
	add	$t8, $0, $v0	#just for the sake of storing, lets store count in t8
	addi	$t8, $t8, 1
	
	add	$a0, $0, $t8		
	jal	setCount

	add	$v0, $0, $t9	#well it returns t9 or result, u just have to use $v0

	addi	$sp, $sp, 4
	lw	$ra, 0($sp)
	jr	$ra
#-----------------------------
isprime:
	sw	$ra, 0($sp)
	addi	$sp, $sp, -4

	add	$t0, $0, $a0	#storing i to $t0
	addi	$t2, $0, 2	#candidate = 2
	addi	$t3, $0, 1	#result = 1, 1 means true
	
loop:	bne	$t3, $0, stayInLoop1
	j 	fini1

stayInLoop1:
	slt	$t4, $t2, $t0	#candidate < i 
	bne	$t4, $0, stayInLoop2
	j	fini1
stayInLoop2: 
	add	$a0, $0, $t0
	add	$a1, $0, $t2		
	jal	isfactor
	add	$t3, $0, $v0
	beq	$t3, $0, then3	#if result is false then make it true
	j	else
then3: 	addi	$t3, $0, 1
	j	skip
else:	addi	$t3, $0, 0
	
skip:	addi	$t2, $t2, 1	#candidate++

	j	loop

fini1: 	add	$v0, $0, $t3	#btw result stored in $t3
	addi	$sp, $sp, 4
	lw	$ra, 0($sp)
	jr	$ra
#-----------------------------
isfactor:
	add	$t9, $0, $a0	#t0 is n
	add	$t8, $0, $a1	#t1 is factor

	div	$t9, $t8
	mfhi	$t7

	beq	$t7, $0, then4
	j	else1
then4:	addi	$t6, $0, 1
	j	fini2
else1:	add	$t6, $0, $0	

fini2:	add	$v0, $0, $t6	
	jr	$ra

