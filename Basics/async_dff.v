module async_dff (d,q);

input d;
output q;
reg out;

always @(posedge clk or negedge reset_)
    if (~reset_)
        q<=0;
    else
        q<=d;
    
endmodule