module addr2coord(coord_x, coord_y, ADDR);

input [18:0] ADDR;
output reg [9:0] coord_x;
output reg [8:0] coord_y;

always @(*)
begin
coord_x = ADDR%10'd640;
coord_y = ADDR/10'd640;
end

endmodule