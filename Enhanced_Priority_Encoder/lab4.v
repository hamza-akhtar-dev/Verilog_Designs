
module prio(
    input wire [9:0] r_1,
    output reg [3:0] fst_1,
);
  
  integer i;
  
  always @* 
  begin
    fst_1 = 4'b1111;
    
	for (i=9; i>=0; i=i-1)
	begin
        if (r[i])
		begin
			fst_1 = i;
			i = -1;
		end
	end	
  end
  
endmodule

module enhanced_prio(
	input wire [9:0] r,
    output reg [3:0] fst, snd
);  

	integer j;
	 
	 always @*  begin
	
	j = prio(r, fst);
	
	snd = 4'b1111;
	for (i=j-1; i>=0; i=i-1)
	begin
        if (r[i])
		begin
			snd = i;
			i = -1;
		end
	end
end	
	
endmodule
