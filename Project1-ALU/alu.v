module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

	input [31:0] data_operandA, data_operandB;
	input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

	output [31:0] data_result;
	output isNotEqual, isLessThan, overflow;
   
	// YOUR CODE HERE //
	wire [31:0] notB;
	wire [31:0] finalB;
	wire cin;
	genvar i;
	generate
		for (i = 0; i< 32; i = i + 1) begin : inverter
			not not_gate(notB[i], data_operandB[i]);
		end
	endgenerate
	assign finalB = ctrl_ALUopcode[0] == 0 ? data_operandB : notB;
	assign cin = ctrl_ALUopcode[0] == 0 ? 0 : 1;
	//module csa_32b_by_rca(sum, c_out, ovf, a, b, c_in);
	csa_32b_by_rca adder(data_result, c_out, overflow, data_operandA, finalB, cin);


endmodule
