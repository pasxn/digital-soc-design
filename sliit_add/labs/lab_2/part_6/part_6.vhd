library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity part_6 is
	port(SW : in std_logic_vector(17 downto 0); 
		HEX0 : out std_logic_vector(0 to 6);
		HEX1 : out std_logic_vector(0 to 6);
		HEX2 : out std_logic_vector(0 to 6);
		HEX3 : out std_logic_vector(0 to 6);
		HEX4 : out std_logic_vector(0 to 6);
		HEX5 : out std_logic_vector(0 to 6);
		HEX6 : out std_logic_vector(0 to 6);
		HEX7 : out std_logic_vector(0 to 6));
end part_6;

architecture behavior of part_6 is

component mux_5to1
	port(S, U, V, W, X, Y, Z, A, B : in std_logic_vector(2 downto 0);
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
signal M5 : std_logic_vector(2 downto 0);
signal M6 : std_logic_vector(2 downto 0);
signal M7 : std_logic_vector(2 downto 0);

begin

	MUX0 : mux_5to1
	port map((17 DOWNTO 15), "", "", "", (15 DOWNTO 12), 
		(11 DOWNTO 9), (8 DOWNTO 6), (5 DOWNTO 3), (2 DOWNTO 0), M0);
	
	H0 : seven_segment_decoder
	port map(C => M0, O => HEX0);
	
	MUX1 : mux_5to1
	port map(((17 DOWNTO 15), "", "", (15 DOWNTO 12), (11 DOWNTO 9), 
		(8 DOWNTO 6), (5 DOWNTO 3), (2 DOWNTO 0), "", M0);
	
	H1 : seven_segment_decoder
	port map(C => M1, O => HEX1);
	
	MUX2 : mux_5to1
	port map((17 DOWNTO 15), "", (15 DOWNTO 12), (11 DOWNTO 9), (8 DOWNTO 6), 
		(5 DOWNTO 3), (2 DOWNTO 0), "", "", M0);
	
	H2 : seven_segment_decoder
	port map(C => M2, O => HEX2);
	
	MUX3 : mux_5to1
	port map((17 DOWNTO 15), (15 DOWNTO 12), (11 DOWNTO 9), 
		(8 DOWNTO 6), (5 DOWNTO 3), (2 DOWNTO 0), "", "", "", M0);
	
	H3 : seven_segment_decoder
	port map(C => M3, O => HEX3);
	
	MUX4 : mux_5to1
	port map((17 DOWNTO 15), (11 DOWNTO 9), (8 DOWNTO 6), 
		(5 DOWNTO 3), (2 DOWNTO 0), "", "", "", (15 DOWNTO 12), M0);
	
	H4 : seven_segment_decoder
	port map(C => M4, O => HEX4);
	
	MUX5 : mux_5to1
	port map((17 DOWNTO 15), (8 DOWNTO 6), (5 DOWNTO 3), 
		(2 DOWNTO 0), "", "", "", (15 DOWNTO 12), (11 DOWNTO 9), M0);
	
	H5 : seven_segment_decoder
	port map(C => M5, O => HEX5);
	
	MUX6 : mux_5to1
	port map((17 DOWNTO 15), (5 DOWNTO 3), (2 DOWNTO 0), 
		"", "", "", (15 DOWNTO 12), (11 DOWNTO 9), (8 DOWNTO 6), M0);
	
	H6 : seven_segment_decoder
	port map(C => M6, O => HEX6);
	
	MUX7 : mux_5to1
	port map((17 DOWNTO 15), (2 DOWNTO 0), "", "", "", 
		(15 DOWNTO 12), (11 DOWNTO 9), (8 DOWNTO 6), (5 DOWNTO 3), M0);
	
	H7 : seven_segment_decoder
	port map(C => M7, O => HEX7);

end behavior;