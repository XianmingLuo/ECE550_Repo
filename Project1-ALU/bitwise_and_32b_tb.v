`timescale 1 ns / 100 ps

module bitwise_and_32b_tb();

	reg clock;
	reg [31:0] in1, in2, out_expected;
	wire [31:0] out;

		
	integer errors;
   integer index;
	// module bitwise_and_32b(out, in1, in2)
	bitwise_and_32b and_32b(out, in1, in2);

	
	initial
	
	begin
		$display($time, " << Starting the Simulation >>");
		clock = 1'b0;
		errors = 0;
		
		
		// First Test Case 
		@(negedge clock);
		assign in1 = 32'd188899668;
		assign in2 = 32'd1;
		assign out_expected = in1 & in2;
		@(negedge clock);
		if(out != out_expected) begin
			$display("**Error in bitwise_AND: expected: %b, actual: %b", out_expected, out);
			errors = errors + 1;
		end
		
		
		// 2nd Test Case 
		@(negedge clock);
		assign in1 = 32'd188899668;
		assign in2 = 32'd287367900;
		assign out_expected = in1 & in2;
		@(negedge clock);
		if(out != out_expected) begin
			$display("**Error in bitwise_AND: expected: %b, actual: %b", out_expected, out);
			errors = errors + 1;
		end

		// 3rd Test Case 
		@(negedge clock);
		assign in1 = 32'd3678;
		assign in2 = 32'd2569;
		assign out_expected = in1 & in2;
		@(negedge clock);
		if(out != out_expected) begin
			$display("**Error in bitwise_AND: expected: %b, actual: %b", out_expected, out);
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