`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2024 04:35:56 PM
// Design Name: 
// Module Name: RCA_tb2
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


module RCA_tb2();
    reg [31:0] a;
    reg [31:0] b;
    reg cin;
    wire [31:0] out;
    n_bit_RCA #(32) DUT(.a(a), .b(b), .cin(cin), .s(out));
    
    initial begin
    a = 10;
    b = -10;
    cin = 0;
    #100
    $finish;
    end
endmodule
