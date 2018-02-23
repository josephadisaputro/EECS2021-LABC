# this is done by Yusuf Adisaputro, 213533088
# here there are sumdiff and printinln 
# what they do? both are explain in labc.s file

.globl	sumdiff
.globl	printinln
#-----------------------------
.data
newline:	.asciiz "\n"
#-----------------------------
.text
#-----------------------------
sumdiff:	
	add	$t0, $0, $a0
	add	$t1, $0, $a1	
	add	$t2, $0, $a2

	add	$t9, $t0, $t1
	sub	$t8, $t1, $t2

	add	$v0, $0, $t9
	add	$v1, $0, $t8	
	jr	$ra
#-----------------------------
printinln:
	add	$t0, $0, $a0

	add	$a0, $0, $t0
	addi	$v0, $0, 1
	syscall
	la	$a0, newline
	addi	$v0, $0, 4
	syscall

	jr	$ra
	
	
