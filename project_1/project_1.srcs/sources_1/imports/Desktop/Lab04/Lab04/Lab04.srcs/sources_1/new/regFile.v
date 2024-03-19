`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 03:52:00 PM
// Design Name: 
// Module Name: regFile
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


module regFile  #(parameter n = 32)(
    input [4:0] readAddr1,
    input [4:0] readAddr2,
    input [4:0] writeAddr,
    input [n-1:0] writeData, 
    input wr, 
    input clk, 
    input rst,
    output [n-1:0] rd1, 
    output [n-1:0] rd2
    );
    
    reg [n-1 : 0] regFile [31:0]; 
    assign rd1 = regFile[readAddr1]; 
    assign rd2 = regFile[readAddr2]; 
    integer i;
    always @(posedge clk or posedge rst) begin 
         if (rst) begin      
             for (i =0; i < 32; i = i+1) begin 
                regFile[i] = 32'b0;
             end 
         end else  
         if (wr && (writeAddr)) begin      
            regFile[writeAddr] = writeData;
         end 
    end 
    
    endmodule
