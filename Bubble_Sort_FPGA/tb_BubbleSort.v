
module tb_BubbleSort();

reg [3:0] dataIn;
reg[1:0] sel;
reg clk, rst, sort;

wire done;
wire [3:0] Aout, Bout, Cout, Dout;

BubbleSort uut(.dataIn(dataIn),
.sel(sel), .clk(clk), .rst(rst), .sort(sort),
.Aout(Aout), .Bout(Bout), .Cout(Cout), .Dout(Dout),
.done(done));

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
//     			     TEST ARRAY GENERATOR
//------------------------------------------------------------------

initial
begin
//TEST ARRAY ONE [4, 3, 2, 1]
	reset_dut;
	#40
	sort <= 1'b0;
	sel <= 2'b00;
	dataIn <= 4'd4;
	#40
	sel <= 2'b01;
	dataIn <= 4'd3;
	#40
	sel <= 2'b10;
	dataIn <= 4'd2;
	#40
	sel <= 2'b11;
	dataIn <= 4'd1;
	sort <= 1'b1;
	#300
	
//TEST ARRAY TWO [9, 7, 15, 12]
	reset_dut;
	#40
	sort <= 1'b0;
	sel <= 2'b00;
	dataIn <= 4'd9;
	#40
	sel <= 2'b01;
	dataIn <= 4'd7;
	#40
	sel <= 2'b10;
	dataIn <= 4'd15;
	#40
	sel <= 2'b11;
	dataIn <= 4'd12;
	sort <= 1'b1;
	#300
	
//TEST ARRAY THREE[11, 8, 3, 2]
	reset_dut;
	#40
	sort <= 1'b0;
	sel <= 2'b00;
	dataIn <= 4'd9;
	#40
	sel <= 2'b01;
	dataIn <= 4'd7;
	#40
	sel <= 2'b10;
	dataIn <= 4'd15;
	#40
	sel <= 2'b11;
	dataIn <= 4'd12;
	sort <= 1'b1;
	#300
	
//TEST ARRAY FOUR[15, 13, 8, 1]
	reset_dut;
	#40
	sort <= 1'b0;
	sel <= 2'b00;
	dataIn <= 4'd15;
	#40
	sel <= 2'b01;
	dataIn <= 4'd13;
	#40
	sel <= 2'b10;
	dataIn <= 4'd8;
	#40
	sel <= 2'b11;
	dataIn <= 4'd1;
	sort <= 1'b1;
	#300
	$stop;
	
end

//------------------------------------------------------------------
//     			        Reset Sequence
//------------------------------------------------------------------

task reset_dut;
begin
	rst <= 1;
	#(T/4); rst <= 0;
end
endtask
endmodule





		
		
