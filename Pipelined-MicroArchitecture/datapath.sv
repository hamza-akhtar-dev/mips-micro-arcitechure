module datapath(
    input logic clk, reset,
    input logic memtoreg, pcsrc,
    input logic alusrc, regdst,
    input logic regwrite, jump,
    input logic [2:0] alucontrol,
    input logic [31:0] ReadDataM,
    input logic [31:0] InstrF,
    output logic ZeroM,
    output logic [31:0] PC,
    output logic [31:0] ALUOutM, WriteDataM
);

//Fetch

mux2 #(32) pcmux(PCPlus4F, PCBranch, pcsrc, PCNext);

flopr #(32) pcreg(clk, reset, PCNext, PC);

adder pcadd1(PC, 32'b100, PCPlus4F);

f_d pipereg1 (clk, reset, InstrF, PCPlus4F, InstrD, PCPlus4D)

//Decode

regfile rf(clk, regwrite, InstrD[25:21], InstrD[20:16], writereg, result, ReadData1D, ReadData2D);

signext se(instr[15:0], SignImmD);

//Execute

d_e pipereg2 (clk, reset, InstrD[20:16], InstrD[15:11], ReadData1D, ReadData2D, SignImmD, PCPlus4D, RtE, RdE, SrcAE, WriteDataE, SignImmE, PCPlus4E)

mux2 #(32) srcbmux(WriteDataE, SignImmE, alusrc, SrcBE);

alu alu(SrcAE, SrcBE, alucontrol, ALUOutE, ZeroE);

sl2 immsh(SignImmE, SignImmShE);

adder pcadd2(PCPlus4E, SignImmShE, PCBranchE);

//Memory

e_m pipereg3 (clk, reset, ZeroE, ALUOutE, WriteDataE, PCBranchE, ZeroM, ALUOutM, WriteDataM, PCBranchM);

//Writeback

m_w pipereg4 (clk, reset, ALUOutM, ReadDataM, ALUOutW, ReadDataW);

mux2 #(32) resmux(ALUOutW, ReadDataW, memtoreg, ResultW);

endmodule