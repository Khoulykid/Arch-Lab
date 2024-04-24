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


        // auipc x1 12 
        mem[4] = 8'b00000000;
        mem[5] = 8'b00000000;
        mem[6] = 8'b11000000;
        mem[7] = 8'b10010111;

        // bne x1 x0 8
        mem[8] = 8'b00000000;
        mem[9] = 8'b00000000;
        mem[10] = 8'b10010100;
        mem[11] = 8'b01100011; 



        //sub x1 x1 x1 
        mem[12] = 8'b01000000;
        mem[13] = 8'b00010000;
        mem[14] = 8'b10000000;
        mem[15] = 8'b010110011;

        // blt x0 x1 -4
        mem[16] = 8'b11111110;
        mem[17] = 8'b00010000;
        mem[18] = 8'b01001110;
        mem[19] = 8'b11100011;

        // ori x2 x0 -50
        mem[20] = 8'b11111100;
        mem[21] = 8'b11100000;
        mem[22] = 8'b01100001;
        mem[23] = 8'b00010011;

        // slt x3 x2 x0
        mem[24] = 8'b00000000;
        mem[25] = 8'b00000001;
        mem[26] = 8'b00100001;
        mem[27] = 8'b10110011;

        // sltu x4 x2 x0
        mem[28] = 8'b00000000;
        mem[29] = 8'b00000001;
        mem[30] = 8'b00110010;
        mem[31] = 8'b00110011;

        // sub x5 x0 x2 
        mem[32] = 8'b01000000;
        mem[33] = 8'b00100000;
        mem[34] = 8'b00000010;
        mem[35] = 8'b10110011;

//srai x6 x2 2 
        mem[36] = 8'b01000000;
        mem[37] = 8'b00100001;
        mem[38] = 8'b01010011;
        mem[39] = 8'b00010011;

        // srli x7 x2 2 
        mem[40] = 8'b00000000;
        mem[41] = 8'b00100001;
        mem[42] = 8'b01010011;
        mem[43] = 8'b10010011;

        // slli x8, x2, 1
        mem[44] = 8'b00000000;
        mem[45] = 8'b00010001;
        mem[46] = 8'b00010100;
        mem[47] = 8'b00010011;
        
    end
endmodule