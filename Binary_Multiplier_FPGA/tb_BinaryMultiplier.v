module tb_uBinaryMultiplier;
wire[5:0] product;
wire done;
reg[2:0] inA, inB;
reg start, clk, reset;

uBinaryMultiplier M0(inA, inB, clk, reset, start, product, done);

parameter T = 10;  //Clock Period

//------------------------------------------------------------------
//     			        CLOCK GENERATOR
//------------------------------------------------------------------
initial	
begin
	clk = 0;
	forever	#(T/2)	clk=~clk;
end

//------------------------------------------------------------------
//     			    TEST SEQUENCE GENERATOR
//------------------------------------------------------------------

initial begin
//TEST SEQUENCE#1: 2 and 3
	reset_dut;
	start = 0;
	inA = 2;                  
	inB = 3; 
	#(2*T);
	start = 1;
	wait (done == 1);
	#T;

//TEST SEQUENCE#2: 6 and 5
	reset_dut;
	start = 0;
	inA = 6;
	inB = 5;
	#(2*T);
	start = 1;
	wait (done == 1);
	#T;
	
//TEST SEQUENCE#3: 3 and 7
	reset_dut;
	start = 0;
	inA = 3;
	inB = 7;
	#(2*T);
	start = 1;
	wait (done == 1);
	#T;

//TEST SEQUENCE#4: 4 and 5
	reset_dut;
	start = 0;
	inA = 4;
	inB = 5;
	#(2*T);
	start = 1;
	wait (done == 1);
	#T;

//TEST SEQUENCE#5: 7 and 7
	reset_dut;
	start = 0;
	inA = 7;
	inB = 7;
	#(2*T);
	start = 1;
	wait (done == 1);
	
//TEST SEQUENCE#6: 2 and 4	
	reset_dut;
	start = 0;
	inA = 2;
	inB = 4;
	#(2*T);
	start = 1;
	wait (done == 1);
	
	#(3*T);
	$stop;
end


//------------------------------------------------------------------
//     			        Reset Sequence
//------------------------------------------------------------------

task reset_dut;
begin
	reset <= 0;
	#(T/8);
	reset <= 1;
	#(T/4); reset <= 0;
end
endtask
endmodule
