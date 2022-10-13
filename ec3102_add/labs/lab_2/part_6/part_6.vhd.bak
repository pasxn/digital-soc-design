library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity part_5 is
	port(SW : in std_logic_vector(17 downto 0); 
		HEX0 : out std_logic_vector(0 to 6);
		HEX1 : out std_logic_vector(0 to 6);
		HEX2 : out std_logic_vector(0 to 6);
		HEX3 : out std_logic_vector(0 to 6);
		HEX4 : out std_logic_vector(0 to 6));
end part_5;

architecture behavior of part_5 is

component mux_5to1
	port(U, V, W, X, Y : in std_logic_vector(2 downto 0);
		S : in std_logic_vector(2 downto 0);
		M : out std_logic_vector(2 downto 0));
end component;

component seven_segment_decoder
	port(C : in std_logic_vector(2 downto 0);
		O : out std_logic_vector(0 to 6));
end component;

signal M0 : std_logic_vector(2 downto 0);
signal M1 : std_logic_vector(2 downto 0);
signal M2 : std_logic_vector(2 downto 0);
signal M3 : std_logic_vector(2 downto 0);
signal M4 : std_logic_vector(2 downto 0);

begin

	MUX0 : mux_5to1
	port map(S => SW(17 DOWNTO 15), U => SW(14 DOWNTO 12), 
			V => SW(11 DOWNTO 9), W => SW(8 DOWNTO 6), 
			X => SW(5 DOWNTO 3), Y => SW(2 DOWNTO 0), M => M0);
	
	H0 : seven_segment_decoder
	port map(C => M0, O => HEX0);
	
	MUX1 : mux_5to1
	port map(S => SW(17 DOWNTO 15), U => SW(11 DOWNTO 9), 
			V => SW(8 DOWNTO 6), W => SW(5 DOWNTO 3), 
			X => SW(2 DOWNTO 0), Y => SW(14 DOWNTO 12), M => M1);
	
	H1 : seven_segment_decoder
	port map(C => M1, O => HEX1);
	
	MUX2 : mux_5to1
	port map(S => SW(17 DOWNTO 15), U => SW(8 DOWNTO 6), 
			V => SW(5 DOWNTO 3), W => SW(2 DOWNTO 0), 
			X => SW(14 DOWNTO 12), Y => SW(11 DOWNTO 9), M => M2);
	
	H2 : seven_segment_decoder
	port map(C => M2, O => HEX2);
	
	MUX3 : mux_5to1
	port map(S => SW(17 DOWNTO 15), U => SW(5 DOWNTO 3), 
			V => SW(2 DOWNTO 0), W => SW(14 DOWNTO 12), 
			X => SW(11 DOWNTO 9), Y => SW(8 DOWNTO 6), M => M3);
	
	H3 : seven_segment_decoder
	port map(C => M3, O => HEX3);
	
	MUX4 : mux_5to1
	port map(S => SW(17 DOWNTO 15), U => SW(2 DOWNTO 0), 
			V => SW(14 DOWNTO 12), W => SW(11 DOWNTO 9), 
			X => SW(8 DOWNTO 6), Y => SW(5 DOWNTO 3), M => M4);
	
	H4 : seven_segment_decoder
	port map(C => M4, O => HEX4);

end behavior;