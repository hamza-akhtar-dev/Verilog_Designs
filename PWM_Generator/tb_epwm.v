`timescale 1 ns/10 ps
module tb_epwm();
wire pulse;
reg clk, reset;
reg[3:0] d, w;
epwm UUT(.clk(clk), .reset(reset), .d(d), .w(w), .pulse(pulse));
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
	// test vector 1
	d <= 4'b0100;
	w <= 4'b0100;
	#(8*10*T);
	// test vector 2
	d <= 4'b0001;
	w <= 4'b1111;
	#(16*10*T);
	// test vector 3
	d <= 4'b1111;
	w <= 4'b0001;
	#(16*10*T);
	// test vector 4
	d <= 4'b0000;
	w <= 4'b0001;
	#(50*T);
	// test vector 5
	d <= 4'b0001;
	w <= 4'b0000;
	#(50*T) $stop;
	
end
//	RESET
//	Executes the reset sequence for the DUT
task reset_dut;
begin
	reset <= 0;
	@(posedge clk); reset <= 1;
	repeat(1) @(posedge clk); reset <= 0;
end
endtask
endmodule