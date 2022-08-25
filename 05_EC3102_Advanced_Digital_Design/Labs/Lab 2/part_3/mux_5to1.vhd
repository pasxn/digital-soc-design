library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity mux_5to1 is
	port(U, V, W, X, Y : in std_logic_vector(2 downto 0);
		S : in std_logic_vector(2 downto 0);
		M : out std_logic_vector(2 downto 0));
end mux_5to1;

architecture rtl of mux_5to1 is 

component mux_2to1 is
	port (s : in std_logic; 
		X, Y : in std_logic_vector(2 downto 0);
		M : out std_logic_vector(2 downto 0));
end component;

signal T1, T2, T3 : std_logic_vector(2 downto 0);

begin

	mux0 : mux_2to1
	port map(s => S(0), X => U, Y => V, M => T1);

	mux1 : mux_2to1
	port map(s => S(0), X => W, Y => X, M => T2);

	mux2 : mux_2to1
	port map(s => S(1), X => T1, Y => T2, M => T3);

	mux3 : mux_2to1
	port map(s => S(2), X => T3, Y => Y, M => M);
	
end rtl;
	