//Top_Level Module
module rotate_led(
input wire clk_FPGA, reset, pause, rt, fast,
output wire [4:0] dout
);

//Creating Instances of Two Counter Modules

clock_divider CDV (.clk_in(clk_FPGA), .clk_out(clk_div));
counter1 CNT1 (.clk(clk_div), .reset(reset), .pause(pause), .fast(fast), .tick(tick));
counter2 CNT2 (.clk(clk_div), .reset(reset), .tick(tick), .rt(rt), .dout(dout));

endmodule



