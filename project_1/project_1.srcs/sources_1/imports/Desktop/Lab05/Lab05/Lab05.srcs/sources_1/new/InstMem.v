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


module InstMem(input [5:0] addr, output [31:0] data_out); 
    reg [31:0] mem [0:63];
    assign data_out = mem[addr]; 
    initial begin 
        mem[0] = 32'b00000000000000000000000010110011;
        mem[1] = 32'b00000000000000000010000100000011;
        mem[2] = 32'b00000000010000000010000110000011;
        mem[3] = 32'b00000000100000000010001000000011;
        mem[4] = 32'b00000000000000000010001010000011;
        mem[5] = 32'b00000000010100001000000010110011;
        mem[6] = 32'b00000000001000010000000100110011;
        mem[7] = 32'b00000000001100001000010001100011;
        mem[8] = 32'b11111110000000000000101011100011;
        mem[9] = 32'b00000000001000100010000000100011;
        
    end
endmodule