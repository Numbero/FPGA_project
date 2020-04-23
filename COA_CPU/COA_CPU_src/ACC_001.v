`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:05:46 03/16/2017 
// Design Name: 
// Module Name:    ACC_001 
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
module ACC_001(CON,CLK,ALU_IN,ACC_OUT,RST);

	input CLK,RST;
	input[15:0] ALU_IN;
	input[31:0] CON;
	output reg[15:0] ACC_OUT;
	
	initial
		begin
		ACC_OUT <= 0;
	end

	always@(posedge CLK or posedge RST)
		begin
		if(RST)
			begin
			ACC_OUT <= 0;
		end
		else
			begin
			if(CON[9])
				ACC_OUT <= ALU_IN;
			else;
		end
	end
endmodule
