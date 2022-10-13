library ieee;
use ieee.std_logic_1164.all;

entity comparator is
    generic (n : integer := 8);
    port(a: in std_logic_vector(n-1 downto 0);
    b: in std_logic_vector(n-1 downto 0);
    g: out std_logic;
    l: out std_logic;
    e: out std_logic);
end comparator;
  
architecture rtl of comparator is
begin
    comp : process( a , b )
    begin
        g <= '0';
        l <= '0';
        e <= '0';
        if(a > b) then 
            g <= '1';
        elsif(a < b) then
            l <= '1';
        else
            e <= '1';
        end if;
    end process ; -- comp
end rtl;