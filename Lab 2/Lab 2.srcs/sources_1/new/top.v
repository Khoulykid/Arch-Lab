`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2024 03:12:04 PM
// Design Name: 
// Module Name: top
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


module top(
        input clk,
        input [7:0]a,
        input [7:0]b, 
        output  [3:0] Anode,
        output  [6:0] LED_out
        );
    wire[8:0] out;
    n_bit_RCA rca(.a(a), .b(b),.cin(0), .s(out));
    F_Dig_7_dig sevenSeg(.clk(clk), .SW({4'b0000,out}), .Anode(Anode), .LED_out(LED_out));  
    
    
    
endmodule
