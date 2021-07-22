module adder_32bit(pc,pc_add_4);

input [31:0]pc;
output wire[31:0]pc_add_4;

assign  pc_add_4=pc+32'd4;

endmodule