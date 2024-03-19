`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 02:46:45 PM
// Design Name: 
// Module Name: ALU
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


module ALU #(parameter n = 32)( 
        input [n-1:0] a,
        input [n-1:0] b, 
        input [3:0] ALUsel,
        output [n-1:0] out,
        output zf
    );
    wire [n-1:0] sum; 
    wire [n-1:0] addOrSub;
    wire [n-1:0] orRes; 
    wire [n-1:0] andRes;
    assign addOrSub = ALUsel[2] ? ~b : b;   
    n_bit_RCA #(n) RCA  ( .a(a), .b(addOrSub), .cin(addOrSub[n-1]), .s(sum));
    mux16x1 bigMux(.in0(andRes),.in1(orRes),.in2(sum),.in3(0),.in4(0),.in5(0),.in6(sum),.in7(0),.in8(0),.in9(0),.in10(0),.in11(0),.in12(0),.in13(0),.in14(0),.in15(0), .sel(ALUsel), .out(out));
    assign zf = (!out)? 1'b1 : 1'b0; // logical not operator 
    assign orRes = a | b; 
    assign andRes = a & b; 
    
    
endmodule
