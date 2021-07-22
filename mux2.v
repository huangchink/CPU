module mux2(alu_src,unsign_extend_out,shift_out,rorate_out,alu_operation_2);

input [1:0]alu_src;
input [31:0]unsign_extend_out,shift_out,rorate_out;

output wire [31:0]alu_operation_2;

assign alu_operation_2 = alu_src[1]?( alu_src[0]? (unsign_extend_out):(shift_out) ):( alu_src[0]?( rorate_out):(shift_out) );
endmodule