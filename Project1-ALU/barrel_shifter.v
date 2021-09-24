module barrel_shifter
#( parameter 
	N = 32,
	M = 5
    )
(
	output [N-1:0] out,
	input [N-1:0] in,
	input [M-1:0] shiftamt,
	input left
);
	
	wire [N * M-1:0] temp;
	wire [N * M-1:0] tempR;
	
	
	genvar i;
	genvar j;
	generate
		for (i = 0; i < M; i = i + 1) begin : shifter_left_sel
			for (j = 0; j< N; j = j + 1) begin : shifter_left
				if (i == 0) begin
					if (j <= 0)
						mux_2to1_1b m0(temp[i*N+j], in[j], 0, shiftamt[i]);
					else
						mux_2to1_1b m1(temp[i*N+j], in[j], in[j-1], shiftamt[i]);
					end
				else begin
					if (j <= 2**i -1)
						mux_2to1_1b m2(temp[i*N+j], temp[(i-1)*N+j], 0, shiftamt[i]);
					else
						mux_2to1_1b m3(temp[i*N+j], temp[(i-1)*N+j], temp[(i-1)*N+j-2**i], shiftamt[i]);
					end
			end
		end
	endgenerate
	
	generate
		for (i = 0; i < M; i = i + 1) begin : shifter_right_sel
			for (j = 0; j< N; j = j + 1) begin : shifter_right
				if (i == 0) begin
					if (j == N - 1)
						mux_2to1_1b m4(tempR[i*N+j], in[j], in[N-1], shiftamt[i]);
					else
						mux_2to1_1b m5(tempR[i*N+j], in[j], in[j+1], shiftamt[i]);
					end
				else begin
					if (j >= N - 2**i)
						mux_2to1_1b m6(tempR[i*N+j], tempR[(i-1)*N+j], in[N-1], shiftamt[i]);
					else
						mux_2to1_1b m7(tempR[i*N+j], tempR[(i-1)*N+j], tempR[(i-1)*N+j+2**i], shiftamt[i]);
					end
			end
		end
	endgenerate
	assign out = left==1?temp[N*M-1:N*M-N]:tempR[N*M-1:N*M-N];
endmodule
	