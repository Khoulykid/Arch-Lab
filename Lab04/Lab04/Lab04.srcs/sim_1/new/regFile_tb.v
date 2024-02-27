`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 04:10:55 PM
// Design Name: 
// Module Name: regFile_tb
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


module regFile_tb();
    reg [4:0] readAddr1;
    reg [4:0] readAddr2;
    reg [4:0] writeAddr;
    reg [31:0] writeData;
    reg wr;
    reg clk; 
    reg rst;
    wire [31:0] rd1; 
    wire [31:0] rd2;
    
    regFile #(32) DUT(.readAddr1(readAddr1), .readAddr2(readAddr2), .writeAddr(writeAddr), .writeData(writeData), .wr(wr), .clk(clk), .rst(rst), .rd1(rd1), .rd2(rd2));
    
    localparam period = 10;
    
    initial begin
        clk = 0;
        forever #(period/2) clk = ~clk;
    end
    
    initial begin
    rst = 1;
    wr = 1;
    writeAddr = 1;
    writeData = 100;
    readAddr1 = 2;
    readAddr2 = 3;
    #period
    wr = 0;
    rst = 0;
    #period
    wr = 1;
    #period
    wr = 0;
    writeData =200; 
    readAddr1 = 1; 
    #period 
    wr = 1; 
    end 
    
    
    
    
endmodule
