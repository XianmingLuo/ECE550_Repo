module decoder_5to32(out, in, en);
	input [4:0]in;
	input en;
	output reg [31:0] out;
	always @(*) begin
		if (~en)
			out = 32'h00000000;
		else
			out = 32'h00000001 << in;
		end
endmodule
