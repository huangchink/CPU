module unsign_extend(unsign_immediate_in, unsign_immediate_out);

input [11:0]unsign_immediate_in;
output[31:0]unsign_immediate_out;
wire 	[31:0]unsign_immediate_out;
wire 	[31:0]temp;

assign temp=32'b0;
assign unsign_immediate_out=temp+unsign_immediate_in;

endmodule