`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 04:36:14 PM
// Design Name: 
// Module Name: ALUcu
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


module ALUcu(
    input [1:0] ALUop,
    input [2:0] inst_14_2,
    input inst_30,
    output reg [3:0] ALUsel
    );
    
    always @* begin
        if (ALUop == 2'b00)
            ALUsel = 4'b0010;
        else if (ALUop == 2'b01)
            ALUsel = 4'b0110;
        else if (ALUop == 2'b10) begin
            if (inst_14_2 == 3'b000) begin if (inst_30) ALUsel = 4'b0110; else ALUsel = 4'b0010; end
            else if (inst_14_2 == 3'b111) ALUsel = 4'b0000;
            else if (inst_14_2 == 3'b110) ALUsel = 4'b1110;
        end
    end
endmodule
