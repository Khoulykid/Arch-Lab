`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2024 04:01:20 PM
// Design Name: 
// Module Name: sl1
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

module sl1 #(parameter n = 8) (
        input [n-1 : 0] a, 
        input [4:0] shamt,
        input [1:0] type,
        output reg [n-1 : 0] r
    );
    always @ * begin
        r = 0; 
        case (type) // alu OP 
            2'b00  : r =  a >> shamt;   
            2'b10  : r =  a >>> shamt; 
            2'b01  : r =  a << shamt; 
            default : r = a; 
        endcase 
    end   
    
endmodule
