
//Module to implement given logic Function

module comb_logic(a,b,f);

input [1:0] a,b;
output f;

wire nota0, w1, w2, w3;

not (nota0, a[0]);
and(w1, nota0, b[0]);
and(w2, nota0, b[1]);
and(w3, b[0], b[1]);

or(f, w1, w2, w3);

endmodule


