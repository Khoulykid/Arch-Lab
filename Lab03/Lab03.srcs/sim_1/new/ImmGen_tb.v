`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2024 04:22:52 PM
// Design Name: 
// Module Name: ImmGen_tb
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


module ImmGen_tb(); 
    reg [31:0] inst;
    wire [31:0] out;
    ImmGen DUT (.inst(inst), .gen_out(out));
    localparam period = 10;
    initial begin 
        inst = 32'b00000000010100101010001000000011;  //lw x4, 5(x5) imm = 5 
        #period
        inst = 32'b00000000001100111010001000100011; // sw x3, 4(x7) imm = 4
        #period; 
        inst = 32'b00000000000000000000000101100011; // beq x0, x0, 2 imm = 2 but divided by two
        #period; 
        $finish;
    end
    
endmodule
