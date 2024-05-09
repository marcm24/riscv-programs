#bubble sort assembly program

addi s0, zero, 89
addi s1, zero, 63
addi s2, zero, -55
addi s3, zero, -107
addi s4, zero, 42
addi s5, zero, 98
addi s6, zero, -425
addi s7, zero, 203
addi s8, zero, 0
addi s9, zero, 303 # storing the values of the array into the registers

sw s0, 1024(zero)
sw s1, 1028(zero)
sw s2, 1032(zero)
sw s3, 1036(zero)
sw s4, 1040(zero)
sw s5, 1044(zero)
sw s6, 1048(zero)
sw s7, 1052(zero)
sw s8, 1056(zero)
sw s9, 1060(zero) # storing all of these values into the memory

# sortarray starts at 0x400
# s0 = array base address
# s2 = i
# s3 = j
addi s0, zero, 0x00000400   # s0 = 0x400
addi s1, zero, 0x00000404 # s1 = 0x404
addi s2, zero, 0   # i = 0
addi s3, zero, 0 # j = 0
addi t0, zero, 9  # t0 = 9 (size - 1)
sub t1, t0, s2 # t1 = (size - i - 1)
addi t2, zero, 4 # t2 = 4

outloop:
	bge s2, t0, done # if i >= size - 1, done
    addi s2, s2, 1
    addi s3, zero, 0
    addi s0, zero, 0x00000400   # s0 = 0x400
	addi s1, zero, 0x00000404 # s1 = 0x404
    j innerloop
    
    
innerloop:
	bge s3, t1, outloop # if j > size - i - 1, outloop
    lw s4, 0(s0) # s4 = sortarray[j]
    lw s5, 0(s1) # s5 = sortarray[j+1]
    bgt s4, s5, swap # if sortarray[j] > sortarray[j + 1], swap
    addi s3, s3, 1
    add s0, s0, t2
    add s1, s1, t2
    j innerloop
    
swap:
    sw s4, 0(s1)# sortarray[j] = sortarray[j+1]
    sw s5, 0(s0) # sortarray[j+1] = sortarray[j]
    addi s3, s3, 1 # j = j + 1
    add s0, s0, t2 
    add s1, s1, t2
    j innerloop
    
done:


