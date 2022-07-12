module controller(
    input logic [5:0] op, funct,
    input logic zero,
    output logic memtoreg, memwrite,
    output logic branch, alusrc,
    output logic regdst, regwrite,
    output logic [2:0] alucontrol
);

logic [1:0] aluop;

maindec md(op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, aluop);

aludec ad(funct, aluop, alucontrol);

endmodule