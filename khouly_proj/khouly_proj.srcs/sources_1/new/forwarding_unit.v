`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2024 01:21:10 PM
// Design Name: 
// Module Name: forwarding_unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 001 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module forwarding_unit(
    input [4:0] IDEXRegisterRs1,[4:0] IDEXRegisterRs2, 
    input [4:0] EXMEMRegisterRd, [4:0] MEMWBRegisterRd,
    input EXMEMRegWrite, MEMWBRegWrite,
    output reg [1:0] forwardA, forwardB
    );
    always @* begin 
        if ( EXMEMRegWrite & (EXMEMRegisterRd != 0) & (EXMEMRegisterRd == IDEXRegisterRs1) )  begin
            forwardA = 2'b10; end 
            
        else if ( EXMEMRegWrite & (EXMEMRegisterRd != 0) & (EXMEMRegisterRd == IDEXRegisterRs2) ) begin
            forwardB = 2'b10;  end 
        else if ( MEMWBRegWrite & (MEMWBRegisterRd != 0) & (MEMWBRegisterRd == IDEXRegisterRs1) 
            & !( EXMEMRegWrite & !(EXMEMRegisterRd == 0) & (EXMEMRegisterRd == IDEXRegisterRs1) ))
            forwardA = 2'b01;
        else if (( MEMWBRegWrite & (MEMWBRegisterRd != 0)
            & (MEMWBRegisterRd == IDEXRegisterRs2) )
            & ! ( EXMEMRegWrite & (EXMEMRegisterRd != 0)
            & (EXMEMRegisterRd == IDEXRegisterRs2) ))
            forwardB = 2'b01;
        else begin forwardA = 2'b00; forwardB = 2'b00; end 

    end 
endmodule
