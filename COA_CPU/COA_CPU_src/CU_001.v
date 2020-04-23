`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:08:49 03/16/2017 
// Design Name: 
// Module Name:    CU_001 
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
module CU_001(CLK,IR,CAR,CBR,ROM,zflag,RST);

	input CLK,zflag,RST;
	input [7:0] IR;
	input [31:0] ROM;
	output reg [7:0] CAR;
	output reg [31:0] CBR;  //CBR[31:24]---CAR
									//CBR[22:20]---mux
									//CBR[19:16]---ALU
									//CBR[14:0] ---micro-operation

	
	initial
		begin
		CAR <= 8'h00;
		CBR <= 32'h0000_0010;
	end
	
	
	parameter	STORE	= 8'b0000_0001,
				LOAD  	= 8'b0000_0010,
				ADD		= 8'b0000_0011,		
				SUB		= 8'b0000_0100,
				JMPGEZ	= 8'b0000_0101,
				JMP		= 8'b0000_0110,
				HALT	   = 8'b0000_0111,
				MPY		= 8'b0000_1000,
				DIV		= 8'b0000_1001,		
				AND		= 8'b0000_1010,		//AND--0A
				OR		   = 8'b0000_1011,		//OR --0B
				NOT		= 8'b0000_1100,		//NOT--0C
				SHR		= 8'b0000_1101,		//SHR--OD
				SHL		= 8'b0000_1110,		//SHL--0E
				INC		= 8'b0000_1111,		//INC--OF
				DEC		= 8'b0001_0000;
							
			
	always@(posedge CLK or posedge RST)
		begin
		if(RST)
			begin
			CAR = 8'h00;
			CBR = 32'h0000_0010;
		end
		else
			begin
			CBR = ROM;					//将控制存储器中的数据传入CBR
			case(CBR[22:20])
				3'b010: CAR = 0;
					
				3'b100: CAR = 8'h50;
				
				3'b001:begin
						 	case(IR)
								STORE:   CAR=8'h20;
								LOAD:	 	CAR=8'h10;	
								ADD:		CAR=8'h30;	
								SUB:		CAR=8'h40;
								DIV:	 	CAR=8'h00;
								AND:	 	CAR=8'h60;	
								OR: 	 	CAR=8'h70;	
								NOT:	 	CAR=8'h80;	
								SHR:	 	CAR=8'h90;	
								SHL:	 	CAR=8'hA0;	
								MPY:	 	CAR=8'hB0;	
								DIV:	 	CAR=8'hC0;						
					
								HALT: 	CAR=8'h50;
								JMP:		CAR=8'hF0;
								JMPGEZ:	if(!zflag)
												CAR=8'hF2;
											else
												CAR=8'hF0;
								default:	CAR=8'h00;
							endcase						
					end				
				3'b000: CAR = CAR+1;				
				default:;			
			endcase
		end
	end
endmodule
