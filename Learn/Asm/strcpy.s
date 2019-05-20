# This file contain a strcpy function in MIPS assembly
# void strcpy(char x[], char y[])
# {
#	int i = 0;
#
#	while((x[i] = y[i]) != '\0')
#		i++;
# }

# I supposed that `x' and `y' found in `$a0' and `$a1'
#	and `i' in `$s0'

strcpy:
	addi    $sp, $sp, -4        # move stak to store old $s0 value
	sw      $s0, 0($sp)         # store it
	add     $s0,$zero,$zero     # i = 0
LOOP:
	add     $t1,$s0,$a1         # t1 = y[i]
	lbu     $t2,0(t1)           # t2 = t1 = y[i]]
	add     $t3,$s0,$a0         # t3 = x[i]
	sb      $t2,0($t3)          # x[i] = y[i]
	beq     $t2,$zero,END       # if y[i] == 0 GOTO END
	addi    $s0,$s0,i           # i++
	j       LOOP
END:
	lw      $s0,0($sp)          # return back the old value
	addi    $sp,,$sp,4          # increase the stack pointer 
	jr      $ra                 # return to callee
	
