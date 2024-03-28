`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 02:34:51 PM
// Design Name: 
// Module Name: mux16x1
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


module  mux16x1 #(parameter n =  32)(
        input [n-1:0] in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15,
        input  [3:0] sel,
        output reg [n-1:0] out
    );
        
    always @ (*)
    begin
        case(sel)
            4'b0000 : out = in0;
            4'b0001 : out = in1;
            4'b0010 : out = in2;
            4'b0011 : out = in3;
            4'b0100 : out = in4;
            4'b0101 : out = in5;
            4'b0110 : out = in6;
            4'b0111 : out = in7;
            4'b1000 : out = in8;
            4'b1001 : out = in9;
            4'b1010 : out = in10;
            4'b1011 : out = in11;
            4'b1100 : out = in12;
            4'b1101 : out = in13;
            4'b1110 : out = in14;
            4'b1111 : out = in15;
        endcase
    end
        
endmodule
