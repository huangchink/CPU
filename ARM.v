`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:42:07 05/26/2014 
// Design Name: 
// Module Name:    ARM2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//    
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ARM(clk,rst
    );
	input clk,rst; 
	
	//register
	reg [31:0]pc;
	reg [3:0]nzcv;
	
	//wire
	wire [31:0]pc_add_4, mem_read_data, instruction,write_data,read_data_1,read_data_2,read_data_3,sign_immediate_out,rotate_immediate_out,unsign_immediate_out,alu_out,pc_branch,shift_out,pc_next,alu_operation_2;
	wire reg_write,link,pc_write,mem_to_reg,pc_src,mem_write,update_nzcv;
	wire [1:0]alu_src;
	wire [3:0]alu_op,alu_nzcv;
	//adder
	
	
	adder_32bit _adder_32bit(.pc(pc),.pc_add_4(pc_add_4));
	
	ins_mem _ins_mem( .pc(pc), .ins(instruction) );
	
	mux _mux(.mem_to_reg(mem_to_reg),.mem_read_data(mem_read_data),.alu_out(alu_out),.reg_write_data(write_data));
	
	register_file _register_file(.clk(clk), .rst(rst), .reg_write(reg_write), .link(link), .read_addr_1(instruction[19:16]), .read_addr_2(instruction[3:0]), .read_addr_3(instruction[15:12]), .write_addr(instruction[15:12]), .write_data(write_data), .pc_content(pc_add_4),.pc_write(pc_write), .read_data_1(read_data_1), .read_data_2(read_data_2),.read_data_3(read_data_3));
						
	shift  _shift(.shift_type(instruction[6:5]),.shift_number(instruction[11:7]),.reg_data(read_data_2),.shift_out(shift_out));
	
	mux2 _mux2(.alu_src(alu_src),.unsign_extend_out(unsign_immediate_out),.shift_out(shift_out),.rorate_out(rotate_immediate_out),.alu_operation_2(alu_operation_2));
						
	multi_4_and_sign_extend _multi_4_and_sign_extend(.sign_immediate_in(instruction[23:0]),.sign_immediate_out(sign_immediate_out));
	
	adder_32bit1 _adder_32bit1(.sign_extend_out(sign_immediate_out),.pc_add_4(pc_add_4),.pc_branch(pc_branch));
	
	mux1 _mux1(.pc_write(pc_write), .pc_src(pc_src),.pc_add_4(pc_add_4),.pc_branch(pc_branch),.alu_out(alu_out),.pc_next(pc_next));
	 
	rotate _rotate(.immediate_in(instruction[11:0]),.rotate_immediate_out(rotate_immediate_out));
	
	unsign_extend _unsign_extend(.unsign_immediate_in(instruction[11:0]), .unsign_immediate_out(unsign_immediate_out));
	
	alu _alu(.source_1(read_data_1), .source_2(alu_operation_2),.alu_op(alu_op),.c_in(nzcv[1]),.nzcv(alu_nzcv),.alu_out(alu_out)); ////cin????
	
	controller _controller(.nzcv(nzcv),.opfunc(instruction[31:20]),.reg_write(reg_write),.mem_to_reg(mem_to_reg),.mem_write(mem_write),.pc_src(pc_src),.update_nzcv(update_nzcv),.link(link),.alu_src(alu_src),.alu_op(alu_op));
	
	data_mem _data_mem( .clk(clk), .rst(rst), .addr(alu_out), .write_data(read_data_3), .mem_write(mem_write), .read_data(mem_read_data));
	
	
	always@(posedge clk or posedge rst)
	begin
		if( rst == 1'b1 )
			pc = 32'd0;
		else
			pc = pc_next;
	end
	
	always@(posedge clk or posedge rst)
	begin
	if(rst)
		nzcv=4'b0;
	else begin
		if(update_nzcv)
			nzcv=alu_nzcv;
		end
	
	end
	
	


endmodule
