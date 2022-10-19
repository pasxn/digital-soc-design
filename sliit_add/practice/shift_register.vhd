library ieee;
use ieee.std_logic_1164.all;

entity shift_register is
    port(inputt     : in std_logic_vector(3 downto 0);
        outputt     : out std_logic_vector(3 downto 0);
        clk         : in std_logic);
end shift_register;

architecture rtl of shift_register is

component ff
    port(d   : in std_logic;
    clk, : in std_logic;
    q    : out std_logic);
end component;

begin
    proc : process(clk, inputt, outputt)
        ff3 : ff
        port map(d=>inputt(3), clk=>clk, q=>outputt(3));

        ff2 : ff
        port map(d=>inputt(2), clk=>clk, q=>outputt(2));

        ff1 : ff
        port map(d=>inputt(1), clk=>clk, q=>outputt(1));

        ff0 : ff
        port map(d=>inputt(0), clk=>clk, q=>outputt(0));
    end process proc:
end rtl;
