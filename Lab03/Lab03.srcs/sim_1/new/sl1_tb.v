`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2024 04:03:04 PM
// Design Name: 
// Module Name: sl1_tb
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


module sl1_tb();
    reg [7:0] a;
    wire [7:0] b; 
    sl1 DUT ( .a(a), .b(b));
    localparam period = 10;
    initial begin 
    a = 4; 
    #period
    a = 6; 
    #period; 
    $finish;
    end


endmodule
