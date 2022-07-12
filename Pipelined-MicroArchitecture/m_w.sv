module m_w (
    input logic clk, reset,
    input logic [31:0] ALUOutM, ReadDataM,
    input logic [4:0] WriteRegM,
    output logic [31:0] ALUOutW, ReadDataW
    output logic [4:0] WriteRegW
);
 
 flopr #(32) reg1(clk, reset, ALUOutM, ALUOutW);
 flopr #(32) reg2(clk, reset, ReadDataM, ReadDataW);
 
endmodule