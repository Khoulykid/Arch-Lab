`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2024 03:14:50 PM
// Design Name: 
// Module Name: DataMem_TB
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


module DataMem_TB();
reg clk, MemRead, MemWrite;
reg [5:0] addr;
reg [31:0] data_in;
wire [31:0] data_out;
DataMem datamem ( clk,  MemRead,  MemWrite, addr,  data_in,   data_out);
localparam period=20;
initial begin 
clk = 0;
forever #(period/2) clk = ~clk;
end

initial begin
data_in=4'b1001;
MemRead=0;
MemWrite=1;
addr = 6'b000100;
#period;
addr = 6'b000100;
MemRead=1;
MemWrite=0;
#period;
data_in=4'b1000;
addr = 6'b000100;
MemRead=1;
MemWrite=0;
end
endmodule
