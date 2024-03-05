`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2024 04:25:27 PM
// Design Name: 
// Module Name: topExp2
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


module topExp2(
        input clk,
        input [7:0]a,
        output  [3:0] Anode,
        output  [6:0] LED_out
        );
    sevenSegNeg SSN(.clk(clk), .SW(a), .Anode(Anode), .LED_out(LED_out));  
    
    
    
endmodule

