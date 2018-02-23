.globl	MAX
.globl	SIZE
.globl	getCount
.globl	setCount
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
