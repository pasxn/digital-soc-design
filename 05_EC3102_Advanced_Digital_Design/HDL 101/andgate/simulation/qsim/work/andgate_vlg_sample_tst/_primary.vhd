library verilog;
use verilog.vl_types.all;
entity andgate_vlg_sample_tst is
    port(
        ii1             : in     vl_logic;
        ii2             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end andgate_vlg_sample_tst;
