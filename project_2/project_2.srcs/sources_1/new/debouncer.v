`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2023 04:43:36 PM
// Design Name: 
// Module Name: debouncer
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


module debouncer(clk,rst,x,z);
input x;
input clk;
input rst;
output z;

reg q1,q2,q3;
initial begin q1 = 0; q2 = 0; q3 = 0; end
always @(posedge clk, posedge rst)begin
    if(rst==1'b1)begin
        q1<=0;
        q2<=0;
        q3<=0;
    end
    else begin 
        q1<=x;
        q2<=q1;
        q3<=q2;
    end
end
assign z= rst? 0 : q1&q2&q3;
endmodule