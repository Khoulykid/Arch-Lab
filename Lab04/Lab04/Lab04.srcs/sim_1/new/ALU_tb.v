`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 03:18:51 PM
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb();
    localparam period = 10;
    reg [31:0] a;
    reg [31:0] b;
    reg [31:0] check;
    reg [3:0] ALUsel;
    wire [31:0] out;
    wire zf;
    reg [2:0] i;
    
    ALU #(32) DUT(.a(a), .b(b), .ALUsel(ALUsel), .out(out), .zf(zf));
    
    initial begin
    a = 10;
    b = 130;
    for (i = 0; i < 4; i = i+1) begin
        if (i == 3)
            ALUsel = 6;
        else
            ALUsel = i;
        
        case(i)
            0: check = a & b;
            1: check = a | b;
            2: check = a + b;
            3: check = a - b;
        endcase
        #period
        if (out==check)
            $display("Correct");
        else
            $display("Wrong");
        #period;
        end
    a = 5;
    b = 5;
    for (i = 0; i < 4; i = i+1) begin
        if (i == 3)
            ALUsel = 6;
        else
            ALUsel = i;
        
        case(i)
            0: check = a & b;
            1: check = a | b;
            2: check = a + b;
            3: check = a - b;
        endcase
        #period
        if (out==check)
            $display("Correct");
        else
            $display("Wrong");
        #period;
        end
    end
        
    

endmodule
