`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:40:29 03/21/2017 
// Design Name: 
// Module Name:    Main_Memory_1 
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
module Main_Memory_1(
		Address,
		Dout,
		CLK,
		R_W,
		Din,
		Dis,
		DATA,
		RST
    );
	 
input [7:0]Address,DATA;
input CLK,R_W,RST;
input [15:0]Din;
output reg 	[15:0]Dout;
output reg 	[15:0]Dis;
reg 	[15:0]temp0,temp1,temp2,temp3,temp4;

initial
	begin
	Dout <= 0;
	temp3 <= 0;
	temp4 <= 0;
end

always@(negedge CLK or posedge RST) 
	begin
	if(RST)
		begin
		Dout = 0;
		temp3 = 0;
		temp4 = 0;
	end
	else
		begin
		if(!R_W)
			case(Address)
					//完成从1到A2的求和
					8'h00:  Dout=16'h02A0; //LOAD A0
					8'h01:  Dout=16'h01A4; //Store A4 = A0
					8'h02:  Dout=16'h02A2; //LOAD A2
					8'h03:  Dout=16'h01A3; //Store A3 = A2
					8'h04:  Dout=16'h02A4; //LOAD A4
					8'h05:  Dout=16'h03A3; //ADD A3   A4 + A3
					8'h06:  Dout=16'h01A4; //Store A4 = A4 + A3
					8'h07:  Dout=16'h02A3; //LOAD A3
					8'h08:  Dout=16'h04A1; //SUB A1 
					8'h09:  Dout=16'h01A3; //STORE A3 = A3 - A1
					8'h0A:  Dout=16'h0504; //JMPEZ 04
					
					//完成A4*（-5）					
					8'h0B:  Dout=16'h02A4; //LOAD A4
					8'h0C:  Dout=16'h08A5; //MUL A5
					8'h0D:  Dout=16'h01A4; //Store A4 =A4*A5
					
					//完成A4左移3位
					8'h0E:  Dout=16'h0E00; //SHL										
					8'h0F:  Dout=16'h0E00; //SHL										
					8'h10:  Dout=16'h0E00; //SHL
					8'h11:  Dout=16'h01A4; //Store A4
					
					//结束程序
					8'h12:  Dout=16'h0700; //HALT				
					
					
					//数据存储区
					8'hA0:  Dout=16'h0000;
					8'hA1:  Dout=16'h0001;
					8'hA2:  begin Dout[7:0]=DATA; Dout[15:8]=0;end
					
					8'hA3:  Dout = temp3;
					8'hA4:  Dout = temp4;
					8'hA5:  Dout = 16'b1000_0000_0000_0101;
				
					default:; 
			endcase
		else
			case(Address)
					8'hA3:  temp3 = Din;
					8'hA4:  temp4 = Din;
					default:;					
			endcase
		Dis = temp4;
	end		
end 
endmodule
