module bitwise_and_32b(out, in1, in2);
	input [31:0] in1, in2;
	output [31:0] out;
	
	
	genvar i;
	
	generate
		for(i = 0; i < 32; i = i+1) begin: and_32b
			and and_0(out[i], in1[i], in2[i]);
		end
	endgenerate

endmodule
