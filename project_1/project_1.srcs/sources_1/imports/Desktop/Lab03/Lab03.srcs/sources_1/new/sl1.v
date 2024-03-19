`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2024 04:01:20 PM
// Design Name: 
// Module Name: sl1
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


module sl1 #(parameter n = 8) (
        input [n-1 : 0] a, 
        output[n-1 : 0] b
    );
    assign b = {a[6:0],1'b0};
endmodule
