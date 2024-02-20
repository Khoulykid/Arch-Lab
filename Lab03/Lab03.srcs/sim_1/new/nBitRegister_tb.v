`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2024 03:04:16 PM
// Design Name: 
// Module Name: nBitRegister_tb
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


module nBitRegister_tb();
    localparam period = 10;
    reg clk, rst, load;
    reg [7:0] data;
    wire [7:0] q;
    
    nBitRegister #(8) DUT(.data(data), .clk(clk), .rst(rst), .outData(q), .load(load));
    
    initial begin
        clk = 1;
        forever #(period/2) clk = ~clk;
    end
    
    initial begin
        rst = 1'b1;
        load = 1;
        data = 10;
        #(period) rst = 1'b0;
        #(20*period);
        if(q==0) $display("Correct reset");
        else    $display("Wrong reset");
        load = 1'b1;
        data = 20;
        #period;
        if (q==data) $display("Correct Loading");
        else    $display("Wrong Loading");
        #period;
        load = 0;
        data=30;
        if (q==20) $display("Correct Loading");
        else    $display("Wrong Loading");
        #period $finish;
        end

endmodule
