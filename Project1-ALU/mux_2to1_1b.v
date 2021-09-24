module mux_2to1_1b(out, a, b, sel);

	output out;
	input a, b, sel;

	assign out = sel==0?a:b;

endmodule
