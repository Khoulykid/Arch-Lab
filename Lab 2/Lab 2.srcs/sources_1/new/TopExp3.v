`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2024 05:14:56 PM
// Design Name: 
// Module Name: TopExp3
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


module TopExp3(
        input clk,
        input [7:0]a,
        input [7:0]b, 
        output  [3:0] Anode,
        output  [6:0] LED_out
    );
    wire[7:0] out;
    signed_RCA  rca(.a(a), .b(b),.cin(0), .s(out));
    sevenSegNeg SSN(.clk(clk), .SW(out), .Anode(Anode), .LED_out(LED_out));  
    
endmodule
