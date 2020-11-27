//Top_Level Module
module rotate_led(
input wire clk, reset, pause, rt, fast,
output wire [4:0] dout
);

//Creating Instances of Two Counter Modules

counter1 inst1 (.clk(clk), .reset(reset), .pause(pause), .fast(fast), .tick(tick));
counter2 inst2 (.clk(clk), .reset(reset), .tick(tick), .rt(rt), .dout(dout));

endmodule
