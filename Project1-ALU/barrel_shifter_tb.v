`timescale 1 ns / 100 ps

module barrel_shifter_tb();

	reg clock;
	reg signed [31:0] in, out_expected;
	reg [4:0] shiftamt;
	reg left;
	wire [31:0] out;

		
	integer errors;
   integer index;
	// module barrel_shifter(out, in, shiftamt, left);
	barrel_shifter bs_0(out, in, shiftamt, left);

	
	initial
	
	begin
		$display($time, " << Starting the Simulation >>");
		clock = 1'b0;
		errors = 0;
		
		// Test Cases 1-3 for SRA ( << is a binary logical shift, <<< is arithmetic)
		
		// Test Case 1 
		@(negedge clock);
		assign in = 32'd2012345678;
		assign shiftamt = 5'd20;
		assign left = 1'b1;
		assign out_expected = in <<< shiftamt;
		@(negedge clock);
		$display("**Test 1:\n input: %b, shiftamt: %d, left: %b", in, shiftamt, left);
		$display("Expected: %b, actual: %b\n", out_expected, out);
		if(out != out_expected) begin
			$display("**Error in SLL!\n\n");
			errors = errors + 1;
		end
		
		// Test Case 2 
		@(negedge clock);
		assign in = 32'd2012345678;
		assign shiftamt = 5'd31;
		assign left = 1'b1;
		assign out_expected = in <<< shiftamt;
		@(negedge clock);
		$display("**Test 2:\n input: %b, shiftamt: %d, left: %b", in, shiftamt, left);
		$display("Expected: %b, actual: %b\n", out_expected, out);
		if(out != out_expected) begin
			$display("**Error in SLL!\n\n");
			errors = errors + 1;
		end
		
		// Test Case 3 
		@(negedge clock);
		assign in = -32'd2012345678;
		assign shiftamt = 5'd20;
		assign left = 1'b1;
		assign out_expected = in <<< shiftamt;
		@(negedge clock);
		$display("**Test 3:\n input: %b, shiftamt: %d, left: %b", in, shiftamt, left);
		$display("Expected: %b, actual: %b\n", out_expected, out);
		if(out != out_expected) begin
			$display("**Error in SLL!\n\n");
			errors = errors + 1;
		end
		
		// Test Case 4 
		@(negedge clock);
		assign in = -32'd0;
		assign shiftamt = 5'd20;
		assign left = 1'b1;
		assign out_expected = in <<< shiftamt;
		@(negedge clock);
		$display("**Test 4:\n input: %b, shiftamt: %d, left: %b", in, shiftamt, left);
		$display("Expected: %b, actual: %b\n", out_expected, out);
		if(out != out_expected) begin
			$display("**Error in SLL\n\n!");
			errors = errors + 1;
		end
		
		
		// Test Cases 5-8 for SRA ( >>> is a binary arithmetic shift)
		
		// Test Case 5  
		@(negedge clock);
		assign in = 32'd2012345678;
		assign shiftamt = 5'd20;
		assign left = 1'b0;
		assign out_expected = in >>> shiftamt;
		@(negedge clock);
		$display("**Test 5:\n input: %b, shiftamt: %d, left: %b", in, shiftamt, left);
		$display("Expected: %b, actual: %b\n", out_expected, out);
		if(out != out_expected) begin
			$display("**Error in SRA!\n\n");
			errors = errors + 1;
		end
		
		// Test Case 6 
		@(negedge clock);
		assign in = 32'd2012345678;
		assign shiftamt = 5'd31;
		assign left = 1'b0;
		assign out_expected = in >>> shiftamt;
		@(negedge clock);
		$display("**Test 6:\n input: %b, shiftamt: %d, left: %b", in, shiftamt, left);
		$display("Expected: %b, actual: %b\n", out_expected, out);
		if(out != out_expected) begin
			$display("**Error in SRA!\n\n");
			errors = errors + 1;
		end
		
		// Test Case 7 
		@(negedge clock);
		assign in = -32'd2012345678;
		assign shiftamt = 5'd20;
		assign left = 1'b0;
		assign out_expected = in >>> shiftamt;
		@(negedge clock);
		$display("**Test 7:\n input: %b, shiftamt: %d, left: %b", in, shiftamt, left);
		$display("Expected: %b, actual: %b\n", out_expected, out);
		if(out != out_expected) begin
			$display("**Error in SRA!\n\n");
			errors = errors + 1;
		end
		
		// Test Case 8 
		@(negedge clock);
		assign in = -32'd0;
		assign shiftamt = 5'd20;
		assign left = 1'b0;
		assign out_expected = in >>> shiftamt;
		@(negedge clock);
		$display("**Test 8:\n input: %b, shiftamt: %d, left: %b", in, shiftamt, left);
		$display("Expected: %b, actual: %b\n", out_expected, out);
		if(out != out_expected) begin
			$display("**Error in SRA!\n\n");
			errors = errors + 1;
		end
		
		
		
		
		
		// check if pass the test
		if(errors == 0) begin
			$display("The simulation completed without errors");
		end
		else begin
			$display("The simulation failed with %d errors", errors);
		end
		
	end
	
	// Clock generator
	always
		#10	clock = ~clock;
endmodule