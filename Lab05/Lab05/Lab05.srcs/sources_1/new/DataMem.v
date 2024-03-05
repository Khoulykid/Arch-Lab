`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2024 02:44:15 PM
// Design Name: 
// Module Name: DataMem
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

module DataMem(input clk, input MemRead, input MemWrite,
    input [5:0] addr, input [31:0] data_in, output [31:0] data_out);
    reg [31:0] mem [0:63];
    assign data_out = (MemRead)? mem[addr]: data_out; 
    always @ (posedge clk) begin
        if (MemWrite) begin 
            mem[addr] = data_in;
        end
    end
endmodule
