`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:52:08 03/16/2017 
// Design Name: 
// Module Name:    MBR_001 
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
module MBR_001(CON,CLK,RAM_IN,MBR_OUT,ACC_IN,R_W,RST);

	input CLK,RST;
	input [15:0] RAM_IN,ACC_IN;
	input [31:0] CON;
	output reg[15:0] MBR_OUT;
	output reg R_W;
	
	initial
		begin
		R_W <= 0;
		MBR_OUT <= 0;		
	end

	always@(posedge CLK or posedge RST)
		begin
		if(RST)
			begin
			R_W <= 0;
			MBR_OUT <= 0;
		end
		
		else
			begin
			if(CON[4])
				begin
				MBR_OUT <= RAM_IN;
				R_W <= 0;
			end
			else;
			if(CON[11])
				begin
				MBR_OUT <= ACC_IN;
				R_W <= 0;
			end
			else;
			if(CON[12])
				begin
				//MBR_OUT <= ACC_IN;
				R_W <= 1;
			end
			else;					
		end
	end
endmodule
