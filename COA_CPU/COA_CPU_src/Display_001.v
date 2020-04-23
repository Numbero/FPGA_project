`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:27:49 03/23/2017 
// Design Name: 
// Module Name:    Display_001 
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
module Display_001(CLK,DIN,CS,DIS,RST);

	input CLK,RST;
	input [15:0]DIN;
	output reg [7:0]DIS;
	output reg [3:0]CS;
	
	reg [1:0] STAT;
	reg [3:0] temp;
	
	initial
		begin
		DIS <= 0;
		STAT <= CS_1;
	end
	
	parameter 
		CS_1 = 2'b00,
		CS_2 = 2'b01,
		CS_3 = 2'b10,
		CS_4 = 2'b11;
	
	always @ (posedge CLK or posedge RST)
		begin
		if(RST)
			begin
			DIS = 0;
			STAT = CS_1;
			CS = 4'b1111;
		end
		else
			begin
			case(STAT)
				CS_1: begin CS = 4'b1110; temp = DIN[3:0];end
				CS_2: begin CS = 4'b1101; temp = DIN[7:4];end
				CS_3: begin CS = 4'b1011; temp = DIN[11:8];end
				CS_4: begin CS = 4'b0111; temp = DIN[15:12];end
				default:;
			endcase
			case(temp)
				4'b0000 : DIS =8'b11000000;
				4'b0001 : DIS =8'b11111001;
				4'b0010 : DIS =8'b10100100;
				4'b0011 : DIS =8'b10110000;
				
				4'b0100 : DIS =8'b10011001;
				4'b0101 : DIS =8'b10010010;
				4'b0110 : DIS =8'b10000010;
				4'b0111 : DIS =8'b11111000;
				
				4'b1000 : DIS =8'b10000000;
				4'b1001 : DIS =8'b10010000;
				4'b1010 : DIS =8'b10001000;
				4'b1011 : DIS =8'b10000011;
				
				4'b1100 : DIS =8'b11000110;
				4'b1101 : DIS =8'b10100001;
				4'b1110 : DIS =8'b10000110;
				4'b1111 : DIS =8'b10001110;
				
				default : DIS =0;
			endcase			
			STAT = STAT + 1;						
		end		
	end
endmodule
