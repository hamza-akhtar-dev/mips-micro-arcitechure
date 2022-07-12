module datapath(
    input logic clk, reset,
    input logic memtoreg_d, memwrite_d, branch_d,
    input logic alusrc_d, regdst_d,
    input logic regwrite_d,
    input logic [2:0] alucontrol,
    input logic [31:0] ReadDataM,
    input logic [31:0] InstrF,
    output logic ZeroM,
    output logic [31:0] PC,
    output logic [31:0] ALUOutM, WriteDataM,
    output logic memwrite_m
);

logic [7:0] controls_d;

//Fetch

mux2 #(32) pcmux(PCPlus4F, PCBranch, pcsrc_m, PCNext);

flopr #(32) pcreg(clk, reset, PCNext, PC);

adder pcadd1(PC, 32'b100, PCPlus4F);

f_d pipereg1 (clk, reset, InstrF, PCPlus4F, InstrD, PCPlus4D)

//Decode

regfile rf(clk, regwrite_w, InstrD[25:21], InstrD[20:16], WriteRegW, ResultW, ReadData1D, ReadData2D);

signext se(instr[15:0], SignImmD);

//Execute

d_e pipereg2 (clk, reset, {regwrite_d, memtoreg_d, memwrite_d, branch_d, alucontrol_d, alusrc_d, regdst_d}, InstrD[20:16], InstrD[15:11], ReadData1D, ReadData2D, SignImmD, PCPlus4D, {regwrite_e, memtoreg_e, memwrite_e, branch_e, alucontrol_e, alusrc_e, regdst_e}, RtE, RdE, SrcAE, WriteDataE, SignImmE, PCPlus4E)

mux2 #(5) wrmux(RtE, RdE, regdst_e, WriteRegE);

mux2 #(32) srcbmux(WriteDataE, SignImmE, alusrc_e, SrcBE);

alu alu(SrcAE, SrcBE, alucontrol_e, ALUOutE, ZeroE);

sl2 immsh(SignImmE, SignImmShE);

adder pcadd2(PCPlus4E, SignImmShE, PCBranchE);


//Memory

e_m pipereg3 (clk, reset, {regwrite_e, memtoreg_e, memwrite_e, branch_e}, ZeroE, ALUOutE, WriteDataE, PCBranchE, WriteRegE, {regwrite_m, memtoreg_m, memwrite_m, branch_m} ZeroM, ALUOutM, WriteDataM, PCBranchM, WriteRegM);

assign pcsrc_m = branch_m & ZeroM;

//Writeback

m_w pipereg4 (clk, reset, {regwrite_m, memtoreg_m}, ALUOutM, ReadDataM, WriteRegM, {regwrite_w, memtoreg_w}, ALUOutW, ReadDataW, WriteRegW);

mux2 #(32) resmux(ALUOutW, ReadDataW, memtoreg_w, ResultW);

endmodule