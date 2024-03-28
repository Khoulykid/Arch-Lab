`timescale 1ns / 1ps
`include "defines.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2024 03:14:06 AM
// Design Name: 
// Module Name: branchCU
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

module branch_control(input branch, input [2:0] funct3, input zf, cf, vf, sf, output reg branch_out);
always@(*)begin
  if (branch ==1'b0) branch_out = 0; 
  else if(funct3 == `BR_BEQ) branch_out = zf;
  else if(funct3 == `BR_BNE) branch_out = (!zf);
  else if(funct3 == `BR_BLT) branch_out = (sf != vf);
  else if(funct3 == `BR_BGE) branch_out = (sf == vf);
  else if(funct3 == `BR_BLTU) branch_out = (!cf);
  else if(funct3 == `BR_BGEU) branch_out = (cf);
  else branch_out = 0; 
end

endmodule