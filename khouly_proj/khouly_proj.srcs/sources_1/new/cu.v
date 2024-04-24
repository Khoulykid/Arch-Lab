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
    input inst_20,
    input [4:0] inst62,
    input [2:0] func3,
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
    output reg auipc, 
    output reg unsignedFlag,
    output reg [1:0] memOffset,
    output reg fin
    );
    initial begin fin = 0; end
    
    always@* begin
        case(inst62)
            5'b01100: begin branch = 0; memread = 0; memtoreg = 0; ALUop = 2; memwrite = 0; ALUsrc = 0; regwrite = 1; auipc = 0; lui = 0; jal = 0; jalr = 0; memOffset = 2'b01; unsignedFlag = 0; end 
            5'b00100: begin branch = 0; memread = 0; memtoreg = 0; ALUop = 2; memwrite = 0; ALUsrc = 1; regwrite = 1; auipc = 0; lui = 0; jal = 0; jalr = 0; memOffset = 2'b01; unsignedFlag = 0; end
            5'b00000: begin
                        if (func3 == 3'b010) begin // lw
                              branch = 0; memread = 1; memtoreg = 1; ALUop = 0; memwrite = 0; ALUsrc = 1; regwrite = 1; auipc = 0; lui = 0; jal = 0; jalr = 0; memOffset = 2'b11; unsignedFlag = 0;
                              end
                        else if (func3 ==3'b000) begin // lb 
                              branch = 0; memread = 1; memtoreg = 1; ALUop = 0; memwrite = 0; ALUsrc = 1; regwrite = 1; auipc = 0; lui = 0; jal = 0; jalr = 0; memOffset = 2'b01; unsignedFlag = 0;
                              end
                        else if (func3 == 3'b001) begin // lh 
                              branch = 0; memread = 1; memtoreg = 1; ALUop = 0; memwrite = 0; ALUsrc = 1; regwrite = 1; auipc = 0; lui = 0; jal = 0; jalr = 0; memOffset = 2'b10; unsignedFlag = 0; 
                              end
                        else if (func3 == 3'b100) begin // lbu 
                              branch = 0; memread = 1; memtoreg = 1; ALUop = 0; memwrite = 0; ALUsrc = 1; regwrite = 1; auipc = 0; lui = 0; jal = 0; jalr = 0; memOffset = 2'b01; unsignedFlag = 1;
                              end
                        else if (func3 == 3'b101) begin // lhu 
                              branch = 0; memread = 1; memtoreg = 1; ALUop = 0; memwrite = 0; ALUsrc = 1; regwrite = 1; auipc = 0; lui = 0; jal = 0; jalr = 0; memOffset = 2'b10; unsignedFlag = 1;
                              end
                    end 
                     
            5'b01000: begin // s type
                       if (func3 == 3'b010) begin // sw 
                            branch = 0; memread = 0; ALUop = 0; memwrite = 1; ALUsrc = 1; regwrite = 0; auipc = 0; lui = 0; jal = 0; jalr = 0; memOffset = 2'b11; unsignedFlag = 0;
                       end
                       else if(func3 == 3'b001) begin // sh  
                            branch = 0; memread = 0; ALUop = 0; memwrite = 1; ALUsrc = 1; regwrite = 0; auipc = 0; lui = 0; jal = 0; jalr = 0; memOffset = 2'b10; unsignedFlag = 0;
                       end
                       else if (func3 == 3'b000) begin  // sb
                            branch = 0; memread = 0; ALUop = 0; memwrite = 1; ALUsrc = 1; regwrite = 0; auipc = 0; lui = 0; jal = 0; jalr = 0; memOffset = 2'b01; unsignedFlag = 0;
                       end
                   end
            5'b11000: begin branch = 1; memread = 0; ALUop = 1; memwrite = 0; ALUsrc = 0; regwrite = 0; auipc = 0; lui = 0; jal = 0; jalr = 0; memOffset = 2'b01; unsignedFlag = 0; end // branch
            5'b01101: begin branch = 0; lui = 1; auipc = 0; jal = 0; jalr = 0; regwrite = 1; memwrite = 0; memOffset = 2'b01; unsignedFlag = 0; end // lui
            5'b00101: begin branch = 0; auipc = 1; regwrite = 1; memwrite = 0; jal = 0; jalr = 0; memOffset = 2'b01; unsignedFlag = 0;  end //  auipc
            5'b11011: begin branch = 0; auipc = 0; lui = 0; jal = 1; jalr = 0;  memwrite = 0;  regwrite = 1; memOffset = 2'b01; unsignedFlag = 0; end // jal
            5'b11001: begin branch = 0; auipc = 0; lui = 0; jal = 1; jalr = 1;  memwrite = 0;  regwrite = 1; memOffset = 2'b01; unsignedFlag = 0; end // jalr
            5'b11100: begin branch = 0; auipc = 0; lui = 0; jal = 0; jalr = 0;  memwrite = 0;  regwrite = 0; memOffset = 2'b00;  unsignedFlag = 0;
            fin = !inst_20; end
            5'b00011:  begin branch = 0; auipc = 0; lui = 0; jal = 0; jalr = 0;  memwrite = 0;  regwrite = 0; memOffset = 2'b00; unsignedFlag = 0; end
            default : begin  branch = 0; memread = 0; ALUop = 0; memwrite = 0; ALUsrc = 0; regwrite = 0; auipc = 0; lui = 0; jal = 0; jalr = 0; memOffset = 2'b00; unsignedFlag = 0; end 
        endcase
    end
endmodule