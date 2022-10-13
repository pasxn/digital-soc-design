library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity full_adder is 
	port (x, y, z : in STD_LOGIC;
			s, c    : out STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is

component half_adder is
	port ( x, y   : in STD_LOGIC;
			 Sh, Ch : out STD_LOGIC);
end component;

signal S1, C1, aux : std_logic;

begin

ha1 : half_adder
port map (x => x, y=> y, Sh => S1, Ch => C1);

ha2 : half_adder
port map (x => S1, y => z, Sh => s, Ch => aux);

c <= aux or C1;

end Behavioral;
