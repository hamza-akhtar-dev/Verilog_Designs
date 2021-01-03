
//------------------------------------------------------------------
// 				Datapath for Bubble Sort Calculator
//------------------------------------------------------------------

module Datapath(
input [3:0] dataIn,
input [1:0] select, sel, 
input clk, swapAB, swapBC, swapCD, countON, 
output reg [3:0] Aout, Bout, Cout, Dout,
output reg comp
);

reg[3:0] regA, regB, regC, regD, X, Y;
reg[3:0] counter;

//------------------------------------------------------------------
//                       DeMultiplexer
//------------------------------------------------------------------
always @(sel)
begin
case(sel) 
	2'b00: regA <= dataIn;
	2'b01: regB <= dataIn;
	2'b10: regC <= dataIn;
	2'b11: regD <= dataIn;
	endcase
end

//------------------------------------------------------------------
//                       Comparator 
//------------------------------------------------------------------

always @(X or Y)
begin
	if(X > Y)
		comp <= 1'b1;
	else 
		comp <= 0;
end 

//------------------------------------------------------------------
//                       Down Counter 
//------------------------------------------------------------------

always @(posedge clk)
begin
	if(countON)
		counter <= 4'd4;
	else if (select == 2'b11)
		counter <= counter - 4'd1;
end 

//------------------------------------------------------------------
//                       Swapper_1 
//------------------------------------------------------------------

always @(swapAB)
begin
	if(swapAB)
	begin
		regA <= regB;
		regB <= regA;
	end
end

//------------------------------------------------------------------
//                       Swapper_2
//------------------------------------------------------------------

always @(swapBC)
begin
	if(swapBC)
	begin
		regB <= regC;
		regC <= regB;
	end
end

//------------------------------------------------------------------
//                       Swapper_3
//------------------------------------------------------------------

always @(swapCD)
begin
	if(swapCD)
	begin
		regC <= regD;
		regD <= regC;
	end
end


//------------------------------------------------------------------
//                       Multiplexer_1
//------------------------------------------------------------------

always @(select)
begin
	case(select) 
	2'b00: X <= regA;
	2'b01: X <= regB;
	2'b10: X <= regC;
	2'b11: X <= counter;
	endcase
end

//------------------------------------------------------------------
//                       Multiplexer_2
//------------------------------------------------------------------

always @(select)
begin
	case(select) 
	2'b00: Y <= regB;
	2'b01: Y <= regC;
	2'b10: Y <= regD;
	2'b11: Y <= 1;
	endcase
end

//------------------------------------------------------------------
//        Assigning the Sorted Values to Output Registers
//------------------------------------------------------------------

always @(regA or regB or regC or regD)
begin
	Aout <= regA;
	Bout <= regB;
	Cout <= regC;
	Dout <= regD;
end
endmodule

		
		
