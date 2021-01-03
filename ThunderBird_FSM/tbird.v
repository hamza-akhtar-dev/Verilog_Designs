
//------------------------------------------------------------------
// Ford Thunder Bird Turn Indicator FSM
//------------------------------------------------------------------

module tbird_fsm (
input  clk, reset, left, right, haz,
output reg [5:0] light
);

//------------------------------------------------------------------
// Registry States
//------------------------------------------------------------------
 
reg[2:0] state, nextstate;

//------------------------------------------------------------------
// Local Parameters All Possible States
//------------------------------------------------------------------  

parameter
	IDLE   = 3'b000,
	R1     = 3'b001,
	R2     = 3'b010,
	R3     = 3'b011,                          
	L1     = 3'b100,
	L2     = 3'b101,
	L3     = 3'b110,
	HAZARD = 3'b111;

//------------------------------------------------------------------
// Change Current to Next State
//------------------------------------------------------------------

always @(negedge clk or posedge reset)
begin 
	if(reset)
		state <= IDLE;
	else
		state <= nextstate;
end

//------------------------------------------------------------------
// Starting Immediate Hazard Sequence "when haz == 1"
//------------------------------------------------------------------

always @(posedge haz) state <= HAZARD;
always @(negedge haz) state <= IDLE;

//------------------------------------------------------------------
//                   Next State Selection 
// "Comments describe every state transiton according to STG"
//------------------------------------------------------------------

always @(*)
begin

nextstate <= IDLE;

case(state)
	IDLE:begin
		if(!left && !right)
			nextstate = IDLE;       //IDLE when left == 0 and right == 0

		if(right)
			nextstate <= R1;        //R1 when right == 1        
													 
		if(left)
			nextstate <= L1;		//L1 when right == 1
		if(haz)
			nextstate <= HAZARD;	//HAZARD when haz == 1
		end

	L1:    nextstate <= L2;			//L2 when haz == 0
		
	L2:    nextstate <= L3;			//L3 when haz == 0
		
	L3:    nextstate <= IDLE;		//Always transits to IDLE

	R1:    nextstate <= R2;			//R2 when haz == 0
			
	R2:    nextstate <= R3;			//R3 when haz == 0
		
	R3:	   nextstate <= IDLE;		//Always transits to IDLE
	
	HAZARD:nextstate <= IDLE;		//Always transits to IDLE
endcase
end

//---------------------------------------------------------------
// Output Combinational Logic
//---------------------------------------------------------------

always @(*)
begin

light <= 6'b000000;

case(state)
	HAZARD:light <= 6'b111111;
	
	IDLE:  light <= 6'b000000;
		
	L1:    light <= 6'b001000;
		
	L2:    light <= 6'b011000;

	L3:    light <= 6'b111000;

	R1:    light <= 6'b000100;

	R2:    light <= 6'b000110;

	R3:    light <= 6'b000111;
endcase
end

endmodule








	



			
		