
//Verilog Code for Given Logical Circuit

module Logic(Q, A, B, C);

input A,B,C;                //Inputs

output Q;                   //Output

wire w1, w2, w3, w4;        //Input

and(w1, A, B);
or(w2, B, C);
and(w3, B, C);              //Logical Operations
and(w4, w2, w3);
and(Q, w1, w4);

endmodule

