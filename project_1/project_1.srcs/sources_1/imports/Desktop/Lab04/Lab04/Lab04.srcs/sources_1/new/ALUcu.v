`timescale 1ns / 1ps
`include "defines.v"
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
    input [2:0] inst_14_12,
    input inst_30,
    output reg [3:0] ALUsel
    );
    
    
    always @* begin
        case(ALUop)
            2'b00: ALUsel = 4'b0010;
            2'b01: ALUsel = 4'b0110;
            default: begin
                case(inst_14_12)
                    F3_ADD: ALUsel = inst_30 ? ALU_SUB : ALU_ADD;
                    F3_SLL: ALUsel = ALU_SLL;
                    F3_SLT: ALUsel = ALU_SLT;
                    F3_SLTU:ALUsel = ALU_SLTU;
                    F3_XOR: ALUsel = ALU_XOR;
                    F3_SRL: ALUsel = inst_30 ? ALU_SRA : ALU_SRL;
                    F3_OR : ALUsel = ALU_OR;
                    F3_AND: ALUsel = ALU_AND;
                endcase
            end
        endcase
    end
    
//    always @* begin
//        if (ALUop == 2'b00)
//            ALUsel = 4'b0010;
//        else if (ALUop == 2'b01)
//            ALUsel = 4'b0110;
//        else if (ALUop == 2'b10) begin
//            if (inst_14_2 == 3'b000) begin 
//                if (inst_30) begin ALUsel = 4'b0110; end else begin ALUsel = 4'b0010; end
//                end
//                else if (inst_14_2 == 3'b111) begin ALUsel = 4'b0000; end
//                else if (inst_14_2 == 3'b110) begin ALUsel = 4'b0001; end
//            end
            
            
//    end
endmodule
