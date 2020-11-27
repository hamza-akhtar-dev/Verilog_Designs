`timescale 1 ns/10 ps

module tb_rotate_led();

reg clk, reset, pause, fast, rt;
wire [4:0] dout;

rotate_led UUT(.clk(clk), .reset(reset), .pause(pause), .fast(fast), .rt(rt), .dout(dout));

//Period of the Base Clock
parameter T = 20;

initial	
begin
	clk = 0;
	forever	#(T/2)	clk=~clk;
end

initial
begin
    //Test Vector # 1
	pause <= 0;
	rt <= 1;
	fast <= 1;
	reset_dut;
	#250
	//Test Vector # 2
	pause <= 1;
	rt <= 1;
	fast <= 1;
	#40
	//Test Vector # 3
	pause <= 0;
	rt <= 1;
	fast <= 1;
	#160
	//Test Vector # 4
	pause <= 0;
	rt <= 0;
	fast <= 1;
	#640
	//Test Vector # 5
	pause <= 0;
	rt <= 1;
	fast <= 0;
	#500
	//Test Vector # 6
	pause <= 0;
	rt <= 0;
	fast <= 0;
	#800
	$stop;
end

//Reset Sequence Task
task reset_dut;
	begin
		reset <= 1;
		@(posedge clk); reset <= 0;
	end
endtask
endmodule


