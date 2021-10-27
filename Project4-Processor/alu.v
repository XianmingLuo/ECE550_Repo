module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

	input [31:0] data_operandA, data_operandB;
	input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

	output [31:0] data_result;
	output isNotEqual, isLessThan, overflow;
   
	// YOUR CODE HERE //
	wire [31:0] notB;
	wire [31:0] finalB;
	wire [31:0] sum_output;
	wire [31:0] and_output;
	wire [31:0] or_output;
	wire [31:0] sft_output;
	wire [31:0] logic_output;
	
	
	wire cin;
	wire left;
	wire notSign;
	genvar i;
	generate
		for (i = 0; i< 32; i = i + 1) begin : inverter
			not not_gate(notB[i], data_operandB[i]);
		end
	endgenerate
	assign finalB = ctrl_ALUopcode[0] == 0 ? data_operandB : notB;
	assign cin = ctrl_ALUopcode[0] == 0?0: 1;
	//module csa_32b_by_rca(sum, c_out, ovf, a, b, c_in);
	csa_32b_by_rca adder(sum_output, c_out, overflow, data_operandA, finalB, cin);
	
	//module bitwise_and_32b(out, in1, in2);
	bitwise_and_32b and32b(and_output, data_operandA, data_operandB);
	
	//module bitwise_or_32b(out, in1, in2);
	bitwise_or_32b or32b(or_output, data_operandA, data_operandB);
	
	//module barrel_shifter(out, in, shiftamt,left);
	not not_gate(left, ctrl_ALUopcode[0]);
	barrel_shifter shifter(sft_output, data_operandA, ctrl_shiftamt, left);
	
	//module mux_8to1_32b(out, in0, in1, in2, in3, in4, in5, in6, in7, sel);
	mux_2to1_32b logic_sel(logic_output, and_output, or_output, ctrl_ALUopcode[0]);
	mux_4to1_32b selecter(data_result,
								 sum_output,//00
								 logic_output,//01
								 sft_output,//10
								 0,
								 ctrl_ALUopcode[2:1]);

	assign isNotEqual = sum_output==0?0:1;
	
	not not_gate2(notSign, sum_output[31]);
	assign isLessThan = overflow==0?sum_output[31]:notSign;
endmodule
