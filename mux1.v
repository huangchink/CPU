module mux1(pc_write, pc_src,pc_add_4,pc_branch,alu_out,pc_next);

input pc_write, pc_src;
input [31:0]pc_add_4,pc_branch,alu_out;

output wire [31:0]pc_next;

assign pc_next = pc_write? ( pc_src? (alu_out):(alu_out) ):( pc_src? (pc_branch):(pc_add_4) );
endmodule