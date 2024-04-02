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
    //reg [31:0] mem [0:63];
    reg [7:0] mem[(4*1024-1):0];
    assign data_out = (MemRead)? mem[addr]: data_out; 
    initial begin
        {mem[3], mem[2], mem[1], mem[0]} =32'd17;
        mem[1]=32'd9;
        mem[2]=32'd25;
    end
    always @ (posedge clk) begin
        if (MemWrite) begin 
            {mem[addr+3], mem[addr+2], mem[addr+1], mem[addr]}  = data_in;
        end
    end
endmodule
