`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:55:48 03/30/2017
// Design Name:   Top_002
// Module Name:   D:/Effort_Progress/ISE_Project/COA_CPU_001/Top_002_test_005.v
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

module Top_002_test_005;

	// Inputs
	reg CLK;
	reg RST;
	reg [7:0] Data;

	// Outputs
	wire [7:0] Dis;
	wire [3:0] Cs;
	wire [7:0] LED;

	// Instantiate the Unit Under Test (UUT)
	Top_002 uut (
		.CLK(CLK), 
		.RST(RST), 
		.Data(Data), 
		.Dis(Dis), 
		.Cs(Cs), 
		.LED(LED)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		RST = 0;
		Data = 8'h0A;

		// Wait 100 ns for global reset to finish
		#100;        
		// Add stimulus here
	end
    
	always #5 CLK = !CLK;  	
	
endmodule

