module mips(
    input logic clk, reset,
    output logic [31:0] pc,
    input logic [31:0] instr,
    output logic memwrite,
    output logic [31:0] aluout, writedata,
    input logic [31:0] readdata
);

logic memtoreg, alusrc, regdst, regwrite, branch, zero;
logic [2:0] alucontrol;

controller c(instr[31:26], instr[5:0], zero, memtoreg, memwrite, branch, alusrc, regdst, regwrite, alucontrol);

datapath dp(clk, reset, memtoreg, memwrite, branch, alusrc, regdst, regwrite, alucontrol, zero, pc, instr, aluout, writedata, readdata, memwrite_m);

endmodule