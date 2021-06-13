`define CLK_PERIOD 10 

module testbench_1 ();
    reg clk;
    initial begin
        clk = 0;
    end

    always
        #(CLK_PERIOD/2) clk = ~clk; 
endmodule