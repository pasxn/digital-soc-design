library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity four_bit_adder is 
	port (a_data : in std_logic_vector(0 to 3);
			b_data : in std_logic_vector(0 to 3);
			c_in 	 : in std_logic;
			s_data : out std_logic_vector(0 to 3);
			c_out  : out std_logic);
end four_bit_adder;

architecture Behavioral of four_bit_adder is

component full_adder is
	port (x, y, z : in STD_LOGIC;
			s, c    : out STD_LOGIC);
end component;

signal c0, c1, c2: std_logic;

begin

fa0 : full_adder
port map (z => c_in, x => a_data(3), y => b_data(3), s => s_data(3), c => c0);

fa1 : full_adder
port map (z => c0, x => a_data(2), y => b_data(2), s => s_data(2), c => c1);

fa2 : full_adder
port map (z => c1, x => a_data(1), y => b_data(1), s => s_data(1), c => c2);

fa3 : full_adder
port map (z => c2, x => a_data(0), y => b_data(0), s => s_data(0), c => c_out);

end Behavioral;
