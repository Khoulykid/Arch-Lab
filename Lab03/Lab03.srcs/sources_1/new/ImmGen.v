`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2024 04:07:28 PM
// Design Name: 
// Module Name: ImmGen
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


module ImmGen(output reg [31:0] gen_out, input [31:0] inst);
    always @ (*) begin 
        if (inst[6:5] == 2'b00) begin 
            gen_out = {{20{inst[31]}} , inst[31:20] } ;
        end
        else if (inst[6:5] == 2'b01) begin 
            gen_out = {{20{inst[31]}} , inst[31:25], inst[11:7]} ;
        end 
        else if (inst[6] == 1'b1) begin 
            gen_out = {{20{inst[31]}} , inst [7], inst[31:25], inst[11:8]} ;
        end 
    end 
endmodule
