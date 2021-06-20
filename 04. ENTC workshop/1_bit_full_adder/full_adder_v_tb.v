 module full_adder_tb_v ();
     
     localparam CLK_PERIOD = 10;
     reg clk;
     
     initial begin
        clk = 1'b0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
     end
     
     reg a = 1'b0;
     reg b = 1'b0;
     reg c_in = 1'b0;
     wire sum;
     wire c_out;

     full_adder_v fa(.a(b), 
                     .b(b), 
                     .c_in(c_in), 
                     .sum(sum), 
                     .c_out(c_out));
     
     
     initial begin
        // simulation starts
        
        @(posedge clk);
        #(CLK_PERIOD*3);
        
        @(posedge clk);
        a <= 1'b0;
        b <= 1'b0;
        c_in <= 1'b0;
        
        @(posedge clk);
        a <= 1'b0;
        b <= 1'b0;
        c_in <= 1'b1;
        
        #(CLK_PERIOD*2);
        @(posedge clk);
        a <= 1'b1;
        b <= 1'b1;
        c_in <= 0;
        
        @(posedge clk);
        a <= 1'b1;
        b <= 1'b1;
        c_in <= 1'b1;
                       
     end
     
 endmodule