 module full_adder_tb ();
     timeunit 1ns;
     timeprecision 1ps;
     
     localparam CLK_PERIOD = 10;
     logic clk;
     
     initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
     end
     
     logic a = 0;
     logic b;
     logic c_in = 0;
     logic sum;
     logic c_out;
     
 endmodule