`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2024 11:09:12 AM
// Design Name: 
// Module Name: TOP
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


module TOP(
    input [1:0] ledSel, //input to select what the output on the LED will represent
    input [3:0] ssdSel, //to choose what will be represented on the SSD
    input new_clk,  //clock input
    input new_rst,  //reset input
    input SSDclk,   //The clock for SSD
    output reg [15:0] LED,  //The LEDs
    output [7:0] Anode, //Anodes for the SSD
    output [6:0] LED_out   //The SSD
);
    
    wire [31:0] inst;   //Wire to hold the current instruction
    wire [31:0] writedata, newpc, PCout;    //the data to be written in the reg file, the new pc count, the output of the PC
    wire wr, zf, memread, memwrite, PCload, branch, memtoreg;   //boolean elements from CU depending on the inst
    wire [31:0] rd1, rd2, gen_out, ALUmux, ALUout, memdata, ALUsrc; //Values to be carried from one place to another
    wire [1:0] ALUop;   //The ALU opcode to decide on the ALU operation.
    wire [3:0] ALUsel;  //The Selector to decide on the ALU operation.
    //wire new_clk, new_rst;  //wires to hold the value of the clock and reset after the push button.
    reg [12:0] SSD; //a reg to hold the value of the output we need before conversion for the SSD
    
    nBitRegister #(32) PC(.data(newpc), .clk(new_clk), .rst(new_rst), .load(1), .outData(PCout));   //The PC
    
    InstMem instructions(.addr(PCout[7:2]), .data_out(inst));   //The Instruction Memory
    
    regFile register_file( .readAddr1(inst[19:15]), .readAddr2(inst[24:20]), 
    .writeAddr(inst[11:7]), .writeData(writedata), .clk(new_clk), .rst(new_rst), .wr(wr),
    .rd1(rd1), .rd2(rd2));  //Reg File
    
    ImmGen immediate(.gen_out(gen_out), .inst(inst));   //Immediate Generator
    
    ALU #(32) ALU1(.a(rd1), .b(ALUmux), .ALUsel(ALUsel), .out(ALUout), .zf(zf));    //ALU
    
    DataMem DM(.clk(new_clk), .MemRead(memread), .MemWrite(memwrite), .addr(ALUout[7:2]), .data_in(rd2),
    .data_out(memdata));    //Our Memory.
    
    cu CPU( .inst62(inst[6:2]), .branch(branch), .memread(memread), .memtoreg(memtoreg),
    .ALUop(ALUop), .memwrite(memwrite), .ALUsrc(ALUsrc), .regwrite(wr));    //the CPU
    
    ALUcu ACPU(.ALUop(ALUop), .inst_14_2(inst[14:12]), .inst_30(inst[30]), .ALUsel(ALUsel));    //the ALUCU
    
    mMuxes #(32) ALUinputmux(.b(rd2), .a(gen_out), .s(ALUsrc), .out(ALUmux));   //All the muxes in the circuit.
    mMuxes #(32) regwritedata(.a(memdata), .b(ALUout), .s(memtoreg), .out(writedata));
    mMuxes #(32) PCinput(.a(PCout+{gen_out[30:0], 1'b0}), .b(PCout+4),.s(branch&zf), .out(newpc));
    
    always @* begin
        case(ledSel)
            2'b00: LED =  inst[15:0];
            2'b01: LED = inst[31:16];
            2'b10: LED = {0, ALUop, branch, memread, memtoreg, memwrite, wr, ALUsel, zf, branch&zf};
        endcase
    
    end 
    
    always @* begin
        case(ssdSel)
            4'b0000: SSD = PCout;
            4'b0001: SSD = PCout + 4;
            4'b0010: SSD = PCout+{gen_out[30:0], 0};
            4'b0011: SSD = newpc;
            4'b0100: SSD = rd1;
            4'b0101: SSD = rd2;
            4'b0110: SSD = writedata;
            4'b0111: SSD = gen_out;
            4'b1000: SSD = {gen_out[30:0], 0};
            4'b1001: SSD = ALUmux;
            4'b1010: SSD = ALUout;
            4'b1011: SSD = memdata;
        endcase
    end
    
    //push_button_detector Push_clk(.clk(SSDclk), .rst(0), .x(clk), .z(new_clk));
    //push_button_detector Push_rst(.clk(SSDclk), .rst(0), .x(rst), .z(new_rst));
    F_Dig_7_dig sevenSeg(.clk(SSDclk), .SW(SSD), .Anode(Anode[3:0]), .LED_out(LED_out));
    assign Anode[7:4] = 4'b1111;
    
    

endmodule
