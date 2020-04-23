`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:07:08 03/16/2017 
// Design Name: 
// Module Name:    ALU_001 
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
module ALU_001(ACC_IN,BR_IN,ALU_OUT,CON,CLK,zflag,RST);

	input CLK,RST;
	input signed[15:0] BR_IN,ACC_IN;
	input [31:0] CON;
	output reg zflag;
	output reg [15:0] ALU_OUT;

	initial
		begin
		ALU_OUT <= 0;
		zflag <= 0;
	end

	always@(posedge CLK or posedge RST)
		begin
		if(RST)
			begin
			ALU_OUT = 0;
			zflag = 0;
		end
		else
			begin
			if(CON[6]&&CON[7])
				begin
				case(CON[19:16])
					4'b0000:	ALU_OUT = ACC_IN + BR_IN;
					4'b0001:	ALU_OUT = ACC_IN - BR_IN;
					4'b0010:	ALU_OUT = ACC_IN * BR_IN;
					4'b0011:	ALU_OUT = ACC_IN / BR_IN;
					4'b0100:	ALU_OUT = ACC_IN & BR_IN;
					4'b0101:	ALU_OUT = ACC_IN | BR_IN;
					4'b0110:	ALU_OUT = ~BR_IN ;
					4'b0111:	ALU_OUT = BR_IN;
					4'b1000:	ALU_OUT = ACC_IN << 1;
					4'b1001:	ALU_OUT = ACC_IN >> 1;
					//4'b1010:	ALU_OUT = BR_IN + 1;
					//4'b1011:	ALU_OUT = BR_IN - 1;
					default:;
				endcase
				if(ALU_OUT==0)
					zflag = 1;
				else
					zflag = 0;
			end
			else;
		end		
	end
endmodule
