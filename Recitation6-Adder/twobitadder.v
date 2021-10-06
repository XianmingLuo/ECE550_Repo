module twobitadder(
	input [1:0] a,b,
	input cin,
	output[0:6] HEX1, HEX0
);
reg [3:0] sum, cout;

always@(*) begin
	cout <= 0;
	sum <= a + b + cin;
end

sevensegment svsgmt0(sum, HEX0);
sevensegment svsgmt1(cout, HEX1);

endmodule
