module vga_controller(iRST_n,
                      iVGA_CLK,
							 moveUp,
							 moveDown,
							 moveLeft,
							 moveRight,
                      oBLANK_n,
                      oHS,
                      oVS,
                      b_data,
                      g_data,
                      r_data);

	
input iRST_n;
input iVGA_CLK;
input moveUp, moveDown, moveLeft, moveRight;
output reg oBLANK_n;
output reg oHS;
output reg oVS;
output [7:0] b_data;
output [7:0] g_data;  
output [7:0] r_data;                        
///////// ////                     
reg [18:0] ADDR;
reg [23:0] bgr_data;

//Current Coordination of square
reg [10:0] coord_sqX;
reg [10:0] coord_sqY;
//Current Coordinate for displaying
reg [10:0] coord_curX;
reg [10:0] coord_curY;
wire [10:0] coord_tempX;
wire [10:0] coord_tempY;
//////////////
wire VGA_CLK_n;
wire [7:0] index;
wire [23:0] bgr_data_raw;
reg  [23:0] bgr_data_square;
reg  [16:0] counter;
wire cBLANK_n,cHS,cVS,rst;
////
initial
begin
	coord_sqX <= 0;
	coord_sqY <= 0;
	bgr_data_square <= 24'h0000FF;
	counter <= 0;
end
assign rst = ~iRST_n;
video_sync_generator LTM_ins (.vga_clk(iVGA_CLK),
                              .reset(rst),
                              .blank_n(cBLANK_n),
                              .HS(cHS),
                              .VS(cVS));
////
////Addresss generator
always@(posedge iVGA_CLK,negedge iRST_n)
begin
  if (!iRST_n)
     ADDR<=19'd0;
  else if (cHS==1'b0 && cVS==1'b0)
     ADDR<=19'd0;
  else if (cBLANK_n==1'b1)
     ADDR<=ADDR+1;
end
//////////////////////////
//////INDEX addr.
assign VGA_CLK_n = ~iVGA_CLK;

img_data	img_data_inst (
	.address ( ADDR ),
	.clock ( VGA_CLK_n ),
	.q ( index )
	);
addr2coord getCoord1(coord_tempX, coord_tempY, ADDR);
/////////////////////////
//////Add switch-input logic here
always@(posedge VGA_CLK_n)
begin
if (counter == 0)
	begin
		if (moveUp == 1)
			coord_sqY <= coord_sqY - 1;
		if (moveDown == 1)
			coord_sqY <= (coord_sqY + 1)%480;
		if (moveLeft == 1)
			coord_sqX <= coord_sqX - 1;
		if (moveRight == 1)
			coord_sqX <= (coord_sqX + 1)%640;
		if (coord_sqY == 0)
			coord_sqY <= 480;
		if (coord_sqX == 0)
			coord_sqX <= 640;
	end
counter <= counter + 1;
end
//////Color table output
//fetch data according to index
//module img_index(address, clock, q)
img_index	img_index_inst (
	.address ( index ),
	.clock ( iVGA_CLK ),
	.q ( bgr_data_raw)
	);	
//////
//////latch valid data at falling edge;
always@(posedge VGA_CLK_n) 
begin
coord_curX <= coord_tempX;
coord_curY <= coord_tempY;
if ((coord_curX >= coord_sqX) && (coord_curX <= coord_sqX + 50) && (coord_curY >= coord_sqY) && (coord_curY <= coord_sqY + 50)) // display background
	begin
	bgr_data <= bgr_data_square;
	end
else
	begin
	bgr_data <= bgr_data_raw;
	end
end
//split bgr data
assign b_data = bgr_data[23:16];
assign g_data = bgr_data[15:8];
assign r_data = bgr_data[7:0]; 
///////////////////
//////Delay the iHD, iVD,iDEN for one clock cycle;
always@(negedge iVGA_CLK)
begin
  oHS<=cHS;
  oVS<=cVS;
  oBLANK_n<=cBLANK_n;
end

endmodule
 	















