module f_d (
    input logic clk, reset, ZeroE,
    input logic [31:0] ALUOutE, WriteDataE, PCBranchE,
    output logic ZeroM,
    output logic [31:0] ALUOutM, WriteDataM, PCBranchM
);
 
 flopr #(1) reg1(clk, reset, ZeroE, ZeroM);
 flopr #(32) reg2(clk, reset, ALUOutE, ALUOutM);
 flopr #(32) reg3(clk, reset, WriteDataE, WriteDataM);
 flopr #(32) reg4(clk, reset, PCBranchE, PCBranchM);
 
endmodule