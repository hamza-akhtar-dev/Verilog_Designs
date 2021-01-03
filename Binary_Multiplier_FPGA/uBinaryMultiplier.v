//------------------------------------------------------------------
//     Unsigned Binary Multiplier with Datapath and Controller
//------------------------------------------------------------------
module uBinaryMultiplier(
input [2:0] inA, inB,
input clk, reset, start,
output [5:0] product,
output done
);

wire Zbit, Mbit, loadRegs, addRegs, shiftReg, decrement;

//------------------------------------------------------------------
// 	      Instances of Controller and Datapath Modules
//------------------------------------------------------------------

Controller Cntrl(clk, reset, start, Zbit, 
Mbit, loadRegs, addRegs, shiftReg, 
decrement, done);

Datapath Data(inA, inB, clk, loadRegs, addRegs, 
shiftReg, decrement, Zbit,
 Mbit, product);

endmodule