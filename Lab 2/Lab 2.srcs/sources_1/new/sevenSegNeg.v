`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2024 04:06:18 PM
// Design Name: 
// Module Name: sevenSegNeg
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


module sevenSegNeg(
    input clk,
    input [7:0] SW,
    output reg [3:0] Anode,
    output reg [6:0] LED_out
    );
    
    wire [3:0]hun;
    wire [3:0]ten;
    wire [3:0]one;
    wire [7:0] zz;
    assign zz = (SW[7] == 1'b0) ? SW : ~SW[6:0]+1'b1; 
    
    BCD botato(
        .SW(zz[6:0]), 
        .Hundreds(hun), 
        .Tens(ten), 
        .Ones(one)
    );
        
    reg [3:0] LED_BCD;
    reg [19:0] refresh_counter = 0; // 20-bit counter
    wire [1:0] LED_activating_counter;
    always @(posedge clk)
        begin
            refresh_counter <= refresh_counter + 1;
        end
    assign LED_activating_counter = refresh_counter[19:18];
    always @(*)
    begin
        case(LED_activating_counter)
        2'b00: begin
        Anode = 4'b1011;
        LED_BCD = hun;
        end
        2'b01: begin
        Anode = 4'b1101;
        LED_BCD = ten;
        end
        2'b10: begin
        Anode = 4'b1110;
        LED_BCD = one;
        end
        2'b11: begin 
        Anode = 4'b0111; 
        LED_BCD = (SW[7] == 1'b1) ?  4'b1011: 4'b1010; 
        end
    endcase
    end
    always @(*)
        begin
        case(LED_BCD)
            4'b0000: LED_out = 7'b0000001; // "0"
            4'b0001: LED_out = 7'b1001111; // "1"
            4'b0010: LED_out = 7'b0010010; // "2"
            4'b0011: LED_out = 7'b0000110; // "3"
            4'b0100: LED_out = 7'b1001100; // "4"
            4'b0101: LED_out = 7'b0100100; // "5"
            4'b0110: LED_out = 7'b0100000; // "6"
            4'b0111: LED_out = 7'b0001111; // "7"
            4'b1000: LED_out = 7'b0000000; // "8"
            4'b1001: LED_out = 7'b0000100; // "9"
            4'b1010: LED_out = 7'b1111111; // "10"
            4'b1011: LED_out = 7'b1111110; // "11"
            default: LED_out = 7'b0000001; // "0"
        endcase
     end
endmodule
