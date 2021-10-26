module sign_extender(out, in);
	input [16:0] in;
	output [31:0] out;
	assign out = {{15{in[16]}}, in};
endmodule