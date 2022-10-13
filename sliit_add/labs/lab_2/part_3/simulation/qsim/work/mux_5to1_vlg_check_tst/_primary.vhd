library verilog;
use verilog.vl_types.all;
entity mux_5to1_vlg_check_tst is
    port(
        M               : in     vl_logic_vector(2 downto 0);
        sampler_rx      : in     vl_logic
    );
end mux_5to1_vlg_check_tst;
