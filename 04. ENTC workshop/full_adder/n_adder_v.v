module n_adder
#(
    parameter N
)(
    input [N-1:0] A,
    input [N-1:0] B,
    input c_in,
    output [N-1:0] S,
    output c_out 
);
    reg [N-1:0] S;
    reg c_out;

    reg [N:0] C;
    assign C[0] = c_in;
    assign C[N] = c_out;

    genvar i;
    for (genvar i=0; i<N; i++) begin:add
        full_adder_v fa (
            .a      (A[i]),
            .b      (B[i]),
            .c_in   (C[i]),
            .c_out  (C[i+1]),
            .sum    (S[i])
        );
    end
endmodule