module f_d (
    input logic clk, reset,
    input logic[31:0] instrF,
    input logic[31:0] PCPlus4F,
    output logic[31:0] instrD;
    output logic[31:0] PCPlus4D;
);
 
 flopr #(32) reg1(clk, reset, instrF, instrD);
 
 flopr #(32) reg2(clk, reset, PCPlus4F, PCPlus4D);
 
endmodule