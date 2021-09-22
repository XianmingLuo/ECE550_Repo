`timescale 1 ns / 100 ps

module adder_tb();

	reg clock;
	reg [31:0] data_operandA, data_operandB, data_expected;
	reg cin;
	wire [31:0] data_result;
	wire overflow;

		
	integer errors;
   integer index;
	// csa_32b_by_rca(sum, c_out, ovf, a, b, c_in)
	csa_32b_by_rca adder_ut(data_result, c_out, overflow, data_operandA, data_operandB, cin);

	
	initial
	
	begin
		$display($time, " << Starting the Simulation >>");
		clock = 1'b0;
		errors = 0;
		assign cin = 1'b0;
		
		// First Test Case 
		@(negedge clock);
		assign data_operandA = 32'h00000000;
		assign data_operandB = 32'h00000000;
		@(negedge clock);
		if(data_result != 32'h00000000) begin
			$display("**Error in Adder; expected: %h, actual: %h", 32'h00000000, data_result);
			errors = errors + 1;
		end
		
		
		for(index=0; index < 31; index = index + 1)
		begin
			@(negedge clock);
			assign data_operandA = 32'h00000001 << index;
			assign data_operandB = 32'h00000001 << index;
			
			assign data_expected = 32'h00000001 << (index + 1);
			
			@(negedge clock);
			if(data_result !== data_expected) begin
				$display("**Error in ADD; A: %h, B: %h, expected: %h, actual: %h", data_operandA, data_operandB, data_expected, data_result);
				errors = errors + 1;
			end
		end
		
		@(negedge clock);
		assign data_operandA = 32'h00000000;
		assign data_operandB = 32'h006f7d00;
		@(negedge clock);
		if(data_result != 32'h006f7d00) begin
			$display("**Error in Adder; expected: %h, actual: %h", 32'h00000000, data_result);
			errors = errors + 1;
		end

		@(negedge clock);
		assign data_operandA = 32'hffffffff;
		assign data_operandB = 32'h00000000;
		@(negedge clock);
		if(data_result != 32'hffffffff) begin
			$display("**Error in Adder; expected: %h, actual: %h", 32'hffffffff, data_result);
			$display("c_out: %b, overflow: %b", c_out, overflow);
			errors = errors + 1;
		end

		@(negedge clock);
		assign data_operandA = 32'hffffffff;
		assign data_operandB = 32'h00000001;
		@(negedge clock);
		if(data_result != 32'h00000000 | c_out != 1 | overflow != 0 ) begin
			$display("**Error in Adder; expected: %h, actual: %h", 32'h00000000, data_result);
			$display("c_out: %b, overflow: %b", c_out, overflow);
			errors = errors + 1;
		end

		@(negedge clock);
		assign data_operandA = 32'hffffffff;
		assign data_operandB = 32'hf0000000;
		@(negedge clock);
		if(data_result != 32'hefffffff | c_out != 1 | overflow != 0 ) begin
			$display("**Error in Adder; expected: %h, actual: %h", 32'hefffffff, data_result);
			$display("c_out: %b, overflow: %b", c_out, overflow);		
			errors = errors + 1;
		end


		@(negedge clock);
		assign data_operandA = 32'h7fffffff;
		assign data_operandB = 32'h10000000;
		@(negedge clock);
		if(data_result != 32'h8fffffff | c_out != 0 | overflow != 1 ) begin
			$display("**Error in Adder; expected: %h, actual: %h", 32'h8fffffff, data_result);
			$display("c_out: %b, overflow: %b", c_out, overflow);
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
