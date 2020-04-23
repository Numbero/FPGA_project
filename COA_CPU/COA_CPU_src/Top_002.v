`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:55:45 03/22/2017 
// Design Name: 
// Module Name:    Top_002 
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
module Top_002(CLK,RST,Data,Dis,Cs,LED);
	input CLK,RST;
	input [7:0]Data;
	output [7:0]Dis;
	output [3:0]Cs;
	output reg [7:0]LED;
	
	wire [15:0]MBR_OUT,RAM_DATA,ACC_OUT,ALU_OUT,BR_OUT;
	wire R_W,flag,CLK_10K;
	wire [31:0]CON;
	wire [7:0]MAR_OUT,PC_OUT,IR_OUT;
	wire [15:0]Dout;
		
		
	always@ (posedge CLK)	//提示当前拨码开关状态
		begin
		LED <= Data;
	end


	divide_to_100k_CLK divider(.CIN(CLK),
										.COUT(CLK_10K));
	
	MBR_001 mbr(.CON(CON),
					.CLK(CLK_10K),
					.RAM_IN(RAM_DATA),
					.MBR_OUT(MBR_OUT),
					.ACC_IN(ACC_OUT),
					.R_W(R_W),
					.RST(RST));
					
	MAR_001 mar(.CON(CON),
					.CLK(CLK_10K),
					.MBR_IN(MBR_OUT),
					.MAR_OUT(MAR_OUT),
					.PC_IN(PC_OUT),
					.RST(RST));
					
	Main_Memory_1 main_memory(.Address(MAR_OUT),
									  .Dout(RAM_DATA),
									  .CLK(CLK_10K),
									  .R_W(R_W),
									  .Din(MBR_OUT),
								     .Dis(Dout),
									  .DATA(Data),
									  .RST(RST));	

	Display_001 display(.CLK(CLK_10K),
							  .DIN(Dout),
							  .CS(Cs),
							  .DIS(Dis),
							  .RST(RST));

	PC_001 pc(.CLK(CLK_10K),
				 .MBR_IN(MBR_OUT),
				 .PC_OUT(PC_OUT),
				 .CON(CON),
				 .RST(RST));
				 
	ACC_001 acc(.CON(CON),
					.CLK(CLK_10K),
					.ALU_IN(ALU_OUT),
					.ACC_OUT(ACC_OUT),
					.RST(RST));
					
	ALU_001 alu(.ACC_IN(ACC_OUT),
					.BR_IN(BR_OUT),
					.ALU_OUT(ALU_OUT),
					.CON(CON),
					.CLK(CLK_10K),
					.zflag(flag),
					.RST(RST));
					
	IR_001 ir(.CLK(CLK_10K),
				 .CON(CON),
				 .MBR_IN(MBR_OUT),
				 .IR_OUT(IR_OUT),
				 .RST(RST));
				 
	BR_001 br(.CON(CON),
				 .CLK(CLK_10K),
				 .MBR_IN(MBR_OUT),
				 .BR_OUT(BR_OUT),
				 .RST(RST));
					
	Contorl_Uint_003 contorl_unit(.CLK(CLK_10K),
											.zflag(flag),
											.IR(IR_OUT),
											.CBR(CON),
											.RST(RST));
					

endmodule
