`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2024 03:45:45 PM
// Design Name: 
// Module Name: mMuxes
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


module mMuxes #(parameter n = 8)(
     input  [n-1:0] a,
     input  [n-1:0] b,
     input s,
     output [n-1:0] out
    );
    genvar i; 
    generate 
        for (i = 0; i < n; i = i + 1 ) begin
            Mux2x1  mux  ( .a(a[i]), .b(b[i]), .s(s), .out(out[i])); 
        end
    endgenerate
endmodule
