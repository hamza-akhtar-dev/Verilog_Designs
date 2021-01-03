
//------------------------------------------------------------------
// 					Controller for Bubblesort
//------------------------------------------------------------------

module Controller(

input clk, rst, comp, sort,
output reg done, swapAB, swapBC, swapCD, countON, 
output reg [1:0] select

);

//------------------------------------------------------------------
// 						Registry States
//------------------------------------------------------------------

reg [3:0] currentState, nextState;

//------------------------------------------------------------------
// 			 Local Parameters All Possible States
//------------------------------------------------------------------

parameter
WAITING  = 4'b0000,
SORTING1 = 4'b0001,
SORTING2 = 4'b0010,
SORTING3 = 4'b0011,
SORTING4 = 4'b0100,
SWAPAB   = 4'b0101,
SWAPBC   = 4'b0110,
SWAPCD   = 4'b0111,
SORTED 	 = 4'b1000;

//------------------------------------------------------------------
// 					Transition to Next State
//------------------------------------------------------------------

always @(posedge clk or posedge rst)
begin
	if(rst)
		currentState <= WAITING;
	else 
		currentState <= nextState;
end	

//------------------------------------------------------------------
// 			    Resetting Counter to Initial State
//------------------------------------------------------------------

always @(posedge sort)
begin
	countON <= 1;
end	

//-----------------------------------------------------------------
//                   Next State Selection 
// "Comments describe every state transiton according to STG"
//------------------------------------------------------------------

always @(*)
begin
    nextState <= WAITING;
	case(currentState)
		WAITING:                                //WAITING FOR INPUT 
		begin
			if(sort) nextState <= SORTING1;
		end
		SORTING1:                               //SORTING PHASE I (Comparing registers A and B)
		begin
			if(comp)
				nextState <= SWAPAB;
			else 
				nextState <= SORTING2;
		end
		
		SORTING2:								//SORTING PHASE II (Comparing registers B and C)
		begin
			if(comp)
				nextState <= SWAPBC;
			else 
				nextState <= SORTING3;
		end
		
		SORTING3:   						    //SORTING PHASE III (Comparing registers C and D)
		begin
			if(comp)
				nextState <= SWAPCD;
			else 
				nextState <= SORTING4;
		end
		
		SORTING4:								//SORTING PHASE IV (Decrementing Counter)
		begin
			if(comp)
				nextState <= SORTING1;
			else 
				nextState <= SORTED;
		end
		
		SORTED:									//SORTED STATE
		begin
			nextState <= SORTED;
		end
		
		SWAPAB:									//SWAPPING REGISTERS A and B
		begin
			nextState <= SORTING2;
		end
	    
		SWAPBC:									//SWAPPING REGISTERS B and C
		begin
			nextState <= SORTING3;		
		end
		
		SWAPCD:									//SWAPPING REGISTERS C and D
		begin
			nextState <= SORTING1;
		end
	endcase
end

//------------------------------------------------------------------
// 			Determining the Outputs of the Controller
//-----------------------------------------------------------------

always @(*)
begin
	case(currentState)
	
		//Waiting Signal to Datapath
		
		WAITING: done <= 0;
		
		//Sorting Signals to Datapath
		SORTING1:begin select <= 2'b00; countON <= 0; end
		SORTING2:begin select <= 2'b01;  end
		SORTING3:begin select <= 2'b10;  end
		SORTING4:begin select <= 2'b11;  end
		
		//Swapping Signals to Datapath
		SWAPAB:begin swapAB <= 1; swapBC <= 0; swapCD <= 0; end
		SWAPBC:begin swapAB <= 0; swapBC <= 1; swapCD <= 0; end
		SWAPCD:begin swapAB <= 0; swapBC <= 0; swapCD <= 1; end
		 
		//Asserting "done" when successfully sorted data
		SORTED: done <= 1; 
	endcase
end

endmodule
	
	




