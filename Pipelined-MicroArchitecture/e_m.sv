module e_m (
    input logic clk, reset, ZeroE,
    input logic [31:0] ALUOutE, WriteDataE, PCBranchE, 
    input logic [4:0] WriteRegE,
    output logic ZeroM,
    output logic [31:0] ALUOutM, WriteDataM, PCBranchM,
    output logic [4:0] WriteRegM
);
 
 flopr #(1) reg1(clk, reset, ZeroE, ZeroM);
 flopr #(32) reg2(clk, reset, ALUOutE, ALUOutM);
 flopr #(32) reg3(clk, reset, WriteDataE, WriteDataM);
 flopr #(32) reg4(clk, reset, PCBranchE, PCBranchM);
 
endmodule