module counter_tb
  parameter WIDTH = 5;
  reg clk;
  reg rst_n;
  reg act;
  reg up_dwn_n;
  wire [WIDTH-1:0] count;
  wire ovflw;

  counter #(WIDTH) DUT (.clk(clk), 
                        .rst_n(rst_n), 
                        .act(act), 
                        .up_dwn_n(up_dwn_n), 
                        .count(count), 
                        .ovflw(ovflw));

  initial begin
    clk = 1'b1;
    rst_n = 1'b0; //active reset
    act = 1'b0;
    up_dwn_n = 1'b1;

    // monitoring changes
    $monitor("t%: rst_n=%b, act=%b, up_dwn_n=%b, count=%d, ovflw=%b\n", $time, rst_n, act, up_dwn_n, count, ovflw);

    // release reset after 100 time steps
    #100 rst_n = 1'b1;
  end

  always
    #5 clk = ~clk;
  
  // stimuli
  initial begin
    // @100 timesteps timer starts counting 
    // until it overflows 
    #100 act = 1'b1;
         up_dwn_n = 1'b1;
    // reset after 10 cycles of pulse
    #1000 rst_n = 1'b0;
          act = 1'b0;
    #100  rst_n = 1'b1;
    // count up to 4 and count down to overflow
    #100 act = 1'b1;
         up_dwn_n = 1'b1;
    #40  up_dwn_n = 1'b0;
  end
endmodule