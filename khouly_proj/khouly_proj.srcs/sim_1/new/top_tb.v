`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2024 06:34:01 AM
// Design Name: 
// Module Name: top_tb
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


module top_tb();
    reg [1:0] ledSel; //input to select what the output on the LED will represent
    reg [3:0] ssdSel; //to choose what will be represented on the SSD
    reg new_clk;       //clock input
    reg new_rst;      //reset input
    reg SSDclk;       //The clock for SSD

    initial begin
        new_clk = 1;
        forever #5 new_clk = ~new_clk;  
    end 
    TOP DUT ( ledSel, ssdSel, new_clk, new_rst, SSDclk);
    initial begin 
        new_rst = 1;    
        #10
        new_rst = 0; 
        #310 
        $finish;

    end 






endmodule
