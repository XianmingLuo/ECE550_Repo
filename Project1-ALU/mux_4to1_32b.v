module mux_4to1_32b(out, in0, in1, in2, in3, sel);
	
	input [31:0] in0, in1, in2, in3;
	input [1:0] sel;
	output [31:0]out;
	
	wire top_result, bottom_result;
	
	mux_2to1_32b mux_2to1_top(top_result, in0, in1, sel[0]);
	mux_2to1_32b mux_2to1_bottom(bottom_result, in2, in3, sel[0]);
	
	mux_2to1_32b mux_2to1_result(out, top_result, bottom_result, sel[1]);
	
endmodule