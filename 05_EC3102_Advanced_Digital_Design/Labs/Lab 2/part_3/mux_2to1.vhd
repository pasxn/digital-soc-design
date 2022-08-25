library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity mux_2to1 is 
	port (s : in std_logic; 
		X, Y : in std_logic_vector(2 downto 0);
		M : out std_logic_vector(2 downto 0));
end mux_2to1;

architecture rtl of mux_2to1 is
begin
	M(0) <= (not (s) and X(0)) or (s and Y(0));
	M(1) <= (not (s) and X(1)) or (s and Y(1));
	M(2) <= (not (s) and X(2)) or (s and Y(2));
end rtl;