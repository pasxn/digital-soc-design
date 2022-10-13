library verilog;
use verilog.vl_types.all;
entity mux_5to1_vlg_sample_tst is
    port(
        S               : in     vl_logic_vector(2 downto 0);
        U               : in     vl_logic_vector(2 downto 0);
        V               : in     vl_logic_vector(2 downto 0);
        W               : in     vl_logic_vector(2 downto 0);
        X               : in     vl_logic_vector(2 downto 0);
        Y               : in     vl_logic_vector(2 downto 0);
        sampler_tx      : out    vl_logic
    );
end mux_5to1_vlg_sample_tst;
