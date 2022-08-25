library verilog;
use verilog.vl_types.all;
entity mux_2to1 is
    port(
        s               : in     vl_logic;
        x               : in     vl_logic;
        y               : in     vl_logic;
        m               : out    vl_logic
    );
end mux_2to1;
