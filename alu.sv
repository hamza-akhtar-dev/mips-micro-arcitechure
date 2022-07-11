module moduleName (
    input logic [31:0] srca, srcb,;
    input logic [2:0] alucontrol; 
    output logic [31:0] aluout;
    output logic zero
);

always_comb

case(alucontrol)
    3'b010: aluout <= srca + srcb;  // add
    3'b110: aluout <= srca - srcb;  // sub
    3'b000: aluout <= srca & srcb;  // and
    3'b001: aluout <= srca | srcb;  // or
    3'b111: aluout <= (srca < srcb) ? 32'd1 : 32'd0 ;  // slt
   
endcase
    
endmodule