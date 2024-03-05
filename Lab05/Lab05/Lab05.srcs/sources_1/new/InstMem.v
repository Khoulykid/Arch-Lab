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
        mem[0] = 32'hFFFFFFF0;
        mem[1] = 32'hFFFFAFF1;
        mem[2] = 32'hFBFFFFF2;
        mem[3] = 32'hFFFCFFF3;
        mem[4] = 32'hFFFFFDF4;
    end
endmodule