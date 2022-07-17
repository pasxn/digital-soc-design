library verilog;
use verilog.vl_types.all;
entity andgate is
    port(
        ii1             : in     vl_logic;
        ii2             : in     vl_logic;
        o               : out    vl_logic
    );
end andgate;
