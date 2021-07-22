module alu(source_1, source_2,alu_op,c_in,nzcv,alu_out);

input [31:0]source_1, source_2;
input [3:0]alu_op;
input c_in;
output [3:0]nzcv;
output [31:0]alu_out;

reg [31:0]alu_out;
reg [3:0]nzcv;
reg [32:0]temp;
reg [31:0]add_scr1,add_scr2;

	
	always@(*)begin
	temp=33'b0;
	add_scr1=32'b11111111111111111111111111111111;
	add_scr2=32'b00000000000000000000000000000000;
		case(alu_op)
			4'b0000:alu_out =source_1&source_2;
			4'b0001:alu_out =source_1^source_2;
			
			4'b0010:begin
				add_scr1=source_1;
				add_scr2=(~source_2)+1;
				alu_out =add_scr1+add_scr2;
				temp=add_scr1+add_scr2;
			
			end
			
			4'b0011:begin
			add_scr1=source_2;
			add_scr2=(~source_1)+1;
			
			alu_out =add_scr1+add_scr2;
			temp=add_scr1+add_scr2;
		
			end
			4'b0100:begin
		add_scr1=source_1;
		add_scr2=source_2;
			alu_out =add_scr1+add_scr2;
			temp=add_scr1+add_scr2;
		
			end
			
			4'b0101:begin
			add_scr1=source_1;
			add_scr2=source_2+c_in;
			alu_out =add_scr1+add_scr2;
			temp=add_scr1+add_scr2;
			end
			4'b0110:begin
			add_scr1=source_1;
			add_scr2=(~source_2)+1+c_in-32'b1;
			alu_out =add_scr1+add_scr2;
			temp=add_scr1+add_scr2;
			end
			4'b0111:begin
			add_scr1=source_2;
			add_scr2=(~source_1)+1+c_in-32'b1;
			alu_out =add_scr1+add_scr2;
			temp=add_scr1+add_scr2;
			end
			
			4'b1000:alu_out =source_1&source_2;
			4'b1001:alu_out =source_1^source_2;
			4'b1010:begin
			add_scr1=source_1;
			add_scr2=(~source_2)+1;
			alu_out =add_scr1+add_scr2;
			temp =add_scr1+add_scr2;
			end
			4'b1011:begin
			add_scr1=source_1;
			add_scr2=source_2;
			alu_out =add_scr1+add_scr2;
			temp =add_scr1+add_scr2;
			end
			4'b1100:alu_out =source_1|source_2;
			4'b1101:alu_out =source_2;
			4'b1110:alu_out =source_1&(~source_2);
			4'b1111:alu_out =~source_2;
			
			default: alu_out =32'b0;
		endcase
	end
	always@(*)begin
	nzcv[1]=temp[32];
		if(alu_out[31]==1)
			nzcv[3]=1;
		else
			nzcv[3]=0;
		if(alu_out==32'b0)
			nzcv[2]=1;
		else
			nzcv[2]=0;
			
		if((~add_scr1[31]&&~add_scr2[31] &&alu_out[31])||(add_scr1[31]&&add_scr2[31]&&~alu_out[31]))
			nzcv[0]=1;
		else
			nzcv[0]=0;
			
	end
	
endmodule