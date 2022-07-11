module f_d (
    input logic clk, reset,
    input logic [31:0] ALUOutM, ReadDataM,
    output logic [31:0] ALUOutW, ReadDataW
);
 
 flopr #(32) reg1(clk, reset, ALUOutM, ALUOutW);
 flopr #(32) reg2(clk, reset, ReadDataM, ReadDataW);
 
endmodule