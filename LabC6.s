.globl	MAX
.globl	SIZE
.globl	getCount
.globl	setCount
.globl	signum
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



 
