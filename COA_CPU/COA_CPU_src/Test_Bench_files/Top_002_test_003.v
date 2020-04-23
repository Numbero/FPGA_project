`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:10:46 03/25/2017
// Design Name:   Top_002
// Module Name:   D:/Effort_Progress/ISE_Project/COA_CPU_001/Top_002_test_003.v
// Project Name:  COA_CPU_001
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Top_002
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Top_002_test_003;

	// Inputs
	reg CLK;
	reg RST;

	// Outputs
	wire [7:0] Dis;

	// Instantiate the Unit Under Test (UUT)
	Top_002 uut (
		.CLK(CLK), 
		.RST(RST), 
		.Dis(Dis)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		RST = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
  // Bidirs
	always #5 CLK = !CLK;  
	
endmodule

