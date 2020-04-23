// Verilog test fixture created from schematic D:\Effort_Progress\ISE_Project\COA_CPU_001\Contorl_Unit_002.sch - Mon Mar 20 20:00:06 2017

`timescale 1ns / 1ps

module Contorl_Unit_002_Contorl_Unit_002_sch_tb();

// Inputs
   reg CLK;
   reg zflag;
   reg [7:0] IR;
   reg R_W;
   reg [31:0] DATA;

// Output
   wire [31:0] CBR;

// Bidirs
initial
		begin
		zflag <= 0;
		CLK <= 0;
		IR <= 8'h00;
		R_W <= 0;
		DATA <= 0;
	end
	
	always #50 CLK = !CLK;
	always 
		begin
		while(1)
			begin
			#1000
			IR = 8'h01;	
			#1000
			IR = 8'h02;	
			#1000
			IR = 8'h03;	
			#1000
			IR = 8'h04;	
			#1000
			IR = 8'h05;	
			#1000
			IR = 8'h06;	
		end
	end
// Instantiate the UUT
   Contorl_Unit_002 UUT (
		.CLK(CLK), 
		.zflag(zflag), 
		.IR(IR), 
		.R_W(R_W), 
		.CBR(CBR), 
		.DATA(DATA)
   );
// Initialize Inputs
   `ifdef auto_init
       initial begin
		CLK = 0;
		zflag = 0;
		IR = 0;
		R_W = 0;
		DATA = 0;
   `endif
endmodule
