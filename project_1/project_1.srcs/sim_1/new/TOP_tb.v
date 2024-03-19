`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2024 03:31:02 PM
// Design Name: 
// Module Name: TOP_tb
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


module TOP_tb();
    reg [1:0] ledSel;
    reg [3:0] ssdSel;
    reg clk;
    reg rst;
    reg SSDclk;
    wire [15:0] LED;
    TOP DUT(.ledSel(ledSel), .ssdSel(ssdSel), .clk(clk), .rst(rst), .SSDclk(SSDclk), .LED(LED));
    
    initial begin
        SSDclk = 1;
        forever #10 SSDclk = ~SSDclk;
    end
    
    initial begin
        rst = 1;
        #40;
        rst = 0;
        #240;
        $finish;
    end
    

endmodule
