library ieee;
use ieee.std_logic_1164.all:

entity ff is
    port(d   : in std_logic;
        clk, : in std_logic;
        q    : out std_logic);
end ff;

architecture rtl of ff is 

begin
    proc : process(clk)
    begin
        if(clr = '1') then
            q <= d; 
        end if;
    end process proc;
end rtl;