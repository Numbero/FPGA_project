`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:21:48 03/25/2017 
// Design Name: 
// Module Name:    Contorl_Uint_003 
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
module Contorl_Uint_003(CLK,zflag,IR,CBR,RST);
	input CLK,zflag,RST;
	input [7:0]IR;
	output [31:0]CBR;
	
	wire [7:0]CAR;
	wire [31:0]ROM;
	wire [31:0]CBR_CBR;
	
	reg [31:0]DATA;
	reg R_W;
	
	initial 
		begin
		DATA <= 0;
		R_W <= 0;
	end

	CU_001 cu(.CLK(CLK),
				 .IR(IR),
				 .CAR(CAR),
				 .CBR(CBR_CBR),
				 .ROM(ROM),
				 .zflag(zflag),
				 .RST(RST));
	
						  
	Contorl_Memory_002 cm_1(.a(CAR),
									.d(DATA),
									.clk(CLK),
									.we(R_W),
									.spo(ROM));
					  
	assign CBR = CBR_CBR;

endmodule
