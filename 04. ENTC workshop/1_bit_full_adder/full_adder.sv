module full_adder (
    input logic a,
    input logic b,
    input logic c_in,
    output logic sum,
    output logic C_out
);
    logic wire1, wire2, wire3;

    assign wire_1 = a ^ b;
    assign wire_2 = wire_1 & c_in;
    
    always_comb begin 
        wire_3  = a & b;
    end

    assign sum = wire_1 ^ c_in;
    assign c_out = wire_2 | wire_3;
endmodule