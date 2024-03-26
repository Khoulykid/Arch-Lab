`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2024 02:39:24 PM
// Design Name: 
// Module Name: Mux2x1
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


module  Mux2x1 (
     input  a,
     input  b,
     input s,
     output  out
    );
    
    assign out = (s == 1'b1)? a:b; 
    
endmodule
