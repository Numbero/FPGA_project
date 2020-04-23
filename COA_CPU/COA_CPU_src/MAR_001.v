`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:56:11 03/16/2017 
// Design Name: 
// Module Name:    MAR_001 
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
module MAR_001(CON,CLK,MBR_IN,MAR_OUT,PC_IN,RST);

	input CLK,RST;
	input [7:0] PC_IN;
	input [15:0] MBR_IN;
	input [31:0] CON;
	output reg [7:0] MAR_OUT;
	
	initial 
		begin
		MAR_OUT = 0;
	end

	always@(posedge CLK or posedge RST)
		begin
		if(RST)
			begin
			MAR_OUT <= 0;
		end
		else
			begin
			if(CON[8])
				MAR_OUT <= MBR_IN[7:0];
			else;
			if(CON[1])
				MAR_OUT <= PC_IN;
			else;
		end
	end
endmodule
