#recursive greet algorithm in assembly language

addi a0, zero, 4

greet:
    addi sp, sp, -8 # save registers
    sw a0, 4(sp)  
    sw ra, 0(sp)
	addi t0, zero, 1 # temp = 1
    bgt a0, t0, else # if n>1, go to else
    addi a0, zero, 0 # otherwise return 0
    addi sp, sp, 8 # restore sp
    jr ra
    
else:
	addi a0, a0, -1 # n = n - 1
    jal greet # greet(n-1)
    lw t1, 4(sp) # restore n into t1
    lw ra, 0(sp)
    addi sp, sp, 8
    addi a0, a0, -1
    add a0, t1, a0 # a0 = (n-1) * greet(n-1)
    jr ra
