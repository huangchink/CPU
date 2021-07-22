module adder_32bit1(sign_extend_out,pc_add_4,pc_branch);

input [31:0]sign_extend_out,pc_add_4;
output wire[31:0]pc_branch;

assign  pc_branch=sign_extend_out+pc_add_4;

endmodule