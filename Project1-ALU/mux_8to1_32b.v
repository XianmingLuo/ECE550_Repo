module mux_8to1_32b(out, in0, in1, in2, in3, in4, in5, in6, in7, sel);
	
	input [31:0] in0, in1, in2, in3, in4, in5, in6, in7;
	input [2:0] sel;
	output [31:0]out;
	
	wire top_result, bottom_result;
	
	mux_4to1_32b mux_4to1_top(top_result, in0, in1, in2, in3, sel[1:0]);
	mux_4to1_32b mux_4to1_bottom(bottom_result, in4, in5, in6, in7, sel[1:0]);
	
	mux_2to1_32b mux_2to1_result(out, top_result, bottom_result, sel[2]);
	
	
endmodule