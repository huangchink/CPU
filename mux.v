module mux(mem_to_reg,mem_read_data,alu_out,reg_write_data);

input mem_to_reg;
input [31:0]mem_read_data,alu_out;

output wire [31:0]reg_write_data;

assign reg_write_data = mem_to_reg?(mem_read_data):(alu_out);
endmodule