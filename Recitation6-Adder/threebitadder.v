module threebitadder(
	input [2:0] a,b,
	input cin,
	output[0:6] HEX2, HEX1, HEX0
);
reg [3:0] sum, cout;

always@(*) begin
	cout <= 0;
	sum <= a + b + cin;
end

sevensegment svsgmt0(sum%10, HEX0);
sevensegment svsgmt1(sum/10, HEX1);
sevensegment svsgmt2(cout, HEX2);

endmodule
