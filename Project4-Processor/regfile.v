module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB,
);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;

   /* YOUR CODE HERE */
	
	// wires for decoder's [31:0] outputs
	wire [31:0] dcd_outwires_wrt, dcd_outwires_read_A, dcd_outwires_read_B;
	
	// 3 Decoders - module decoder_5to32( [31:0]out, [4:0]in, en);
	decoder_5to32 dcd_write(dcd_outwires_wrt, ctrl_writeReg, 1'b1);    // for writing
	decoder_5to32 dcd_readA(dcd_outwires_read_A, ctrl_readRegA, 1'b1); // for reading A
	decoder_5to32 dcd_readB(dcd_outwires_read_B, ctrl_readRegB, 1'b1); // for reading B
	
	
	//for reg0, read only
	wire [31:0] q0;
	register_32b reg_0(q0, 32'h00000000, clock, 1'b0, ctrl_reset);
	assign data_readRegA = dcd_outwires_read_A[0]? q0 : 32'bz;
	assign data_readRegB = dcd_outwires_read_B[0]? q0 : 32'bz;
	
	// generate 31 times except reg0
	genvar i;
	generate
		for(i = 1; i < 32; i = i+1) begin: name
			// 32 set of wires using generate loop
			wire [31:0] q; 
			wire wr_en_wire;
			
			// 1. writing port: connection between decoder and register 
			and and_0(wr_en_wire, dcd_outwires_wrt[i], ctrl_writeEnable); 
			
			// 2. anything connects to the 32 registers 
			//    ---- module register_32b( [31:0]q, [31:0]d, clk, en, clr);
			register_32b reg_1(q, data_writeReg, clock, wr_en_wire, ctrl_reset); //clr = ctrl_reset??
			
			// 3. Reading A port: connection between register and output 
			//    (---- e.g. bufif1  b1(out, in, oe);)
			assign data_readRegA = dcd_outwires_read_A[i]? q : 32'bz;
				
			// 4. Reading B port: connection between register and output  
			assign data_readRegB = dcd_outwires_read_B[i]? q : 32'bz;
		end
	endgenerate

	
	
endmodule
