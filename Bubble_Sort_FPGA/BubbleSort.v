
//------------------------------------------------------------------
//     Bubble Sort Calculator FSM with Datapath and Controller
//------------------------------------------------------------------

module BubbleSort(

input [3:0] dataIn,
input [1:0] sel,
input clk, rst, sort,
output wire [3:0] Aout, Bout, Cout, Dout,
output wire done

);

wire[3:0] select;
wire comp;

//------------------------------------------------------------------
// 	      Instances of Controller and Datapath Modules
//------------------------------------------------------------------

Controller BubbleCtrl(.clk(clk), .rst(rst), .comp(comp), .sort(sort), 
.done(done), .swapAB(swapAB), .swapBC(swapBC), .swapCD(swapCD), .countON(countON),
.select(select));

Datapath BubbleData(.dataIn(dataIn),
.select(select), .sel(sel), .clk(clk), .swapAB(swapAB), .swapBC(swapBC), .swapCD(swapCD), 
.countON(countON), .Aout(Aout), .Bout(Bout), .Cout(Cout), .Dout(Dout), .comp(comp));

endmodule




