module ctrl_sig_decoder(ctrl_sig, opcode);
   
	//Inputs
	input [4:0] opcode;
	//Output
	//BR, JP, ALUinB, ALUop, DMwe, Rwe, Rdst, Rwd
	output reg [7:0] ctrl_sig;
	//Random Logic
	always @(*) begin
		case(opcode)
			5'b00000: ctrl_sig = (1<<2)|(1<<1); //add, sub, and, or, sll, sra
			5'b00101: ctrl_sig = (1<<5)|(1<<2); //addi
			5'b00111: ctrl_sig = (1<<5)|(1<<3); //sw
			5'b01000: ctrl_sig = (1<<5)|(1<<2)|(1<<0);//lw
		endcase
	end
	
	
	
endmodule