`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2023 04:45:10 PM
// Design Name: 
// Module Name: push_button_detector
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



module synchronizer(clk,SIG,SIG1);
input clk;
input SIG;
output reg SIG1;
reg META;
//initial begin META = 0; SIG1 = 0; end
always @(posedge clk)begin
    META<=SIG;
    SIG1<=META;
end     
endmodule