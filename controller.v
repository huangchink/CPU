module controller(nzcv,opfunc,reg_write,mem_to_reg,mem_write,pc_src,update_nzcv,link,alu_src,alu_op);


input [3:0]nzcv;
input [11:0]opfunc;

output [0:0]reg_write,mem_to_reg,mem_write,pc_src,update_nzcv,link;
output [1:0]alu_src;
output [3:0]alu_op;

reg [0:0]reg_write,mem_to_reg,mem_write,pc_src,update_nzcv,link;
reg [1:0]alu_src;
reg [3:0]alu_op;

parameter branch_type=8'b101xxxxx;
parameter data_process_type=8'b00xxxxxx;
parameter data_transfer_type=8'b01xxxxxx;


always@(*)begin
	case(opfunc[11:8])
	4'b0000: if(nzcv[2]==1)begin
				casex(opfunc[7:0])
				branch_type:begin
					reg_write=1'b0;
					alu_src=2'b00;
					alu_op=4'b0000;
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b1;
					update_nzcv=1'b0;
					link=opfunc[4];
					end
				data_process_type:begin
					if(opfunc[4:1]==1000||opfunc[4:1]==1010||opfunc[4:1]==1011) reg_write=1'b0;
					else reg_write=1'b1;
					if(opfunc[5]==1'b0) alu_src=2'b00;
					else alu_src=2'b01;
					alu_op=opfunc[4:1];
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b0;
					update_nzcv=opfunc[0];
					link=1'b0;
					end
				data_transfer_type:begin
					reg_write=opfunc[0];
					if(opfunc[5]==1'b1) alu_src=2'b10;
					else alu_src=2'b11;
					if(opfunc[3]==1'b1) alu_op=4'b0100;
					else alu_op=4'b0010;
					mem_to_reg=1'b1;
					mem_write=~opfunc[0];
					pc_src=1'b0;
					update_nzcv=1'b0;
					link=1'b0;
					end
				endcase
				end
				
				
				else begin
				reg_write=1'b0;
				alu_src=2'b00;
				alu_op=4'b0000;
				mem_to_reg=1'b0;
				mem_write=1'b0;
				pc_src=1'b1;
				update_nzcv=1'b0;
				link=0;
				end
				
				
				
				
	4'b0001: if(nzcv[2]==0)begin
				casex(opfunc[7:0])
				branch_type:begin
					reg_write=1'b0;
					alu_src=2'b00;
					alu_op=4'b0000;
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b1;
					update_nzcv=1'b0;
					link=opfunc[4];
					end
				data_process_type:begin
					if(opfunc[4:1]==1000||opfunc[4:1]==1010||opfunc[4:1]==1011) reg_write=1'b0;
					else reg_write=1'b1;
					if(opfunc[5]==1'b0) alu_src=2'b00;
					else alu_src=2'b01;
					alu_op=opfunc[4:1];
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b0;
					update_nzcv=opfunc[0];
					link=1'b0;
					end
				data_transfer_type:begin
					reg_write=opfunc[0];
					if(opfunc[5]==1'b1) alu_src=2'b10;
					else alu_src=2'b11;
					if(opfunc[3]==1'b1) alu_op=4'b0100;
					else alu_op=4'b0010;
					mem_to_reg=1'b1;
					mem_write=~opfunc[0];
					pc_src=1'b0;
					update_nzcv=1'b0;
					link=1'b0;
					end
				endcase
				end
				
				
				else begin
				reg_write=1'b0;
				alu_src=2'b00;
				alu_op=4'b0000;
				mem_to_reg=1'b0;
				mem_write=1'b0;
				pc_src=1'b0;
				update_nzcv=1'b0;
				link=0;
				end
				
				
				
				
	4'b0010: if(nzcv[1]==1)begin
				casex(opfunc[7:0])
				branch_type:begin
					reg_write=1'b0;
					alu_src=2'b00;
					alu_op=4'b0000;
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b1;
					update_nzcv=1'b0;
					link=opfunc[4];
					end
				data_process_type:begin
					if(opfunc[4:1]==1000||opfunc[4:1]==1010||opfunc[4:1]==1011) reg_write=1'b0;
					else reg_write=1'b1;
					if(opfunc[5]==1'b0) alu_src=2'b00;
					else alu_src=2'b01;
					alu_op=opfunc[4:1];
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b0;
					update_nzcv=opfunc[0];
					link=1'b0;
					end
				data_transfer_type:begin
					reg_write=opfunc[0];
					if(opfunc[5]==1'b1) alu_src=2'b10;
					else alu_src=2'b11;
					if(opfunc[3]==1'b1) alu_op=4'b0100;
					else alu_op=4'b0010;
					mem_to_reg=1'b1;
					mem_write=~opfunc[0];
					pc_src=1'b0;
					update_nzcv=1'b0;
					link=1'b0;
					end
				endcase
				end
				
				
				else begin
				reg_write=1'b0;
				alu_src=2'b00;
				alu_op=4'b0000;
				mem_to_reg=1'b0;
				mem_write=1'b0;
				pc_src=1'b1;
				update_nzcv=1'b0;
				link=0;
				end
				
				
				
				
	4'b0011: if(nzcv[1]==0)begin
				casex(opfunc[7:0])
				branch_type:begin
					reg_write=1'b0;
					alu_src=2'b00;
					alu_op=4'b0000;
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b1;
					update_nzcv=1'b0;
					link=opfunc[4];
					end
				data_process_type:begin
					if(opfunc[4:1]==1000||opfunc[4:1]==1010||opfunc[4:1]==1011) reg_write=1'b0;
					else reg_write=1'b1;
					if(opfunc[5]==1'b0) alu_src=2'b00;
					else alu_src=2'b01;
					alu_op=opfunc[4:1];
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b0;
					update_nzcv=opfunc[0];
					link=1'b0;
					end
				data_transfer_type:begin
					reg_write=opfunc[0];
					if(opfunc[5]==1'b1) alu_src=2'b10;
					else alu_src=2'b11;
					if(opfunc[3]==1'b1) alu_op=4'b0100;
					else alu_op=4'b0010;
					mem_to_reg=1'b1;
					mem_write=~opfunc[0];
					pc_src=1'b0;
					update_nzcv=1'b0;
					link=1'b0;
					end
				endcase
				end
				
				
				else begin
				reg_write=1'b0;
				alu_src=2'b00;
				alu_op=4'b0000;
				mem_to_reg=1'b0;
				mem_write=1'b0;
				pc_src=1'b1;
				update_nzcv=1'b0;
				link=0;
				end
				
				
				
				
	4'b0100: if(nzcv[3]==1)begin
				casex(opfunc[7:0])
				branch_type:begin
					reg_write=1'b0;
					alu_src=2'b00;
					alu_op=4'b0000;
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b1;
					update_nzcv=1'b0;
					link=opfunc[4];
					end
				data_process_type:begin
					if(opfunc[4:1]==1000||opfunc[4:1]==1010||opfunc[4:1]==1011) reg_write=1'b0;
					else reg_write=1'b1;
					if(opfunc[5]==1'b0) alu_src=2'b00;
					else alu_src=2'b01;
					alu_op=opfunc[4:1];
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b0;
					update_nzcv=opfunc[0];
					link=1'b0;
					end
				data_transfer_type:begin
					reg_write=opfunc[0];
					if(opfunc[5]==1'b1) alu_src=2'b10;
					else alu_src=2'b11;
					if(opfunc[3]==1'b1) alu_op=4'b0100;
					else alu_op=4'b0010;
					mem_to_reg=1'b1;
					mem_write=~opfunc[0];
					pc_src=1'b0;
					update_nzcv=1'b0;
					link=1'b0;
					end
				endcase
				end
				
				
				else begin
				reg_write=1'b0;
				alu_src=2'b00;
				alu_op=4'b0000;
				mem_to_reg=1'b0;
				mem_write=1'b0;
				pc_src=1'b1;
				update_nzcv=1'b0;
				link=0;
				end
				
				
				
				
	4'b0101: if(nzcv[3]==0)begin
				casex(opfunc[7:0])
				branch_type:begin
					reg_write=1'b0;
					alu_src=2'b00;
					alu_op=4'b0000;
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b1;
					update_nzcv=1'b0;
					link=opfunc[4];
					end
				data_process_type:begin
					if(opfunc[4:1]==1000||opfunc[4:1]==1010||opfunc[4:1]==1011) reg_write=1'b0;
					else reg_write=1'b1;
					if(opfunc[5]==1'b0) alu_src=2'b00;
					else alu_src=2'b01;
					alu_op=opfunc[4:1];
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b0;
					update_nzcv=opfunc[0];
					link=1'b0;
					end
				data_transfer_type:begin
					reg_write=opfunc[0];
					if(opfunc[5]==1'b1) alu_src=2'b10;
					else alu_src=2'b11;
					if(opfunc[3]==1'b1) alu_op=4'b0100;
					else alu_op=4'b0010;
					mem_to_reg=1'b1;
					mem_write=~opfunc[0];
					pc_src=1'b0;
					update_nzcv=1'b0;
					link=1'b0;
					end
				endcase
				end
				
				
				else begin
				reg_write=1'b0;
				alu_src=2'b00;
				alu_op=4'b0000;
				mem_to_reg=1'b0;
				mem_write=1'b0;
				pc_src=1'b1;
				update_nzcv=1'b0;
				link=0;
				end
				
				
				
				
	4'b0110: if(nzcv[0]==1)begin
				casex(opfunc[7:0])
				branch_type:begin
					reg_write=1'b0;
					alu_src=2'b00;
					alu_op=4'b0000;
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b1;
					update_nzcv=1'b0;
					link=opfunc[4];
					end
				data_process_type:begin
					if(opfunc[4:1]==1000||opfunc[4:1]==1010||opfunc[4:1]==1011) reg_write=1'b0;
					else reg_write=1'b1;
					if(opfunc[5]==1'b0) alu_src=2'b00;
					else alu_src=2'b01;
					alu_op=opfunc[4:1];
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b0;
					update_nzcv=opfunc[0];
					link=1'b0;
					end
				data_transfer_type:begin
					reg_write=opfunc[0];
					if(opfunc[5]==1'b1) alu_src=2'b10;
					else alu_src=2'b11;
					if(opfunc[3]==1'b1) alu_op=4'b0100;
					else alu_op=4'b0010;
					mem_to_reg=1'b1;
					mem_write=~opfunc[0];
					pc_src=1'b0;
					update_nzcv=1'b0;
					link=1'b0;
					end
				endcase
				end
				
				else begin
				reg_write=1'b0;
				alu_src=2'b00;
				alu_op=4'b0000;
				mem_to_reg=1'b0;
				mem_write=1'b0;
				pc_src=1'b1;
				update_nzcv=1'b0;
				link=0;
				end
				
				
				
				
	4'b0111: if(nzcv[0]==0)begin
				casex(opfunc[7:0])
				branch_type:begin
					reg_write=1'b0;
					alu_src=2'b00;
					alu_op=4'b0000;
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b1;
					update_nzcv=1'b0;
					link=opfunc[4];
					end
				data_process_type:begin
					if(opfunc[4:1]==1000||opfunc[4:1]==1010||opfunc[4:1]==1011) reg_write=1'b0;
					else reg_write=1'b1;
					if(opfunc[5]==1'b0) alu_src=2'b00;
					else alu_src=2'b01;
					alu_op=opfunc[4:1];
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b0;
					update_nzcv=opfunc[0];
					link=1'b0;
					end
				data_transfer_type:begin
					reg_write=opfunc[0];
					if(opfunc[5]==1'b1) alu_src=2'b10;
					else alu_src=2'b11;
					if(opfunc[3]==1'b1) alu_op=4'b0100;
					else alu_op=4'b0010;
					mem_to_reg=1'b1;
					mem_write=~opfunc[0];
					pc_src=1'b0;
					update_nzcv=1'b0;
					link=1'b0;
					end
				endcase
				end
				
				else begin
				reg_write=1'b0;
				alu_src=2'b00;
				alu_op=4'b0000;
				mem_to_reg=1'b0;
				mem_write=1'b0;
				pc_src=1'b1;
				update_nzcv=1'b0;
				link=0;
				end
				
				
				
				
	4'b1000: if(nzcv[1]==1&&nzcv[2]==0)begin
				casex(opfunc[7:0])
				branch_type:begin
					reg_write=1'b0;
					alu_src=2'b00;
					alu_op=4'b0000;
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b1;
					update_nzcv=1'b0;
					link=opfunc[4];
					end
				data_process_type:begin
					if(opfunc[4:1]==1000||opfunc[4:1]==1010||opfunc[4:1]==1011) reg_write=1'b0;
					else reg_write=1'b1;
					if(opfunc[5]==1'b0) alu_src=2'b00;
					else alu_src=2'b01;
					alu_op=opfunc[4:1];
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b0;
					update_nzcv=opfunc[0];
					link=1'b0;
					end
				data_transfer_type:begin
					reg_write=opfunc[0];
					if(opfunc[5]==1'b1) alu_src=2'b10;
					else alu_src=2'b11;
					if(opfunc[3]==1'b1) alu_op=4'b0100;
					else alu_op=4'b0010;
					mem_to_reg=1'b1;
					mem_write=~opfunc[0];
					pc_src=1'b0;
					update_nzcv=1'b0;
					link=1'b0;
					end
				endcase
				end
				
				else begin
				reg_write=1'b0;
				alu_src=2'b00;
				alu_op=4'b0000;
				mem_to_reg=1'b0;
				mem_write=1'b0;
				pc_src=1'b1;
				update_nzcv=1'b0;
				link=0;
				end
				
				
				
				
	4'b1001: if(nzcv[2]==1||nzcv[1]==0)begin
				casex(opfunc[7:0])
				branch_type:begin
					reg_write=1'b0;
					alu_src=2'b00;
					alu_op=4'b0000;
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b1;
					update_nzcv=1'b0;
					link=opfunc[4];
					end
				data_process_type:begin
					if(opfunc[4:1]==1000||opfunc[4:1]==1010||opfunc[4:1]==1011) reg_write=1'b0;
					else reg_write=1'b1;
					if(opfunc[5]==1'b0) alu_src=2'b00;
					else alu_src=2'b01;
					alu_op=opfunc[4:1];
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b0;
					update_nzcv=opfunc[0];
					link=1'b0;
					end
				data_transfer_type:begin
					reg_write=opfunc[0];
					if(opfunc[5]==1'b1) alu_src=2'b10;
					else alu_src=2'b11;
					if(opfunc[3]==1'b1) alu_op=4'b0100;
					else alu_op=4'b0010;
					mem_to_reg=1'b1;
					mem_write=~opfunc[0];
					pc_src=1'b0;
					update_nzcv=1'b0;
					link=1'b0;
					end
				endcase
				end
				
				
				else begin
				reg_write=1'b0;
				alu_src=2'b00;
				alu_op=4'b0000;
				mem_to_reg=1'b0;
				mem_write=1'b0;
				pc_src=1'b1;
				update_nzcv=1'b0;
				link=0;
				end
				
				
				
				
	4'b1010: if(nzcv[3]==nzcv[0])begin
				casex(opfunc[7:0])
				branch_type:begin
					reg_write=1'b0;
					alu_src=2'b00;
					alu_op=4'b0000;
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b1;
					update_nzcv=1'b0;
					link=opfunc[4];
					end
				data_process_type:begin
					if(opfunc[4:1]==1000||opfunc[4:1]==1010||opfunc[4:1]==1011) reg_write=1'b0;
					else reg_write=1'b1;
					if(opfunc[5]==1'b0) alu_src=2'b00;
					else alu_src=2'b01;
					alu_op=opfunc[4:1];
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b0;
					update_nzcv=opfunc[0];
					link=1'b0;
					end
				data_transfer_type:begin
					reg_write=opfunc[0];
					if(opfunc[5]==1'b1) alu_src=2'b10;
					else alu_src=2'b11;
					if(opfunc[3]==1'b1) alu_op=4'b0100;
					else alu_op=4'b0010;
					mem_to_reg=1'b1;
					mem_write=~opfunc[0];
					pc_src=1'b0;
					update_nzcv=1'b0;
					link=1'b0;
					end
				endcase
				end
				
				
				else begin
				reg_write=1'b0;
				alu_src=2'b00;
				alu_op=4'b0000;
				mem_to_reg=1'b0;
				mem_write=1'b0;
				pc_src=1'b1;
				update_nzcv=1'b0;
				link=0;
				end
				
				
				
				
	4'b1011: if(nzcv[3]!=nzcv[0])begin
				casex(opfunc[7:0])
				branch_type:begin
					reg_write=1'b0;
					alu_src=2'b00;
					alu_op=4'b0000;
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b1;
					update_nzcv=1'b0;
					link=opfunc[4];
					end
				data_process_type:begin
					if(opfunc[4:1]==1000||opfunc[4:1]==1010||opfunc[4:1]==1011) reg_write=1'b0;
					else reg_write=1'b1;
					if(opfunc[5]==1'b0) alu_src=2'b00;
					else alu_src=2'b01;
					alu_op=opfunc[4:1];
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b0;
					update_nzcv=opfunc[0];
					link=1'b0;
					end
				data_transfer_type:begin
					reg_write=opfunc[0];
					if(opfunc[5]==1'b1) alu_src=2'b10;
					else alu_src=2'b11;
					if(opfunc[3]==1'b1) alu_op=4'b0100;
					else alu_op=4'b0010;
					mem_to_reg=1'b1;
					mem_write=~opfunc[0];
					pc_src=1'b0;
					update_nzcv=1'b0;
					link=1'b0;
					end
				endcase
				end
				
				
				else begin
				reg_write=1'b0;
				alu_src=2'b00;
				alu_op=4'b0000;
				mem_to_reg=1'b0;
				mem_write=1'b0;
				pc_src=1'b1;
				update_nzcv=1'b0;
				link=0;
				end
				
				
				
				
	4'b1100: if(nzcv[2]==0&&nzcv[3]==nzcv[0])begin
				casex(opfunc[7:0])
				branch_type:begin
					reg_write=1'b0;
					alu_src=2'b00;
					alu_op=4'b0000;
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b1;
					update_nzcv=1'b0;
					link=opfunc[4];
					end
				data_process_type:begin
					if(opfunc[4:1]==1000||opfunc[4:1]==1010||opfunc[4:1]==1011) reg_write=1'b0;
					else reg_write=1'b1;
					if(opfunc[5]==1'b0) alu_src=2'b00;
					else alu_src=2'b01;
					alu_op=opfunc[4:1];
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b0;
					update_nzcv=opfunc[0];
					link=1'b0;
					end
				data_transfer_type:begin
					reg_write=opfunc[0];
					if(opfunc[5]==1'b1) alu_src=2'b10;
					else alu_src=2'b11;
					if(opfunc[3]==1'b1) alu_op=4'b0100;
					else alu_op=4'b0010;
					mem_to_reg=1'b1;
					mem_write=~opfunc[0];
					pc_src=1'b0;
					update_nzcv=1'b0;
					link=1'b0;
					end
				endcase
				end
				
				
				else begin
				reg_write=1'b0;
				alu_src=2'b00;
				alu_op=4'b0000;
				mem_to_reg=1'b0;
				mem_write=1'b0;
				pc_src=1'b1;
				update_nzcv=1'b0;
				link=0;
				end
				
				
				
				
	4'b1101: if(nzcv[2]==0||nzcv[2]==1||nzcv[3]!=nzcv[0])begin
				casex(opfunc[7:0])
				branch_type:begin
					reg_write=1'b0;
					alu_src=2'b00;
					alu_op=4'b0000;
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b1;
					update_nzcv=1'b0;
					link=opfunc[4];
					end
				data_process_type:begin
					if(opfunc[4:1]==1000||opfunc[4:1]==1010||opfunc[4:1]==1011) reg_write=1'b0;
					else reg_write=1'b1;
					if(opfunc[5]==1'b0) alu_src=2'b00;
					else alu_src=2'b01;
					alu_op=opfunc[4:1];
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b0;
					update_nzcv=opfunc[0];
					link=1'b0;
					end
				data_transfer_type:begin
					reg_write=opfunc[0];
					if(opfunc[5]==1'b1) alu_src=2'b10;
					else alu_src=2'b11;
					if(opfunc[3]==1'b1) alu_op=4'b0100;
					else alu_op=4'b0010;
					mem_to_reg=1'b1;
					mem_write=~opfunc[0];
					pc_src=1'b0;
					update_nzcv=1'b0;
					link=1'b0;
					end
				endcase
				end
				
				
				else begin
				reg_write=1'b0;
				alu_src=2'b00;
				alu_op=4'b0000;
				mem_to_reg=1'b0;
				mem_write=1'b0;
				pc_src=1'b1;
				update_nzcv=1'b0;
				link=0;
				end
				
				
				
				
	4'b1110: 
				casex(opfunc[7:0])
				branch_type:begin
					reg_write=1'b0;
					alu_src=2'b00;
					alu_op=4'b0000;
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b1;
					update_nzcv=1'b0;
					link=opfunc[4];
					end
				data_process_type:begin
					if(opfunc[4:1]==1000||opfunc[4:1]==1010||opfunc[4:1]==1011) reg_write=1'b0;
					else reg_write=1'b1;
					if(opfunc[5]==1'b0) alu_src=2'b00;
					else alu_src=2'b01;
					alu_op=opfunc[4:1];
					mem_to_reg=1'b0;
					mem_write=1'b0;
					pc_src=1'b0;
					update_nzcv=opfunc[0];
					link=1'b0;
					end
				data_transfer_type:begin
					reg_write=opfunc[0];
					if(opfunc[5]==1'b1) alu_src=2'b10;
					else alu_src=2'b11;
					if(opfunc[3]==1'b1) alu_op=4'b0100;
					else alu_op=4'b0010;
					mem_to_reg=1'b1;
					mem_write=~opfunc[0];
					pc_src=1'b0;
					update_nzcv=1'b0;
					link=1'b0;
					end
				endcase
	default:	begin
				reg_write=1'b0;
				alu_src=2'b00;
				alu_op=4'b0000;
				mem_to_reg=1'b0;
				mem_write=1'b0;
				pc_src=1'b1;
				update_nzcv=1'b0;
				link=0;
				end
	endcase
end

endmodule