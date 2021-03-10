
module counter1(                                              
input clk, reset, pause, fast,
output tick 
);

reg[3:0] count1 = 0, count2 = 0;

parameter DIVISOR1 = 2, DIVISOR2 = 4;

always @(posedge clk)
begin

if(!pause)
begin
 //------------Clock Divider 1--------------//
	if(fast)
	begin
		count1 <= count1 + 1;                               
		if (count1 >= DIVISOR1 - 1) count1 <= 0;   //Increases Base Clock period by 2 times
	end	
 //------------Clock Divider 2--------------//	
	if(!fast)
	begin
		count2 <= count2 + 1;                                
		if (count2 >= DIVISOR2 - 1) count2 <= 0;   //Increases Base Clock period by 4 times           
	end
end
end 
 //------------Multiplexer-----------------//
 
assign tick = (fast) ? ((count1 < DIVISOR1/2) ? 1'b0 : 1'b1) : ((count2 < DIVISOR2/2) ? 1'b0 : 1'b1);

endmodule


