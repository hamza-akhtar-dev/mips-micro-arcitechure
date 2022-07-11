module d_e (
    input logic clk, reset,
    input logic[4:0] RtD, RdD,
    input logic[31:0] ReadData1D, ReadData2D,
    input logic[31:0] SignImmD,
    input logic[31:0] PCPlus4D;
    output logic[4:0] RtE, RdE,
    output logic[31:0] ReadData1E, ReadData2E,
    output logic[31:0] SignImmE,
    output logic[31:0] PCPlus4E;
);
 
 flopr #(5) reg1(clk, reset, RtD, RtE);
 flopr #(5) reg2(clk, reset, RdD, RdE);
 flopr #(32) reg3(clk, reset, ReadData1D, ReadData1E);
 flopr #(32) reg4(clk, reset, ReadData2D, ReadData2E);
 flopr #(32) reg5(clk, reset, SignImmD, SignImmE);
 flopr #(32) reg6(clk, reset, PCPlus4D, PCPlus4E);
 
endmodule