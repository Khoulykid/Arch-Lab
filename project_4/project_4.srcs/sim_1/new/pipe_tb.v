`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2024 04:05:29 PM
// Design Name: 
// Module Name: pipe_tb
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


module pipe_tb();

    reg [1:0] ledSel;
    reg [3:0] ssdSel;
    reg new_clk;
    reg new_rst;
    reg SSDclk;
    RISCV_pipeline DUT(.ledSel(ledSel), .ssdSel(ssdSel), .new_clk(new_clk), 
    .new_rst(new_rst), .SSDclk(SSDclk)); 
    initial begin
    new_clk = 1;
    forever #5 new_clk = ~new_clk;
    end
    
    initial begin
    new_rst = 1;
    #10
    new_rst = 0;
    #490
    $finish;
    end
    
endmodule
