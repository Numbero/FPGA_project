`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:04:51 03/16/2017 
// Design Name: 
// Module Name:    BR_001 
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
module BR_001(CON,CLK,MBR_IN,BR_OUT,RST);

	input CLK,RST;
	input[15:0] MBR_IN;
	input[31:0] CON;
	output reg[15:0] BR_OUT;

	initial
		begin
		BR_OUT <= 0;
	end
	always@(posedge CLK or posedge RST)
	begin
		if(RST)
			begin
			BR_OUT <= 0;
		end
		else
			begin
			if(CON[5])
				BR_OUT<=MBR_IN;
			else;
		end		
	end
endmodule
