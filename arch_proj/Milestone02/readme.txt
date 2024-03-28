RISCV Processor 
Developed by: Moaz Hafez & Ali El-Khouly 

The project implements the following instructions: 
    Developed and Tested Instructions: 
        R-Type: ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND 
        I-Type:  LW, ADDI, SLTI, SLTIU, XORI, ORI, SLLI, SRLI, SRAI
        U-Type: LUI, AUIPC
        J-Type: JAL
        B-Type: BEQ
        S-Type: SW
    Developed But yet to Be Tested: 
	    B-Type: BNE, BLT, BGE, BLTU, BGEU
    Yet to Be Developed: 
        I-Type: LB, LH, LBU,LHU
        S-Type: SB, SH 
        ECALL, EBREAK  

The instruction memory and the data memory are word addressable for this version. This should be later modified to be byte addressable to support byte and half word operations.
