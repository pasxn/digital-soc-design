library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity mux_8bit_2to1 is 
	port (S : in std_logic;
			X, Y : in std_logic_vector(7 downto 0);
			M : out std_logic_vector(7 downto 0));
end mux_8bit_2to1;

architecture rtl of mux_8bit_2to1 is
begin
	M(7) <= (not (S) and X(7)) or (S and Y(7));
	M(6) <= (not (S) and X(6)) or (S and Y(6));
	M(5) <= (not (S) and X(5)) or (S and Y(5));
	M(4) <= (not (S) and X(4)) or (S and Y(4));
	M(3) <= (not (S) and X(3)) or (S and Y(3));
	M(2) <= (not (S) and X(2)) or (S and Y(2));
	M(1) <= (not (S) and X(1)) or (S and Y(1));
	M(0) <= (not (S) and X(0)) or (S and Y(0));
end rtl;