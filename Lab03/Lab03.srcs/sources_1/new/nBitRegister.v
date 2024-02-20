`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2024 02:38:56 PM
// Design Name: 
// Module Name: nBitRegister
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


module nBitRegister #(parameter n=8) (
        input [n-1 : 0] data, 
        input clk,
        input rst, 
        input load, 
        output  [n-1 : 0] outData 
    );
    wire [n-1:0]interData;
  //  wire [n-1 : 0] outData; 
    genvar i; 
    generate 
        for (i = 0; i < n; i = i + 1 ) begin
            Mux2x1  mux  ( .a(data[i]), .b(outData[i]), .s(load), .out(interData[i])); 
            DFlipFlop dff (.clk(clk), .rst(rst), .D(interData[i]),  .Q(outData[i]));   
        end
         
    endgenerate
 //   assign q = outData;
    

endmodule
