module register_file(clk, rst, reg_write, link, read_addr_1, read_addr_2, read_addr_3, write_addr, write_data, pc_content,pc_write, read_data_1, read_data_2,
read_data_3);

input  clk, rst, reg_write, link;
input [3:0] read_addr_1, read_addr_2, read_addr_3, write_addr;
input [31:0]write_data, pc_content;

output reg pc_write;
output reg[31:0] read_data_1, read_data_2,read_data_3;

reg [31:0]R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14;

always@(posedge clk or posedge rst)begin
	
		if(rst)begin
			R0=32'b0;
			R1=32'b0;
			R2=32'b0;
			R3=32'b0;
			R4=32'b0;
			R5=32'b0;
			R6=32'b0;
			R7=32'b0;
			R8=32'b0;
			R9=32'b0;
			R10=32'b0;
			R11=32'b0;
			R12=32'b0;
			R13=32'b0;
			R14=32'b0;
			pc_write=1'b0;
		end
		
			
		
		if(reg_write)begin
			case(write_addr)
			4'b0000:R0=write_data;
			4'b0001:R1=write_data;
			4'b0010:R2=write_data;
			4'b0011:R3=write_data;
			4'b0100:R4=write_data;
			4'b0101:R5=write_data;
			4'b0110:R6=write_data;
			4'b0111:R7=write_data;
			4'b1000:R8=write_data;
			4'b1001:R9=write_data;
			4'b1010:R10=write_data;
			4'b1011:R11=write_data;
			4'b1100:R12=write_data;
			4'b1101:R13=write_data;
			4'b1110:R14=write_data;
			4'b1111:pc_write=1'b1;
			default:R0=write_data;
			endcase
		end
		if(link)begin
		R14=pc_content;
		end
	
	
end


always@(*)begin
	if(reg_write==1&&write_addr==4'b1111)
	pc_write=1'b1;
	else 
	pc_write=1'b0;
	case(read_addr_1)
			4'b0000:read_data_1=R0;
			4'b0001:read_data_1=R1;
			4'b0010:read_data_1=R2;
			4'b0011:read_data_1=R3;
			4'b0100:read_data_1=R4;
			4'b0101:read_data_1=R5;
			4'b0110:read_data_1=R6;
			4'b0111:read_data_1=R7;
			4'b1000:read_data_1=R8;
			4'b1001:read_data_1=R9;
			4'b1010:read_data_1=R10;
			4'b1011:read_data_1=R11;
			4'b1100:read_data_1=R12;
			4'b1101:read_data_1=R13;
			4'b1110:read_data_1=R14;
			4'b1111:read_data_1=pc_content;
			default:read_data_1=R0;
		endcase
		
		case(read_addr_2)
		4'b0000:read_data_2=R0;
		4'b0001:read_data_2=R1;
		4'b0010:read_data_2=R2;
		4'b0011:read_data_2=R3;
		4'b0100:read_data_2=R4;
		4'b0101:read_data_2=R5;
		4'b0110:read_data_2=R6;
		4'b0111:read_data_2=R7;
		4'b1000:read_data_2=R8;
		4'b1001:read_data_2=R9;
		4'b1010:read_data_2=R10;
		4'b1011:read_data_2=R11;
		4'b1100:read_data_2=R12;
		4'b1101:read_data_2=R13;
		4'b1110:read_data_2=R14;
		4'b1111:read_data_2=pc_content;
		default:read_data_2=R0;
		endcase
		
		case(read_addr_3)
		4'b0000:read_data_3=R0;
		4'b0001:read_data_3=R1;
		4'b0010:read_data_3=R2;
		4'b0011:read_data_3=R3;
		4'b0100:read_data_3=R4;
		4'b0101:read_data_3=R5;
		4'b0110:read_data_3=R6;
		4'b0111:read_data_3=R7;
		4'b1000:read_data_3=R8;
		4'b1001:read_data_3=R9;
		4'b1010:read_data_3=R10;
		4'b1011:read_data_3=R11;
		4'b1100:read_data_3=R12;
		4'b1101:read_data_3=R13;
		4'b1110:read_data_3=R14;
		4'b1111:read_data_3=pc_content;
		default:read_data_3=R0;
		endcase
	end
endmodule
		