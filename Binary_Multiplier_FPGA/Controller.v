//------------------------------------------------------------------
// 			Controller for Unsigned Binary Multiplier
//------------------------------------------------------------------
module Controller(
input clk, reset, start, Zbit, Mbit,
output reg loadRegs, addRegs, shiftReg, decrement, done
);

//------------------------------------------------------------------
// 			 Local Parameters All Possible States
//------------------------------------------------------------------

parameter 
WAITING  = 2'b00,
ADDING 	=  2'b01,
SHIFTING = 2'b10,
DONE = 2'b11;

//------------------------------------------------------------------
// 						Registry States
//------------------------------------------------------------------

reg [1:0] currentState, nextState;

//------------------------------------------------------------------
// 					Transition to Next State
//------------------------------------------------------------------

always @ (posedge clk or posedge reset)
begin
	if (reset) currentState <= WAITING; 
	else currentState <= nextState;
end

//-----------------------------------------------------------------
//                   Next State Selection 
// "Comments describe every state transiton according to STG"
//------------------------------------------------------------------

always @(*) 
begin
	case(currentState)
	WAITING:                          //WAITING for Input
	begin  
		if(start) 
			nextState <= ADDING;
		else 
			nextState <= WAITING;
	end

	ADDING: 				//ADDING multiplicand if Mbit is "1"
	begin 
		nextState <= SHIFTING; 
	end

	SHIFTING: 				//SHIFTING registers "1" bit to right 								
	begin                           
		if(Zbit)
		begin
			nextState <= DONE;
		end
		else 
			nextState <= ADDING;
	end
	
	DONE:                  //DONE "Product is Obtained"
	begin 
		nextState <= WAITING;
	end

	default : nextState <= WAITING;

	endcase
end

//-----------------------------------------------------------------
// 			Determining the Outputs of the Controller
//-----------------------------------------------------------------

always @(*)
begin
	case (currentState)
	WAITING:
	begin
		shiftReg <= 0;
		loadRegs <= 1;
		done <= 0;
	end

	ADDING: 
	begin
		shiftReg <= 0;
		decrement <= 1;
		loadRegs <= 0;
		if(Mbit) 
			addRegs <= 1;
	end

	SHIFTING: 
	begin 
		shiftReg <= 1;
		addRegs <= 0;
		decrement <= 0;
	end
	
	DONE:
	begin 
		done <= 1;
	end

	default : nextState = WAITING;
	endcase
end

endmodule
