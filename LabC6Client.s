	.text
main:	sw	$ra, 0($sp)
	addi	$sp, $sp, -4

	addi     $v0, $0, 5        	# v0 = readInt # service 5 for read input integer, well asking for 1 for signum in this case
        syscall         
        add      $t0, $0, $v0 
	
	add	$a0, $0, $t0
	jal	signum
	add	$a0, $0, $v0
	addi	$v0, $0, 1
	syscall
#-----------------------------
	addi     $v0, $0, 11      	# prints space 
        add      $a0, $0, ' '      
        syscall
#-----------------------------
	jal	getCount
	add	$a0, $0, $v0
	addi	$v0, $0, 1
	syscall
	
	addi	$sp, $sp, 4
	lw	$ra, 0($sp)
	jr	$ra
