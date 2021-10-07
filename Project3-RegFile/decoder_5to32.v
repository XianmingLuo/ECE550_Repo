module decoder_5to32(out, in, en);
	input [4:0]in;
	input en;
	output [31:0] out;
	//Structural Verilog is required
	//So that the code may seem very dumb
	
	wire [4:0] nIn;
	genvar i;
	generate
		for(i = 0; i < 5; i = i+1) begin: notIn
			not(nIn[i], in[i]);
		end
	endgenerate
	
	and(out[0], nIn[4], nIn[3], nIn[2], nIn[1], nIn[0]);
	and(out[1], nIn[4], nIn[3], nIn[2], nIn[1], in[0]);
	and(out[2], nIn[4], nIn[3], nIn[2], in[1], nIn[0]);
	and(out[3], nIn[4], nIn[3], nIn[2], in[1], in[0]);
	and(out[4], nIn[4], nIn[3], in[2], nIn[1], nIn[0]);
	and(out[5], nIn[4], nIn[3], in[2], nIn[1], in[0]);
	and(out[6], nIn[4], nIn[3], in[2], in[1], nIn[0]);
	and(out[7], nIn[4], nIn[3], in[2], in[1], in[0]);
	and(out[8], nIn[4], in[3], nIn[2], nIn[1], nIn[0]);
	and(out[9], nIn[4], in[3], nIn[2], nIn[1], in[0]);
	and(out[10], nIn[4], in[3], nIn[2], in[1], nIn[0]);
	and(out[11], nIn[4], in[3], nIn[2], in[1], in[0]);
	and(out[12], nIn[4], in[3], in[2], nIn[1], nIn[0]);
	and(out[13], nIn[4], in[3], in[2], nIn[1], in[0]);
	and(out[14], nIn[4], in[3], in[2], in[1], nIn[0]);
	and(out[15], nIn[4], in[3], in[2], in[1], in[0]);
	and(out[16], in[4], nIn[3], nIn[2], nIn[1], nIn[0]);
	and(out[17], in[4], nIn[3], nIn[2], nIn[1], in[0]);
	and(out[18], in[4], nIn[3], nIn[2], in[1], nIn[0]);
	and(out[19], in[4], nIn[3], nIn[2], in[1], in[0]);
	and(out[20], in[4], nIn[3], in[2], nIn[1], nIn[0]);
	and(out[21], in[4], nIn[3], in[2], nIn[1], in[0]);
	and(out[22], in[4], nIn[3], in[2], in[1], nIn[0]);
	and(out[23], in[4], nIn[3], in[2], in[1], in[0]);
	and(out[24], in[4], in[3], nIn[2], nIn[1], nIn[0]);
	and(out[25], in[4], in[3], nIn[2], nIn[1], in[0]);
	and(out[26], in[4], in[3], nIn[2], in[1], nIn[0]);
	and(out[27], in[4], in[3], nIn[2], in[1], in[0]);
	and(out[28], in[4], in[3], in[2], nIn[1], nIn[0]);
	and(out[29], in[4], in[3], in[2], nIn[1], in[0]);
	and(out[30], in[4], in[3], in[2], in[1], nIn[0]);
	and(out[31], in[4], in[3], in[2], in[1], in[0]);


	//below is the behavioral version
	//nice and ez

	/*
	always @(*) begin
		if (~en)
			out = 32'h00000000;
		else
			out = 32'h00000001 << in;
		end*/
endmodule
