`timescale 1 ns/10 ps
module tb_enhanced_prio();
wire [3:0] fst, snd;
reg [9:0] r;
// Instantiation of enhanced_prio module
enhanced_prio UUT(.fst(fst), .snd(snd), .r(r));
// Test vector generator
initial
begin
	  // test vector 1
      r <= 10'b0000000000; 
      #200;
      // test vector 2
      r <= 10'b0000000100; 
      #200;
      // test vector 3
      r <= 10'b0000001001; 
      #200;
      // test vector 4
      r <= 10'b0000101001; 
      #200;
      // test vector 5
      r <= 10'b0001101001; 
      #200;
      // test vector 6
      r <= 10'b1101101001; 
      #200;
      // test vector 7
      r <= 10'b1111111111; 
      #200;
      // test vector 8
      r <= 10'b1000000000;
      #200 $stop;
      // terminate simulation
end
endmodule