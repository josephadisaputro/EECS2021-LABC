	.text
main:	lw	$a0, MAX($0)		#how it works? lw (load word) $a0 is $0 + "whatever it is in address MAX"
	addi	$v0, $0, 1
	syscall				#this syscall will print the number inside address MAX

	addi     $v0, $0, 11      	# prints space 
        add      $a0, $0, ' '      
        syscall

	add      $a0, $0, $0
	
	addi	$t0, $0, 4		#this is loading SIZE (located in labC3.s) this is possible without calling SIZE, because SIZE is always and only 4 bytes away from MAX
	lb	$a0, MAX($t0)
	syscall
	jr	$ra
