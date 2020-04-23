// Verilog test fixture created from schematic D:\Effort_Progress\ISE_Project\COA_CPU_001\Top_001.sch - Mon Mar 20 23:05:16 2017

`timescale 1ns / 1ps

module Top_001_Top_001_sch_tb();

// Inputs
   reg CLK;

// Output
	initial 
		begin
		CLK <= 0;
	end
// Bidirs
	always #50 CLK = !CLK;
// Instantiate the UUT
   Top_001 UUT (
		.CLK(CLK)
   );
// Initialize Inputs
   `ifdef auto_init
       initial begin
		CLK = 0;
   `endif
endmodule
