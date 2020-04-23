`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:47:25 03/11/2017 
// Design Name: 
// Module Name:    divide_to_100k_CLK 
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
module divide_to_100k_CLK(
  CIN,COUT);

input CIN;
output COUT;

reg [8:0] count;
reg [8:0] count_1;
reg COUT;

initial
	begin
		count<=0;
		count_1<=0;
		COUT<=0;
end

always @(posedge CIN)
	begin
	count=count+1;
	if(count==500)
		begin
		count_1=count_1 + 1;		
		count=0;
	end
	else;
	if(count_1==50)
		begin
		COUT=!COUT;
		count_1=0;
	end
	else;
end


endmodule
