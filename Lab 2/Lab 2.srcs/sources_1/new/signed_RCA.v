`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2024 02:50:42 PM
// Design Name: 
// Module Name: n_bit_RCA
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


module signed_RCA #(parameter n = 8) (
    input [n-1:0] a,
    input [n-1:0] b,
    input cin,
    output [n-1:0]s
);


    genvar i;
    wire c[n:0];
    generate
        assign c[0] = cin;
        for (i = 0; i < n; i = i + 1) begin
            Full_Adder fa(.a(a[i]), .b(b[i]), .cin(c[i]), .s(s[i]), .cout(c[i+1]));
        end
    endgenerate
endmodule
