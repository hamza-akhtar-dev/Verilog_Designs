// TestBench Code for the Circuit of Figure 1
`timescale 1 ns /10 ps // time-unit = 1 ns
// precesion = 10 ps
module tb_comb_logic;
wire f;
reg[1:0] a, b;
localparam period = 10;
comb_logic UUT(a, b, f);
initial // Executes only once
begin
a = 0; b = 0;
#period;
a = 0; b = 1;
#period;
a = 0; b = 2;
#period;
a = 0; b = 3;
#period;
a = 1; b = 0;
#period;
a = 1; b = 1;
#period;
a = 1; b = 2;
#period;
a = 1; b = 3;
#period;
a = 2; b = 0;
#period;
//
a = 2; b = 1;
#period;
a = 2; b = 2;
#period;
a = 2; b = 3;
#period;
a = 3; b = 0;
#period;
a = 3; b = 1;
#period;
a = 3; b = 2;
#period;
a = 3; b = 3;
#period;
end
endmodule