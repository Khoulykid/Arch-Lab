`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2024 03:46:43 PM
// Design Name: 
// Module Name: hazardCU
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


module hazardCU(
    input [4:0] IFIDRegisterRs1, IFIDRegisterRs2,IDEXRegisterRd, 
    input IDEXMemRead,
    output reg stall
    );
    always @ * begin 
        if (((IFIDRegisterRs1 == IDEXRegisterRd) || (IFIDRegisterRs2==IDEXRegisterRd)) && (IDEXMemRead) && (IDEXRegisterRd != 0))
           stall = 1;
         else  
            stall = 0; 
          end
endmodule
