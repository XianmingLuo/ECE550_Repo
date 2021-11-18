module clk_allocate(imem_clock, dmem_clock, processor_clock, regfile_clock, clk);
	output imem_clock, dmem_clock, processor_clock, regfile_clock;
	input clk;
	
	wire  clk2;
	
	clk_divider_by2 clk_divider(clk2, clk);
	assign imem_clock = !clk;
	assign dmem_clock = clk;
	assign processor_clock = clk2;
	assign regfile_clock = clk2;
	
endmodule

