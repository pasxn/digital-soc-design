library verilog;
use verilog.vl_types.all;
entity mux_5to1 is
    port(
        U               : in     vl_logic_vector(2 downto 0);
        V               : in     vl_logic_vector(2 downto 0);
        W               : in     vl_logic_vector(2 downto 0);
        X               : in     vl_logic_vector(2 downto 0);
        Y               : in     vl_logic_vector(2 downto 0);
        S               : in     vl_logic_vector(2 downto 0);
        M               : out    vl_logic_vector(2 downto 0)
    );
end mux_5to1;
