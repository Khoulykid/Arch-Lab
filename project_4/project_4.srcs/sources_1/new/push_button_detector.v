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


module push_button_detector(clk,rst,x,z);
input clk;
input rst;
input x;
output z;
wire out;
wire SIG1 ;
reg [19:0] refresh_counter = 0; // 20-bit counter
wire [1:0] LED_activating_counter;
always @(posedge clk)
begin
refresh_counter <= refresh_counter + 1;
end
assign LED_activating_counter = refresh_counter[19:18];
debouncer debounce(.clk(LED_activating_counter), .rst(rst), .x(x), .z(out));
synchronizer synch(.clk(LED_activating_counter), .SIG(out), .SIG1(SIG1));
rising_edge_detector det(.clk(LED_activating_counter),.rst(rst), .x(SIG1), .z(z));

endmodule