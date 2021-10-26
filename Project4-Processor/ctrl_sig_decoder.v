module ctrl_sig_decoder(ctrl_sig, opcode);
   
	//Inputs
	input [4:0] opcode;
	//Output
	//Rwe, Rsrc2, ALUinB, ALUop, DMwe, Rwd, BR, JP
	output reg [7:0] ctrl_sig;
	//Random Logic
	always @(*) begin
		case(opcode)
			5'b00000: ctrl_sig = (8'b1<<7); //add, sub, and, or, sll, sra
			5'b00101: ctrl_sig = (8'b1<<7)|(8'b1<<5)|(8'b1<<4); //addi
			5'b00111: ctrl_sig = (8'b1<<6)|(8'b1<<5)|(8'b1<<4)|(8'b1<<3); //sw
			5'b01000: ctrl_sig = (8'b1<<7)|(8'b1<<5)|(8'b1<<4)|(8'b1<<2);//lw
			default:  ctrl_sig = 8'b0;
		endcase
	end
	
	
	
endmodule