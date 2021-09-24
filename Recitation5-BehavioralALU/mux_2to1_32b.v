module mux_2to1_32b(out, in0, in1, sel);

	output [31:0] out;
	input [31:0] in0, in1;
	input sel;

	assign out = sel==0?in0:in1;

endmodule