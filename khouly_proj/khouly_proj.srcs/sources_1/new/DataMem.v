`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2024 02:40:36 PM
// Design Name: 
// Module Name: InstMem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DataMem(input clk, input MemRead, input MemWrite, input [1:0] memOffset,input unsignedFlag,
    input [31:0] addr, input [31:0] data_in, output reg [31:0] data_out);
    reg [7:0] mem [(4*1024-1):0]; //4KB memory
    always @(*) begin
    if(MemRead) begin
        if(memOffset == 2'b11) begin
            data_out[7:0] = mem[addr+3];
            data_out[15:8] = mem[addr+2];
            data_out[23:16] = mem[addr+1];
            data_out[31:24] = mem[addr];
        end
        else if(memOffset == 2'b10) begin
            data_out[7:0] = mem[addr+3];
            data_out[15:8] = mem[addr+2];
            if(unsignedFlag) data_out[31:16] = 16'b0;
            else data_out[31:16] = {16{data_out[15]}};
        end
        else if(memOffset == 2'b01) begin
            data_out[7:0] = mem[addr+3];
            if(unsignedFlag) data_out[31:8] = 24'b0;
            else data_out[31:8] = {24{data_out[7]}};
        end
        end 
        else data_out=0; 
    end

    always@(posedge clk )begin
        if(MemWrite) begin
             if(memOffset == 2'b11) begin
                 mem[addr+3] = data_in[7:0];
                 mem[addr+2] = data_in[15:8];
                 mem[addr+1] = data_in[23:16];
                 mem[addr] = data_in[31:24];
             end
             else if(memOffset == 1'b10) begin
                 mem[addr+3] = data_in[7:0];
                 mem[addr+2] = data_in[15:8];
             end
             else if(memOffset == 2'b01) begin
                 mem[addr+3] = data_in[7:0];
             end
         end
 end

    initial begin 
        
        // add x0, x0, x0
        mem[0] = 8'b00000000;
        mem[1] = 8'b00000000;
        mem[2] = 8'b00000000;
        mem[3] = 8'b00110011;

        // sub x1, x3, x1   01000000000100011000000010110011
        mem[4] = 8'b01000000;
        mem[5] = 8'b00010001;
        mem[6] = 8'b10000000;
        mem[7] = 8'b10110011;

        // sll x3, x4, x5          x3 =128          
        mem[8] = 8'b00000000;
        mem[9] = 8'b01010010;
        mem[10] = 8'b00010001;
        mem[11] = 8'b10110011; 
        
        
        //slt x4, x5, x6          x4 = 1
        mem[12] = 8'b00000000;
        mem[13] = 8'b01100010;
        mem[14] = 8'b10100010;
        mem[15] = 8'b00110011;

        // slt x5, x6, x5           x5 = 0 
        mem[16] = 8'b00000000;
        mem[17] = 8'b01010011;
        mem[18] = 8'b00100010;
        mem[19] = 8'b10110011;

        // xor x6, x7, x8          x6 = 15
        mem[20] = 8'b00000000;
        mem[21] = 8'b10000011;
        mem[22] = 8'b11000011;
        mem[23] = 8'b00110011;

        // srl x7, x7, x1          x7 = 1
        mem[24] = 8'b00000000;
        mem[25] = 8'b00010011;
        mem[26] = 8'b11010011;
        mem[27] = 8'b10110011;

        // or x8, x8, x15           x8 = 15
        mem[28] = 8'b00000000;
        mem[29] = 8'b11110100;
        mem[30] = 8'b01100100;
        mem[31] = 8'b00110011;

        // and x9, x9, x10         x9 = 8
        mem[32] = 8'b00000000;
        mem[33] = 8'b10100100;
        mem[34] = 8'b11110100;
        mem[35] = 8'b10110011;

        // addi x10, x10, 2        x10 = 12 00000000001001010000010100010011
        mem[36] = 8'b00000000;
        mem[37] = 8'b00100101;
        mem[38] = 8'b00000101;
        mem[39] = 8'b00010011;

        // slti x11, x11, 31       x11 = 1
        mem[40] = 8'b00000001;
        mem[41] = 8'b11110101;
        mem[42] = 8'b10100101;
        mem[43] = 8'b10010011;

        // xori x12, x15, 10       x12 = 3      
        mem[44] = 8'b00000000;
        mem[45] = 8'b10100111;
        mem[46] = 8'b11000110;
        mem[47] = 8'b00010011;

        // ori x13, x15, 10        x13 = 15     
        mem[48] = 8'b00000000;
        mem[49] = 8'b10100111;
        mem[50] = 8'b11100110;
        mem[51] = 8'b10010011;

        // andi x14, x15, 10       x14 = 10         
        mem[52] = 8'b00000000;
        mem[53] = 8'b10100111;
        mem[54] = 8'b11110111;
        mem[55] = 8'b00010011;

        // lui x15, 5              x15 = 20480  
        mem[56] = 8'b00000000;
        mem[57] = 8'b00000000;
        mem[58] = 8'b01010111;
        mem[59] = 8'b10110111;
        
        //ecall        

        mem[60] = 8'b00000000;
        mem[61] = 8'b00000000;
        mem[62] = 8'b00000000;
        mem[63] = 8'b01110011;


        // auipc x16,              x16 = 12348      
        mem[64] = 8'b00000000;
        mem[65] = 8'b00000000;
        mem[66] = 8'b00111000;
        mem[67] = 8'b00010111;

        // jal x17, 8              x17 = 68
        mem[68] = 8'b00000000;
        mem[69] = 8'b10000000;
        mem[70] = 8'b00001000;
        mem[71] = 8'b11101111;

        // addi x18, x18, 1        x18 = 18
        mem[72] = 8'b00000000;
        mem[73] = 8'b00011001;
        mem[74] = 8'b00001001;
        mem[75] = 8'b00010011;

        // addi x19, x19, 1        x19 = 20
        mem[76] = 8'b00000000;
        mem[77] = 8'b00011001;
        mem[78] = 8'b10001001;
        mem[79] = 8'b10010011;

               // addi x20, x20, 1        x20 = 21
        mem[80] = 8'b00000000;
        mem[81] = 8'b00011010;
        mem[82] = 8'b00001010;
        mem[83] = 8'b00010011;

               // addi x22, x22, 1        x22 = 23
        mem[84] = 8'b00000000;
        mem[85] = 8'b00011011;
        mem[86] = 8'b00001011;
        mem[87] = 8'b00010011;

        // lw x23, 96(x0)           
        mem[88] = 8'b00000110;
        mem[89] = 8'b00000000;
        mem[90] = 8'b00101011;
        mem[91] = 8'b10000011;

        //add x22, x22, x22         x22 = 46    
        mem[92] = 8'b00000001;
        mem[93] = 8'b01101011;
        mem[94] = 8'b00001011;
        mem[95] = 8'b00110011;

        //Loading initial data.

        // Mem at 88 (or 22) = 17
        mem[96] = 8'b00000000;
        mem[97] = 8'b00000000;
        mem[98] = 8'b00000000;
        mem[99] = 8'b00010001;

        // Mem at 92 (or 23) = 9
        mem[100] = 8'b00000000;
        mem[101] = 8'b00000000;
        mem[102] = 8'b00000000;
        mem[103] = 8'b00001001;

        // Mem at 96 (or 24) = 25
        mem[104] = 8'b00000000;
        mem[105] = 8'b00000000;
        mem[106] = 8'b00000000;
        mem[107] = 8'b00011001;
        
    end
endmodule