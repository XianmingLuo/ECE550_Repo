module mux_8to1_32b(out, in0, in1, in2, in3, in4, in5, in6, in7, sel);
	
	input [31:0] in0, in1, in2, in3, in4, in5, in6, in7;
	input [2:0] sel;
	output reg [31:0] out;
	
	always @(in0, in1, in2, in3, in4, in5, in6, in7, sel) begin
		case(sel)
			3'd0: out <= in0;
			3'd1: out <= in1;
			3'd2: out <= in2;
			3'd3: out <= in3;
			3'd4: out <= in4;
			3'd5: out <= in5;
			3'd6: out <= in6;
			3'd7: out <= in7;
		endcase
	end
endmodule
