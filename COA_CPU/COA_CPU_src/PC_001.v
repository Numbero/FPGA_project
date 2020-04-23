`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:59:16 03/16/2017 
// Design Name: 
// Module Name:    PC_001 
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
module PC_001(CLK,MBR_IN,PC_OUT,CON,RST);
	input CLK,RST;
	input[15:0] MBR_IN;
	input[31:0] CON;
	output reg [7:0] PC_OUT;
	
	initial 
		begin
		PC_OUT <= 0;
	end

	always@(posedge CLK or posedge RST)
		begin
		if(RST)
			begin
			PC_OUT <= 0;
		end
		else
			begin
			if(CON[14])
				PC_OUT <= PC_OUT + 1;
			else;
			if(CON[2])
				PC_OUT <= MBR_IN[7:0];
			else;
		end
	end
endmodule
