library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity half_adder is
	port ( x  : in STD_LOGIC;
			 Y  : in STD_LOGIC;
			 Sh : out STD_LOGIC;
			 Ch : out STD_LOGIC);
end half_adder;

architecture Behavioral of half_adder is

begin 
	Sh <= x xor y;
	Ch <= x and y;
end Behavioral;