library verilog;
use verilog.vl_types.all;
entity seven_segment_decoder is
    port(
        C               : in     vl_logic_vector(2 downto 0);
        O               : out    vl_logic_vector(6 downto 0)
    );
end seven_segment_decoder;
