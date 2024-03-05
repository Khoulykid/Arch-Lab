`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2024 02:55:47 PM
// Design Name: 
// Module Name: InstMem_tb
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


module InstMem_tb();
    reg [5:0] addr;
    wire [31:0] data_out;
    
    InstMem DUT(.addr(addr), .data_out(data_out));
    
    integer i;
    initial begin
        for (i = 0; i < 5; i = i + 1) begin
            addr = i;
            #10;
        end
    end    


endmodule
