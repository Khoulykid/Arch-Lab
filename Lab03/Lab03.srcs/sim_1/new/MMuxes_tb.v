`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2024 03:53:28 PM
// Design Name: 
// Module Name: MMuxes_tb
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


module MMuxes_tb();
    localparam period = 10;
    reg [7:0] a;
    reg [7:0] b;
    reg s;
    wire [7:0] out;
    mMuxes #(8) DUT(.a(a), .b(b), .s(s), .out(out));
    
    initial begin
    a = 1;
    b = 152;
    s = 0;
    #period
    s = 1;
    #period
    a = 111;
    b = 112;
    s = 0;
    #period
    s = 1;
    #period $finish;
    end
endmodule
