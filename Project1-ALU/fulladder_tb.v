`timescale 1 ns / 100 ps

module fulladder_tb();

	reg clock;
	reg data_operandA, data_operandB, data_expected;
	reg cin;
	wire data_result;
	wire overflow;

		
	integer errors;
   integer index;
	//module full_adder(sum, c_out, a, b, c_in);
	full_adder adder_ut(data_result, c_out, data_operandA, data_operandB, cin);

	
	initial
	
	begin
		$display($time, " << Starting the Simulation >>");
		clock = 1'b0;
		errors = 0;
		
		// First Test Case 
		@(negedge clock);
		assign cin = 1'b0;
		assign data_operandA = 1'b0;
		assign data_operandB = 1'b0;
		@(negedge clock);
		if(data_result != 1'b0) begin
			$display("**Error in Adder; expected: %h, actual: %h", 1'b0, data_result);
			errors = errors + 1;
		end
		
		/*
		for(index=0; index < 3; index = index + 1)
		begin
			@(negedge clock);
			assign data_operandA = 4'b0001 << index;
			assign data_operandB = 4'b0001 << index;
			
			assign data_expected = 4'b0001 << (index + 1);
			
			@(negedge clock);
			if(data_result !== data_expected) begin
				$display("**Error in ADD; A: %h, B: %h, expected: %h, actual: %h", data_operandA, data_operandB, data_expected, data_result);
				errors = errors + 1;
			end
		end*/
		
		@(negedge clock);
		assign data_operandA = 1'b0;
		assign data_operandB = 1'b0;
		@(negedge clock);
		if(data_result != 1'b0) begin
			$display("**Error in Adder; expected: %b, actual: %b", 1'b0, data_result);
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
