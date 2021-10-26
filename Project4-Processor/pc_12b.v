module pc_12b(q, d, clk, en, clr);
   
   //Inputs
	input [11:0] d;
	
   input clk, en, clr;
   
   //Internal wire
   wire clr;

   //Output
   output [11:0] q;	
	
	genvar i;
	
	generate
		for(i = 0; i < 12; i = i+1) begin: register_12b
			dffe_ref dffe(q[i], d[i], clk, en, clr);
		end
	endgenerate
	
endmodule
