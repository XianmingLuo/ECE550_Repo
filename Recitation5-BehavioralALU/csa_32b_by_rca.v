module csa_32b_by_rca(sum, c_out, ovf, a, b, c_in);
  input [31:0] a, b;
  input c_in;
  output [31:0] sum;
  output c_out, ovf;

  // wires working around the mux
  wire co_15_to_16, co_from_31_0, co_from_31_1;
  wire [15:0] sum_31_16_0, sum_31_16_1;
  
  //wires for last_bit_ci in each rca_4b
	wire lbci_1, lbci_1_0, lbci_1_1, last_bit_ci; // lbci_3 is replaced by last_bit_ci 

  // 16-bits csa prototype: rca_16b(sum, c_out, last_bit_ci, a, b, c_in);
  rca_16b rca16b_1(sum[15:0], co_15_to_16, lbci_1, a[15:0], b[15:0], c_in);
  rca_16b rca16b_2_0(sum_31_16_0, co_from_31_0, lbci_1_0, a[31:16], b[31:16], 0);
  rca_16b rca16b_2_1(sum_31_16_1, co_from_31_1, lbci_1_1, a[31:16], b[31:16], 1);


  // 1-bit mux prototype: mux(result, a, b, s);
  // mux mux_1(c_out, co_from_31_0, co_from_31_1, co_15_to_16);
  assign c_out = co_15_to_16==1? co_from_31_1 : co_from_31_0;
  assign last_bit_ci = co_15_to_16==1? lbci_1_1 : lbci_1_0;

  // 16-bits mux prototype: mux_16(sum, c_out, sum_0, sum_1)
  // mux_16 mux16(sum[31:16], sum_31_16_0, sum_31_16_1, co_15_to_16));
  assign sum[31:16] = co_15_to_16==1? sum_31_16_1 : sum_31_16_0;
  
  xor xor_1(ovf, c_out, last_bit_ci);

endmodule
