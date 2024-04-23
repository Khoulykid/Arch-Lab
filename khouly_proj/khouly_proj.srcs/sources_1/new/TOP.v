`timescale 1ns / 1ps
`include "defines.v" 
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
    wire wr, zf,cf, vf,sf, memread, memwrite, PCload, branch, memtoreg, jal, jalr, lui, auipc, branch_out;   //boolean elements from CU depending on the inst
    wire [31:0] rd1, rd2, gen_out, ALUmux, ALUout, memdata; //Values to be carried from one place to another
    wire [1:0] ALUop;   //The ALU opcode to decide on the ALU operation.
    wire [3:0] ALUsel;  //The Selector to decide on the ALU operation.
    //wire new_clk, new_rst;  //wires to hold the value of the clock and reset after the push button.
    reg [12:0] SSD; //a reg to hold the value of the output we need before conversion for the SSD
    wire ALUsrc;
    wire [31:0] write_out;
    wire [1:0] forwardA, forwardB;

    wire stall; //stall signal

    //PC
    nBitRegister #(32) PC(.data(newpc), .clk(new_clk), .rst(new_rst), .load(!stall), .outData(PCout));

    //IF_ID outputs(wires) and new input of the mux
    wire [31:0] IF_ID_PC, IF_ID_Inst, newInst;
    

    //mux to decide input when jumping
    mMuxes #(32) IF_ID_Input(.a(32'b0000000_00000_00000_000_00000_0110011), .b(inst), .s(branch_out), .out(newInst));

    nBitRegister #(64) IF_ID(
        .clk(new_clk), .rst(new_rst), .load(!stall), 
        .data({PCout, newInst}), 
        .outData({IF_ID_PC, IF_ID_Inst}));


    //Reg File

    regFile register_file( .readAddr1(IF_ID_Inst[19:15]), .readAddr2(IF_ID_Inst[24:20]), 
    .writeAddr(inst[11:7]), .writeData(writedata), .clk(!new_clk), .rst(new_rst), .wr(MEM_WB_CTRL[5]),
    .rd1(rd1), .rd2(rd2));

    // ID_EX outputs
    wire [11:0] ID_EX_CTRL; //= wr, memwrite, memread, memtoreg, lui, auipc, branch, jal, jalr, ALUop, ALUsrc
    wire [31:0] ID_EX_PC, ID_EX_RegR1, ID_EX_RegR2, ID_EX_Imm;
    wire ID_EX_Func7;
    wire [2:0] ID_EX_Func3;
    wire [4:0] ID_EX_RS1, ID_EX_RS2, ID_EX_RD;

    wire [11:0] ctrl;

    mMuxes #(12) ID_EX_ctrl_in(.a(12'd0), .b({wr, memwrite, memread, memtoreg, lui, auipc, branch, jal, jalr, ALUop, ALUsrc})
    , .s(stall || branch_out), .out(ctrl));

    nBitRegister #(159) ID_EX(
        .clk(new_clk), .rst(new_rst), .load(1),

        .data({ctrl, IF_ID_PC, rd1, rd2, gen_out
        , IF_ID_Inst[30], IF_ID_Inst[IR_funct3], IF_ID_Inst[IR_rs1], IF_ID_Inst[IR_rs2], IF_ID_Inst[IR_rd]}), 

        .outData({ID_EX_CTRL, ID_EX_PC, ID_EX_RegR1, ID_EX_RegR2, ID_EX_Imm, ID_EX_Func7, ID_EX_Func3, ID_EX_RS1, ID_EX_RS2, ID_EX_RD}));
    
    //ALU
    mMuxes #(32) ALUinputmux(.b(ID_EX_RegR2), .a(ID_EX_Imm), .s(ID_EX_CTRL[0]), .out(ALUmux));
    Mux4x1 #(32) ALU_final_input(in0(ALUmux), in1(write_out), ); //FILL LATER EDITAFTER after hazard and final mux
    prv32_ALU #(32) ALU( .a(ID_EX_RegR1), .b(ALUmux), .shamt(ALUmux[4:0]), .alufn(ALUsel)
    , .r(ALUout), .zf(zf), .cf(cf), .vf(vf), .sf(sf));

    //the ALUCU
    ALUcu ACPU(.ALUop(ID_EX_CTRL[2:1]), .inst_14_12(ID_EX_Func3), .inst_30(ID_EX_Func7), .ALUsel(ALUsel));
    

    wire [31:0] EX_MEM_PC, EX_MEM_Imm;
    wire [8:0] EX_MEM_CTRL; //= wr, memwrite, memread, memtoreg, lui, auipc, branch, jal, jalr
    wire [31:0] EX_MEM_RegR2, EX_MEM_ALU_out, EX_MEM_Rd;
    wire [3:0] EX_MEM_Flags;    //= zf, cf, vf, sf
    wire [2:0] EX_MEM_Func3;
    wire [8:0] EX_MEM_new_ctrl;

    forwarding_unit FA(.IDEXRegisterRs1(ID_EX_RS1), .IDEXRegisterRs2(ID_EX_RS2), .EXMEMRegisterRd(EX_MEM_Rd)
    , .MEMWBRegisterRd(MEM_WB_Rd), .EXMEMRegWrite(EX_MEM_CTRL[8]), .MEMWBRegWrite(MEM_WB_CTRL[5]), .forwardA(forwardA), .forwardB(forwardB));

    mMuxes #(9) EX_MEM_ctrl_mux(.a(9'd0), .b(ID_EX_CTRL[11:3]), s(branch_out), .out(EX_MEM_new_ctrl));  //EDITAFTER  branching

    nBitRegister #(149) EX_MEM
    (
        .clk(new_clk), .rst(new_rst), .load(1),
        .data({EX_MEM_new_ctrl, ID_EX_PC, ID_EX_Imm, zf, cf, vf, sf, ALUout, ID_EX_RegR2, ID_EX_RD, ID_EX_Func3}),
        .outData({EX_MEM_CTRL, EX_MEM_PC, EX_MEM_Imm, EX_MEM_Flags, EX_MEM_ALU_out, EX_MEM_RegR2, EX_MEM_Rd, EX_MEM_Func3})
    );

    branch_control BCU( .branch(EX_MEM_CTRL[2]) , .funct3(EX_MEM_Func3), .zf(EX_MEM_Flags[3]), .cf(EX_MEM_Flags[2]), 
    .vf(EX_MEM_Flags[1]), .sf(EX_MEM_Flags[0]),  .branch_out(branch_out));
    

    //Mux for the PC input
    Mux4x1 #(32) PC_input_mux(.in0(EX_MEM_PC+4), .in1(EX_MEM_PC+EX_MEM_Imm), .in2(EX_MEM_RegR2 + EX_MEM_Imm), .in3(EX_MEM_PC+EX_MEM_Imm)
    , .s({(EX_MEM_CTRL[1]|branch_out), EX_MEM_CTRL[0]}), .out(newpc));


    wire [5:0] MEM_WB_CTRL; //= wr, memtoreg, lui, auipc, jal, jalr
    wire [31:0] MEM_WB_Mem_out, MEM_WB_ALU_out, MEM_WB_PC, MEM_WB_Imm;
    wire [4:0] MEM_WB_Rd;
    //MEM WB
    nBitRegister #(139) MEM_WB
    (
        .clk(new_clk), .rst(new_rst), .load(1'b1),
        .data({EX_MEM_CTRL[8], EX_MEM_CTRL[5:3], EX_MEM_CTRL[1:0], memdata, EX_MEM_ALU_out, EX_MEM_Rd, EX_MEM_PC, EX_MEM_Imm}),
        .outData({MEM_WB_CTRL, MEM_WB_Mem_out, MEM_WB_ALU_out, MEM_WB_Rd, MEM_WB_PC, MEM_WB_Imm})   //ERROR MIGHT BE IN CTRL
    );

    wire [31:0] inputhmux;
    mMuxes #(32) input0(.a(MEM_WB_Mem_out), .b(MEM_WB_ALU_out), .s(MEM_WB_CTRL[4]), .out(inputhmux));
    Mux4x1 #(32) write_out_mux(.in0(inputhmux), .in1(MEM_WB_PC + 4), .in2(MEM_WB_Imm), .in3(MEM_WB_PC + MEM_WB_Imm)
    , .s({MEM_WB_CTRL[2] | MEM_WB_CTRL[3], (MEM_WB_CTRL[0]|MEM_WB_CTRL[1])|MEM_WB_CTRL[2]}), .out(write_out));



    InstMem instructions(.addr(PCout[7:2]), .data_out(inst));   //The Instruction Memory
    
    
    
    
    rv32_ImmGen immediate(.Imm(gen_out), .IR(IF_ID_Inst));   //Immediate Generator
    
    

    DataMem DM(.clk(new_clk), .MemRead(memread), .MemWrite(memwrite), .addr(ALUout[7:2]), .data_in(rd2),
                .data_out(memdata));    //Our Memory.
    
    cu CPU( .inst62(IF_ID_Inst[6:2]), .branch(branch), .memread(memread), .memtoreg(memtoreg),
    .ALUop(ALUop), .memwrite(memwrite), .ALUsrc(ALUsrc), .regwrite(wr), .jal(jal), .jalr(jalr), .lui(lui), .auipc(auipc));    //the CPU
    
    
    
    //All the muxes in the circuit.
    wire [31:0] memtoregtomux; 
    
    mMuxes #(32) regwritedata(.a(memdata), .b(ALUout), .s(memtoreg), .out(memtoregtomux));

    // 4x1 muxes 
    // newPC mux 
    wire [31:0] tempPc1;
    wire [31:0] tempPc2;  
    mMuxes #(32) PCinput1(.a(rd1 +{gen_out[31:0]}), .b(PCout+4),.s(jalr), .out(tempPc1));
    mMuxes #(32) PCinput2(.a(PCout+{gen_out[31:0]}), .b(PCout+gen_out[31:0]),.s(jalr), .out(tempPc2)); // recheck 
    mMuxes #(32) PCinput12(.a(tempPc2), .b(tempPc1),.s(jal | branch_out), .out(newpc)); 
    
    // regWrite mux 
    wire [31:0] tempRF1;
    wire [31:0] tempRF2;  
    mMuxes #(32) RFinput1(.a(gen_out), .b(memtoregtomux),.s(lui|auipc), .out(tempRF1));
    mMuxes #(32) RFinput2(.a(PCout+gen_out), .b(PCout+4),.s(lui|auipc), .out(tempRF2)); // recheck 
    mMuxes #(32) Rfinput12(.a(tempRF2), .b(tempRF1),.s(auipc|(jal|jalr)), .out(writedata)); 
    
    
    
