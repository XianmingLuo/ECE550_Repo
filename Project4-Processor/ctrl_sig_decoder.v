module ctrl_sig_decoder(ctrl_sig, opcode);
   
	//Inputs
	input [4:0] opcode;
	//Output
	//12		11		10		9			8		7		6		5			4		3		2		1		0
	//Rst		JPr	BRlt	ALUfunc	Rwd2	Rwe	Rsrc2	ALUinB	ALUop	DMwe	Rwd	BRne	JP
	output reg [12:0] ctrl_sig;
	//Random Logic
	always @(*) begin
		case(opcode)
			5'b00000: ctrl_sig = (12'b1<<9)|(12'b1<<7); //add, sub, and, or, sll, sra
			5'b00001: ctrl_sig = (12'b1<<0); //j
			5'b00010: ctrl_sig = (12'b1<<6)|(12'b1<<4)|(12'b1<<1); //bne
			5'b00011: ctrl_sig = (12'b1<<0)|(12'b1<<7)|(12'b1<<8);//jal
			5'b00100: ctrl_sig = (12'b1<<11)|(12'b1<<6)|(12'b1<<0);//jr
			5'b00101: ctrl_sig = (12'b1<<7)|(12'b1<<5); //addi
			5'b00110: ctrl_sig = (12'b1<<6)|(12'b1<<4)|(12'b1<<10); //blt
			5'b00111: ctrl_sig = (12'b1<<6)|(12'b1<<5)|(12'b1<<3); //sw
			5'b01000: ctrl_sig = (12'b1<<7)|(12'b1<<5)|(12'b1<<2);//lw
			5'b10110: ctrl_sig = (12'b1<<12)|(12'b1<<4)|(12'b1<<0);// bex
			5'b10101: ctrl_sig = (12'b1<<12)|(12'b1<<7);// setx
			default:  ctrl_sig = 12'b0;
		endcase
	end
	
	
	
endmodule