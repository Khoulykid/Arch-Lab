`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 04:55:21 PM
// Design Name: 
// Module Name: ALUcu_tb
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


module ALUcu_tb();
    reg [1:0] ALUop;
    reg [2:0] inst_14_2;
    reg  inst_30;
    wire [3:0] ALUsel; 
    
    ALUcu DUT (.ALUop(ALUop), .inst_14_2(inst_14_2), .inst_30(inst_30), .ALUsel(ALUsel)) ;
    initial begin 
    ALUop = 2'b10; 
    inst_14_2 = 3'b000; 
    inst_30 = 1'b1; 
    #10
    ALUop = 2'b01; 
    inst_14_2 = 3'b000; 
    inst_30 = 1'b1;
    #10
    ALUop = 2'b00; 
    inst_14_2 = 3'b000; 
    inst_30 = 1'b1;
    #10
    ALUop = 2'b10; 
    inst_14_2 = 3'b000; 
    inst_30 = 1'b0;
    #10
    ALUop = 2'b10; 
    inst_14_2 = 3'b111; 
    inst_30 = 1'b0;
    
    
    end 
endmodule