//    always @* begin
//        case(ledSel)
//            2'b00: LED =  inst[15:0];
//            2'b01: LED = inst[31:16];
//            2'b10: LED = {0, ALUop, branch, memread, memtoreg, memwrite, wr, ALUsel, zf, branch&zf};
//        endcase
    
//    end 
    
//    always @* begin
//        case(ssdSel)
//            4'b0000: SSD = PCout;
//            4'b0001: SSD = PCout + 4;
//            4'b0010: SSD = PCout+{gen_out[30:0], 0};
//            4'b0011: SSD = newpc;
//            4'b0100: SSD = rd1;
//            4'b0101: SSD = rd2;
//            4'b0110: SSD = writedata;
//            4'b0111: SSD = gen_out;
//            4'b1000: SSD = {gen_out[30:0], 0};
//            4'b1001: SSD = ALUmux;
//            4'b1010: SSD = ALUout;
//            4'b1011: SSD = memdata;
//        endcase
//    end
    
    //push_button_detector Push_clk(.clk(SSDclk), .rst(0), .x(clk), .z(new_clk));
    //push_button_detector Push_rst(.clk(SSDclk), .rst(0), .x(rst), .z(new_rst));
//    F_Dig_7_dig sevenSeg(.clk(SSDclk), .SW(SSD), .Anode(Anode[3:0]), .LED_out(LED_out));
//    assign Anode[7:4] = 4'b1111;
    
    

endmodule
