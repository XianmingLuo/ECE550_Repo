module rca_4b(sum, c_out, last_bit_ci, a, b, c_in);
	input [3:0] a, b;
	input c_in;
	output [3:0] sum;
	output c_out, last_bit_ci;
	
	wire c_01, c_12; // c_23 is replaced by last_bit_ci
	
	full_adder FA_0(sum[0], c_01, a[0], b[0], c_in);
	full_adder FA_1(sum[1], c_12, a[1], b[1], c_01);
	full_adder FA_2(sum[2], last_bit_ci, a[2], b[2], c_12);
	full_adder FA_3(sum[3], c_out, a[3], b[3], last_bit_ci);
endmodule
	
	
	