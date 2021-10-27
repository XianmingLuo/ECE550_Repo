module full_adder(sum, c_out, a, b, c_in);
	input a, b, c_in;
	output sum, c_out;
	

	// FA implementation of lecture version (2 gate delays)
	wire w1, w2, w3;
	xor xor_1(sum, a, b, c_in);
	and and_1(w1, a, b);
	and and_2(w2, a, c_in);
	and and_3(w3, b, c_in);
	or or_1(c_out, w1, w2, w3);
	
	
	// FA implementation of recitation version (3 gate delays)
//	wire w1, w2, s3;	
//	xor xor_1(w1, a,b);
//	xor xor_2(sum, w1, c_in);
//	and and_1(w2, w1, c_in);
//	and and_2(w3, a, b);
//	or or_1(c_out, w2, w3);
	
endmodule
