module clk_divider_by2(out_clk, clk);
output reg out_clk;
input clk ;
always @(posedge clk)
	out_clk <= ~out_clk;	
endmodule