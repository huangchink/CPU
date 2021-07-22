module multi_4_and_sign_extend(sign_immediate_in,sign_immediate_out);

input[23:0]sign_immediate_in;
output[31:0]sign_immediate_out;


reg[23:0]sign_immediate_in1;
reg[23:0]temp_in;
reg[31:0]sign_immediate_out;
reg[31:0]temp_out;

always@(*)begin
if(sign_immediate_in[23]==1'b0)begin
 temp_in=sign_immediate_in;
 sign_immediate_in1=temp_in<<2;
 temp_out=32'b0;
 sign_immediate_out=temp_out+sign_immediate_in1;
end

else begin
 temp_in=(~sign_immediate_in)+1'b1;
 sign_immediate_in1=temp_in<<2;
 temp_out=32'b0;
 sign_immediate_out=temp_out+sign_immediate_in1;
 temp_out=(~sign_immediate_out)+1;
 sign_immediate_out=temp_out;
end
end
endmodule