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
	assign out = left==1?in<<shiftamt:in>>>shiftamt;
endmodule
	