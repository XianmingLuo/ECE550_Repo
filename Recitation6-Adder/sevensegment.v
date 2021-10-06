module sevensegment(
	input [3:0]in2,
	output reg[6:0]display
);
always@(*) begin
    case(in2)
    0 : display = 7'b0000001;
    1 : display = 7'b1001111;
    2 : display = 7'b0010010;
    3 : display = 7'b0000110;
    4 : display = 7'b1001100;
    5 : display = 7'b0100100;
    6 : display = 7'b0100000;
    7 : display = 7'b0001111;
    8 : display = 7'b0000000;
    9 : display = 7'b0000100;
    default: display = 7'b1111111;
    endcase
end
endmodule
