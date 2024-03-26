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
    wire [12:0] SSD;
    TOP DUT(.ledSel(ledSel), .ssdSel(ssdSel), .clk(clk), .rst(rst), .SSDclk(SSDclk), .LED(LED), .SSD(SSD));
    
    
    
    initial begin
        rst = 1;
        SSDclk=1;
        #1;
        SSDclk = 0;
        #1
        rst = 0;
        SSDclk = 1;
        #1
        SSDclk = 0;
        #1
        SSDclk = 1;
        #1
        SSDclk = 0;
        #1
        SSDclk = 1;
        #1
        SSDclk = 0;
        #1
        SSDclk = 1;
        #1
        SSDclk = 0;
        #1
        SSDclk = 1;
        #1
        SSDclk = 0;
        #1
        SSDclk = 1;
        #1
        SSDclk = 0;
        #1
        SSDclk = 1;
        #1
        SSDclk = 0;
        #1
        SSDclk = 1;
        #1
        SSDclk = 0;
        #1
        SSDclk = 1;
        #1
        SSDclk = 0;
        #1
        SSDclk = 1;
        #1
        SSDclk = 0;
        #1
        SSDclk = 1;
        #1
        SSDclk = 0;
        #1
        SSDclk = 1;
        #1
        ledSel = 2'b00;
        ssdSel = 0;
        #10
        ledSel = 2'b01;
        ssdSel = 1;
        #10
        ledSel = 2'b10;
        ssdSel = 2;
        #10
        ledSel = 2'b11;
        ssdSel = 3;
        #10
        ssdSel = 4;
        #10
        ssdSel = 5;
        #10
        ssdSel = 6;
        #10
        ssdSel = 7;
        #10
        ssdSel = 8;
        #10
        ssdSel = 9;
        #10
        ssdSel = 10;
        #10
        ssdSel = 11;
        #10
                
        $finish;
    end
    

endmodule
