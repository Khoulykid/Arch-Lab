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


module RISCV_pipeline(
    input [1:0] ledSel, //input to select what the output on the LED will represent
    input [3:0] ssdSel, //to choose what will be represented on the SSD
    input new_clk,  //clock input
    input new_rst,  //reset input
    input SSDclk,   //The clock for SSD
    output reg [15:0] LED,  //The LEDs
    output [7:0] Anode, //Anodes for the SSD
    output [6:0] LED_out   //The SSD
);
    wire [31:0] temp;   //used in EX/Mem
    assign temp = ID_EX_PC+{ID_EX_Imm[30:0], 1'b0};
    wire [31:0] inst;   //Wire to hold the current instruction
    wire [31:0] writedata, newpc, PCout;    //the data to be written in the reg file, the new pc count, the output of the PC
    wire wr, zf, memread, memwrite, PCload, branch, memtoreg;   //boolean elements from CU depending on the inst
    wire [31:0] rd1, rd2, gen_out, ALUmux, ALUout, memdata;
    wire ALUsrc; //Values to be carried from one place to another
    wire [1:0] ALUop;   //The ALU opcode to decide on the ALU operation.
    wire [3:0] ALUsel;  //The Selector to decide on the ALU operation.
    wire new_clk, new_rst;  //wires to hold the value of the clock and reset after the push button.
    reg [12:0] SSD; //a reg to hold the value of the output we need before conversion for the SSD
    
    nBitRegister #(32) PC(.data(newpc), .clk(new_clk), .rst(new_rst), .load(1), .outData(PCout));   //The PC
    
    wire[31:0] IF_ID_PC, IF_ID_Inst;
    
    
    nBitRegister #(64) IF_ID(
        .clk(new_clk), .rst(new_rst), .load(1'b1), 
        .data({PCout, inst}), 
        .outData({IF_ID_PC, IF_ID_Inst}));
    
    
    wire [31:0] ID_EX_PC, ID_EX_RegR1, ID_EX_RegR2, ID_EX_Imm;
    wire [7:0] ID_EX_Ctrl;
    wire [3:0] ID_EX_Func;
    wire  [4:0] ID_EX_Rs1, ID_EX_Rs2, ID_EX_Rd; 
    
    
    nBitRegister #(155) ID_EX (
        .clk(new_clk),.rst(new_rst),.load(1'b1),
        
        .data({wr, memtoreg,branch, memread, memwrite, ALUop, ALUsrc,IF_ID_PC, rd1, rd2,
        gen_out,IF_ID_Inst[30], IF_ID_Inst[14:12],IF_ID_Inst[19:15], IF_ID_Inst[24:20], IF_ID_Inst[11:7]}),
                                
        .outData({ID_EX_Ctrl,ID_EX_PC,ID_EX_RegR1,ID_EX_RegR2,
        ID_EX_Imm, ID_EX_Func,ID_EX_Rs1,ID_EX_Rs2,ID_EX_Rd})); 
    
    wire [31:0] EX_MEM_BranchAddOut, EX_MEM_ALU_out, EX_MEM_RegR2; 
    wire [4:0] EX_MEM_Ctrl;
    wire [4:0] EX_MEM_Rd;
    wire EX_MEM_Zero;
    
    
    
    nBitRegister #(107) EX_MEM (
        .clk(new_clk),.rst(new_rst),.load(1'b1),
        
        .data({ID_EX_Ctrl[7:3], (temp), zf, ALUout, ID_EX_RegR2, ID_EX_Rd}),
        
        .outData({EX_MEM_Ctrl, EX_MEM_BranchAddOut, EX_MEM_Zero,
        EX_MEM_ALU_out, EX_MEM_RegR2, EX_MEM_Rd} ));
    
    
    
    
    wire [31:0] MEM_WB_Mem_out, MEM_WB_ALU_out;
    wire [1:0] MEM_WB_Ctrl;
    wire [4:0] MEM_WB_Rd;
    
    nBitRegister #(71) MEM_WB (
        .clk(new_clk),.rst(new_rst),.load(1'b1),
        
        .data({EX_MEM_Ctrl[4:3], memdata, EX_MEM_ALU_out, EX_MEM_Rd}),
        
        .outData({MEM_WB_Ctrl,MEM_WB_Mem_out, MEM_WB_ALU_out,
        MEM_WB_Rd}));
    
    InstMem instructions(.addr(PCout[7:2]), .data_out(inst));   //The Instruction Memory
    
    regFile register_file( .readAddr1(IF_ID_Inst[19:15]), .readAddr2(IF_ID_Inst[24:20]), 
    .writeAddr(MEM_WB_Rd), .writeData(writedata), .clk(new_clk), .rst(new_rst), .wr(MEM_WB_Ctrl[1]),
    .rd1(rd1), .rd2(rd2));  //Reg File
    
    ImmGen immediate(.gen_out(gen_out), .inst(IF_ID_Inst));   //Immediate Generator
    
    ALU #(32) ALU1(.a(ID_EX_RegR1), .b(ALUmux), .ALUsel(ALUsel), .out(ALUout), .zf(zf));    //ALU
    
    DataMem DM(.clk(new_clk), .MemRead(EX_MEM_Ctrl[1]), .MemWrite(EX_MEM_Ctrl[0]), .addr(EX_MEM_ALU_out[7:2]), .data_in(EX_MEM_RegR2),
    .data_out(memdata));    //Our Memory.
    
    cu CPU( .inst62(IF_ID_Inst[6:2]), .branch(branch), .memread(memread), .memtoreg(memtoreg),
    .ALUop(ALUop), .memwrite(memwrite), .ALUsrc(ALUsrc), .regwrite(wr));    //the CPU
    
    ALUcu ACPU(.ALUop(ID_EX_Ctrl[2:1]), .inst_14_2(ID_EX_Func[2:0]), .inst_30(ID_EX_Func[3]), .ALUsel(ALUsel));    //the ALUCU
    
    
    mMuxes #(32) ALUinputmux(.b(ID_EX_RegR2), .a(ID_EX_Imm), .s(ID_EX_Ctrl[0]), .out(ALUmux));   //All the muxes in the circuit.
    
    mMuxes #(32) regwritedata(.a(MEM_WB_Mem_out), .b(MEM_WB_ALU_out), .s(MEM_WB_Ctrl[0]), .out(writedata));
    
    mMuxes #(32) PCinput(.a(EX_MEM_BranchAddOut), .b(PCout+4),.s(EX_MEM_Ctrl[2]&EX_MEM_Zero), .out(newpc));
    
    
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
            4'b0010: SSD = PCout+{gen_out[30:0], 1'b0};
            4'b0011: SSD = newpc;
            4'b0100: SSD = rd1;
            4'b0101: SSD = rd2;
            4'b0110: SSD = writedata;
            4'b0111: SSD = gen_out;
            4'b1000: SSD = {gen_out[30:0], 1'b0};
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
