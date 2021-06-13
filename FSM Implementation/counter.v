module counter 
        #(parameter COUNTER_WIDTH = 4)
        (clk, rst_n, act, up_dwn_n); // system clock | an active low reset | the activate signal | count up ? 1 : 0

    input clk;
    input rst_n;
    input act;
    input up_dwn_n;
    output [COUNTER_WIDTH - 1:0] count;
    output ovflow;
    reg ovflow;
    reg [COUNTER_WIDTH - 1:0] count;
    reg [3:0] state, next_state;

    // contonue

endmodule 