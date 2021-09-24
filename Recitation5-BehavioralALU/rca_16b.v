module rca_16b(sum, c_out, last_bit_ci, a, b, c_in);
	input [15:0] a, b;
	input c_in;
	output [15:0] sum;
	output c_out, last_bit_ci;
	
	wire c_34, c_78, c_1112;
	
	//wires for last_bit_ci in each rca_4b
	wire lbci_0, lbci_1, lbci_2; // lbci_3 is replaced by last_bit_ci 
	
	
	// rca_4b prototype: rca_4b(sum, c_out, last_bit_ci, a, b, c_in);
	rca_4b rca4b_0(sum[3:0], c_34, lbci_0, a[3:0], b[3:0], c_in);
	rca_4b rca4b_1(sum[7:4], c_78, lbci_1, a[7:4], b[7:4], c_34);
	rca_4b rca4b_2(sum[11:8], c_1112, lbci_2, a[11:8], b[11:8], c_78);
	rca_4b rca4b_3(sum[15:12], c_out, last_bit_ci , a[15:12], b[15:12], c_1112);

endmodule
