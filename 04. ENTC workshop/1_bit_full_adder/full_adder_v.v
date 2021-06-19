module full_adder_v (
    input a,
    input b,
    input c_in,
    output sum,
    output c_out
);

    reg sum;
    reg c_out;
    reg wire_1, wire_2, wire_3;

    always@* begin
        wire_1 = a ^ b;
        wire_2 = wire_1 & c_in;
        wire_3  = a & b;
        sum = wire_1 ^ c_in;
        c_out = wire_2 | wire_3;
    end

endmodule