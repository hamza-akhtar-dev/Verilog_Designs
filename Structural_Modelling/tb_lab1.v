// TestBench Code for the Circuit of Figure 1
`timescale 1 ns /10 ps // time-unit = 1 ns
// precesion = 10 ps
module tb_Logic;
wire Q;
reg A, B ,C;
localparam period = 10;
Logic UUT(Q, A, B, C);
initial // Executes only once
begin
// Values for A , B and C
A = 0; B = 0; C = 0;
#period; // wait for period
A = 0; B = 0; C = 1;
#period;
A = 0; B = 1; C = 0;
#period;
A = 0; B = 1; C = 1;
#period;
A = 1; B = 0; C = 0;
#period;
A = 1; B = 0; C = 1;
#period;
A = 1; B = 1; C = 0;
#period;
A = 1; B = 1; C = 1;
#period;
end
endmodule
