library verilog;
use verilog.vl_types.all;
entity mux_2to1_vlg_sample_tst is
    port(
        s               : in     vl_logic;
        x               : in     vl_logic;
        y               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end mux_2to1_vlg_sample_tst;
