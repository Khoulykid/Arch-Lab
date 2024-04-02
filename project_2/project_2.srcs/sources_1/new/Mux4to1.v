`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2024 02:06:17 PM
// Design Name: 
// Module Name: Mux4to1
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


module Mux4to1#(x = 32)(input[x-1:0] in0, in1, in2, in3, input [1:0] sel, output reg [x-1:0] out);

always@* begin
    case(sel)
        2'b00:  out = in0;
        2'b01:  out = in1;
        2'b10:  out = in2;
        2'b11:  out = in3;
    endcase
end

endmodule