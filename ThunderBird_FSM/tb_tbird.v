module tb_tbird();
reg clk, reset, left, right, haz;
wire[5:0] light;
tbird_fsm uut(clk, reset, left, right, haz, light);
parameter T = 10;	// clk period
// Clock generator
initial	
begin
	clk = 0;
	forever	#(T/2)	clk=~clk;
end
// Test vector generator
initial
begin
	reset_dut;
	left <= 0;
    right <= 0;
    haz <= 0;
	@(negedge clk);
	// test left turn
	left <= 1;
	repeat(7) @(negedge clk);
	// test right turn
	left <= 0;
	right <= 1;
	repeat(5) @(negedge clk);
	// test hazard
	wait (light == 6'b000110);
	haz <= 1;
	repeat(5) @(negedge clk);
	// resume right turn
	haz <= 0;
	repeat(4) @(negedge clk);
	// return to idle
	right <= 0;
	repeat(5) @(negedge clk);
	$stop;
end
//	RESET
//	Executes the reset sequence for the DUT
task reset_dut;
begin
	reset <= 1;
	#(T/4); reset <= 0;
end
endtask
endmodule