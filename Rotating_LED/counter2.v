module counter2(
input wire clk, reset, tick, rt,
output reg [4:0] dout
);

//Setting the initial value of "dout"
initial
begin
dout = 5'b00001;
end

always @(posedge tick)
begin
//Right Shift Register
if(rt)
	begin
		if((dout >> 1) == 5'b00000) dout <= 5'b10000;
		dout = dout >> 1;
	end
else 
//Left Shift Register
	begin
		if ((dout << 1) == 5'b00000) dout <= 5'b00001;
		dout = dout << 1;
	end
end
endmodule
