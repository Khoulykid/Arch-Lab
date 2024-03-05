
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 02/06/2024 03:14:14 PM
// Design Name:
// Module Name: inverter_tb
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


module inverter_tb();
    parameter period = 10;
    reg A;
    wire B;
    inverter DUT(
                    .A(A),
                    .B(B)
                    );
       
    initial begin
        A =  1'b1;
        #period
        A = 1'b0;
        #(2*period)
        A = 1'b1;
        #period
        $finish;
    end
       
endmodule