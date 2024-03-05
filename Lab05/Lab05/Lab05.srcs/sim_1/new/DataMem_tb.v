`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2024 03:05:27 PM
// Design Name: 
// Module Name: DataMem_tb
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


module DataMem_tb();

    reg clk;
    reg MemRead;
    reg MemWrite;
    reg [5:0] addr;
    reg [31:0] data_in;
    wire [31:0] data_out;
    
    DataMem DUT(.clk(clk), .MemRead(MemRead), .MemWrite(MemWrite), .addr(addr), .data_in(data_in), .data_out(data_out));
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        MemRead = 0;
        MemWrite = 1;
        addr = 0;
        data_in = 0;
        #10;
        MemRead = 1;
        MemWrite = 0;
        addr = 0;
        //data_in = 0;
        #10;
        MemRead = 0;
        MemWrite = 1;
        addr = 1;
        data_in = 1;
        #10;
        MemRead = 1;
        MemWrite = 0;
        addr = 1;
        //data_in = 0;
        #10;
        MemRead = 0;
        MemWrite = 1;
        addr = 2;
        data_in = 2;
        #10;
        MemRead = 1;
        MemWrite = 0;
        addr = 2;
        //data_in = 0;
        #10;
        MemRead = 0;
        MemWrite = 1;
        addr = 4;
        data_in = 4;
        #10;
        MemRead = 1;
        MemWrite = 0;
        addr = 4;
        //data_in = 0;
        #10;
        $finish;
    end
endmodule
