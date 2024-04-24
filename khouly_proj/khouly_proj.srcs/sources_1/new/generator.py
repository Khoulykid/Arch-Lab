import random

def get_random_number(n):
    return random.randint(0, n)


instructions = get_random_number(30)
result = []
for i in range(instructions):
    opdecide = get_random_number(10)
    opcode = ""
    inst = ""
    if(opdecide == 0):
        opcode = "01100"
        rd = bin(get_random_number(31))[2:].zfill(5)
        rs1 = bin(get_random_number(31))[2:].zfill(5)
        rs2 = bin(get_random_number(31))[2:].zfill(5)
        fun_dec = get_random_number(7)
        if(fun_dec == 0):
            funct3 = "000"
        elif(fun_dec == 1):
            funct3 = "001"
        elif(fun_dec == 2):
            funct3 = "010"
        elif(fun_dec == 3):
            funct3 = "011"
        elif(fun_dec == 4):
            funct3 = "100"
        elif(fun_dec == 5):
            funct3 = "101"
        elif(fun_dec == 6):
            funct3 = "110"
        elif(fun_dec == 7):
            funct3 = "111"
        if fun_dec in [0, 5]:
            if(get_random_number(1) == 0):
                funct7 = "0000000"
            else:
                funct7 = "0100000"
        else:
            funct7 = "0000000"
        inst = funct7 + rs2 + rs1 + funct3 + rd + opcode + "11"
    elif(opdecide == 1):
        opcode = "00100"
        rd = bin(get_random_number(31))[2:].zfill(5)
        rs1 = bin(get_random_number(31))[2:].zfill(5)
        imm = bin(get_random_number(50))[2:].zfill(12)
        fun_dec = get_random_number(8)
        shamt = bin(get_random_number(31))[2:].zfill(5)
        if(fun_dec == 0):
            funct3 = "000"
        elif(fun_dec == 1):
            funct3 = "010"
        elif(fun_dec == 2):
            funct3 = "011"
        elif(fun_dec == 3):
            funct3 = "100"
        elif(fun_dec == 4):
            funct3 = "110"
        elif(fun_dec == 5):
            funct3 = "111"
        elif(fun_dec == 6):
            funct3 = "001"
            funct7 = "0000000"
        elif(fun_dec == 7):
            funct3 = "101"
            funct7 = ""
            if(get_random_number(1) == 0):
                funct7 = "0000000"
            else:
                funct7 = "0100000"
        if fun_dec in [0, 1, 2, 3, 4, 5]:
            inst = imm + rs1 + funct3 + rd + opcode + "11"
        else:
            inst = funct7 + shamt + rs1 + funct3 + rd + opcode + "11"
            
    elif(opdecide == 2):
        opcode = "00000"
        rd = bin(get_random_number(31))[2:].zfill(5)
        rs1 = bin(get_random_number(31))[2:].zfill(5)
        imm = bin(get_random_number(100))[2:].zfill(12)
        fun_dec = get_random_number(4)
        if(fun_dec == 0):
            funct3 = "000"
        elif(fun_dec == 1):
            funct3 = "001"
        elif(fun_dec == 2):
            funct3 = "010"
        elif(fun_dec == 3):
            funct3 = "100"
        elif(fun_dec == 4):
            funct3 = "101"
        inst = imm + rs1 + funct3 + rd + opcode + "11"
    elif(opdecide == 3):
        opcode = "01000"
        rs1 = bin(get_random_number(31))[2:].zfill(5)
        rs2 = bin(get_random_number(31))[2:].zfill(5)
        imm1 = bin(get_random_number(31))[2:].zfill(5)
        imm2 = bin(get_random_number(31))[2:].zfill(7)
        fun_dec = get_random_number(2)
        if(fun_dec == 0):
            funct3 = "000"
        elif(fun_dec == 1):
            funct3 = "001"
        elif(fun_dec == 2):
            funct3 = "010"
        inst = imm2 + rs2 + rs1 + funct3 + imm1 + opcode + "11"

    elif(opdecide == 4):
        opcode = "11000"
        rs1 = bin(get_random_number(31))[2:].zfill(5)
        rs2 = bin(get_random_number(31))[2:].zfill(5)
        imm = bin(get_random_number(10)*4)[2:].zfill(13)
        imm1 = imm[1:5][::-1] + imm[11]
        imm2 = imm[12] + imm[5:11][::-1]
        fun_dec = get_random_number(2)
        if(fun_dec == 0):
            funct3 = "000"
        elif(fun_dec == 1):
            funct3 = "001"
        elif(fun_dec == 2):
            funct3 = "010"
        inst = imm2 + rs2 + rs1 + funct3 + imm1 + opcode + "11"
    elif(opdecide == 5):
        opcode = "01101"
        rd = bin(get_random_number(31))[2:].zfill(5)
        imm = bin(get_random_number(31))[2:].zfill(20)
        inst = imm + rd + opcode + "11"
    elif(opdecide == 6):
        opcode = "00101"
        rd = bin(get_random_number(31))[2:].zfill(5)
        imm = bin(get_random_number(31))[2:].zfill(32)
        inst = imm[12:32][::-1] + rd + opcode + "11"
    elif(opdecide == 7):
        opcode = "11011"
        rd = bin(get_random_number(31))[2:].zfill(5)
        imm = bin(get_random_number(10)*4)[2:].zfill(31)
        inst = imm[20] + imm[1:11][::-1] + imm[11] + imm[12:20][::-1] + rd + opcode + "11"
            
    elif(opdecide == 8):
        opcode = "11001"
        rd = bin(get_random_number(31))[2:].zfill(5)
        rs1 = bin(get_random_number(31))[2:].zfill(5)
        funct3 = "000"
        imm = bin(get_random_number(10)*4)[2:].zfill(12)
        inst = imm + rs1 + funct3 + rd + opcode + "11"
        print(inst)
    elif(opdecide == 9):
        opcode = "11100"
        fun_dec = get_random_number(1)
        if(fun_dec == 0):
            inst = bin(0)[2:].zfill(25) + opcode + "11"
        else:
            inst = bin(1)[2:].zfill(12) + bin(0)[2:].zfill(8) + opcode + "11"
    elif(opdecide == 10):
        opcode = "00011"
        inst = "1".zfill(20) + "00000" + opcode + "11"
    result.append("8\'b"+inst[0:8])
    result.append("8\'b"+inst[8:16])
    result.append("8\'b"+inst[16:24])
    result.append("8\'b"+inst[24:32])

with open("instructions.txt", "w") as f:
    f.write("mem[0] = 8'b00000000;\n")
    f.write("mem[1] = 8'b00000000;\n")
    f.write("mem[2] = 8'b00000000;\n")
    f.write("mem[3] = 8'b00110011;\n")

    for i, item in enumerate(result, start=4): 
        f.write("mem[%d] = %s;\n" % (i, item))
    
    