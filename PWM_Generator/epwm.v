
//Module to Generate PWM
module epwm(input clk, reset , input [3:0] d, w, output reg pulse);  // I-O Ports Declaration
reg[3:0] d_reg ;
reg[3:0] w_reg ;
always @(posedge clk)       //Positive Edge Triggering
begin
	if(reset)
		begin
		d_reg <= 0;
		w_reg <= 0;         //Reset sequence
		pulse <= 0;
		end		
	if (d_reg < d)                          //Comparator 1 for the comparison of "d_register" and "d"
		begin
			d_reg <= d_reg + 1;             //Counter 1 for "d_register"
			pulse <= 1'b0;
		end 
		
	if (d_reg == d)
		begin
		if (w_reg < w)                      //Comparator 2 for the comparison of "w_register" and "w"
		begin
			w_reg = w_reg + 1;              //Counter 2 for "w_register"
			pulse <= 1'b1;
		end
		if(w_reg == w)
		begin
			d_reg <= 0;						//Resetting both registers to zero
			w_reg <= 0;
		end
	end
end
endmodule



