`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:01:13 03/16/2017 
// Design Name: 
// Module Name:    IR_001 
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
module IR_001(CLK,CON,MBR_IN,IR_OUT,RST);

	input CLK,RST;
	input[15:0] MBR_IN;
	input[31:0] CON;
	output reg [7:0] IR_OUT;
	
	initial
		begin
		IR_OUT <= 0;
	end

	always@(negedge CLK or posedge RST)
		begin
		if(RST)
			begin
			IR_OUT <= 0;
		end
		else
			begin
			if(CON[3])
			IR_OUT <= MBR_IN[15:8];
			else;
		end
	end
endmodule
