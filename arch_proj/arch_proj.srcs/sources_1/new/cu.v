`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 04:26:49 PM
// Design Name: 
// Module Name: cu
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


module cu(
    input [4:0] inst62,
    output reg branch,
    output reg memread,
    output reg memtoreg,
    output reg [1:0] ALUop,
    output reg memwrite,
    output reg ALUsrc,
    output reg regwrite,
    output reg jal,
    output reg jalr,
    output reg lui, 
    output reg auipc
    );
    
    always@* begin
        case(inst62)
            5'b01100: begin branch = 0; memread = 0; memtoreg = 0; ALUop = 2; memwrite = 0; ALUsrc = 0; regwrite = 1; auipc = 0; lui = 0; jal = 0; jalr = 0; end
            5'b00100: begin branch = 0; memread = 0; memtoreg = 0; ALUop = 2; memwrite = 0; ALUsrc = 1; regwrite = 1; auipc = 0; lui = 0; jal = 0; jalr = 0; end
            5'b00000: begin branch = 0; memread = 1; memtoreg = 1; ALUop = 0; memwrite = 0; ALUsrc = 1; regwrite = 1; auipc = 0; lui = 0; jal = 0; jalr = 0; end
            5'b01000: begin branch = 0; memread = 0; ALUop = 0; memwrite = 1; ALUsrc = 1; regwrite = 0; auipc = 0; lui = 0; jal = 0; jalr = 0; end
            5'b11000: begin branch = 1; memread = 0; ALUop = 1; memwrite = 0; ALUsrc = 0; regwrite = 0; auipc = 0; lui = 0; jal = 0; jalr = 0; end // branch
            5'b01101: begin branch = 0; lui = 1; auipc = 0; jal = 0; jalr = 0; regwrite = 1; memwrite = 0; end // lui
            5'b00101: begin branch = 0; auipc = 1; regwrite = 1; memwrite = 0; jal = 0; jalr = 0;   end // auipc
            5'b11011: begin branch = 0; auipc = 0; lui = 0; jal = 1; jalr = 0;  memwrite = 0;  regwrite = 1; end // jal
            5'b11001: begin branch = 0; auipc = 0; lui = 0; jal = 0; jalr = 1;  memwrite = 0;  regwrite = 1;; end // jalr
        endcase
    end
endmodule
