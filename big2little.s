# big to little endian assembly program

# load bytes into registers
addi t0, zero, 0x12
addi t1, zero, 0x34
addi t2, zero, 0xAB
addi t3, zero, 0xCD

# load bytes to memory
sw t0, 768(zero) # store 12 in address 0x300 + 0
sw t1, 769(zero) # store 34 in address 0x300 + 1
sw t2, 770(zero) # store AB in address 0x300 + 2
sw t3, 771(zero) # store CD in address 0x300 + 3

# read bytes from memory to registers
lb a0, 771(zero) # load contents from address 0x300 + 3 (CD) into register a0
lb a1, 770(zero) # load contents from address 0x300 + 2 (AB) into register a1
lb a2, 769(zero) # load contents from address 0x300 + 1 (34) into register a2
lb a3, 768(zero) # load contents from address 0x300 + 0 (12) into register a3

# store bytes into memory in reverse
sb a0, 768(zero) # store contents from  a0 (CD) into address 0x300 + 0
sb a1, 769(zero) # store contents from a1 (AB) into address 0x300 + 1
sb a2, 770(zero) # store contents from a2 (34) into address 0x300 + 2
sb a3, 771(zero) # store contents from a3 (12) into address 0x300 +3