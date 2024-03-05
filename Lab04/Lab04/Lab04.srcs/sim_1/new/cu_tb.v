`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 04:46:24 PM
// Design Name: 
// Module Name: cu_tb
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


module cu_tb();
    reg [4:0] inst62;
    wire  branch;
    wire  memread;
    wire  memtoreg;
    wire  [1:0] ALUop;
    wire  memwrite;
    wire  ALUsrc;
    wire  regwrite; 
    cu DUT (.inst62(inst62), .branch(branch), .memread(memread), .memtoreg(memtoreg), .ALUop(ALUop), .memwrite(memwrite), .ALUsrc(ALUsrc), .regwrite(regwrite)); 
    
    initial begin 
    inst62 = 5'b01100;
    #100 
    inst62 = 5'b00000;
    #100
    inst62 = 5'b01000;
    #100 
    inst62 = 5'b11000;
    end
endmodule
