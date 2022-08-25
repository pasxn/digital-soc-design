library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity seven_segment_decoder is
	port(C : in std_logic_vector(2 downto 0);
		O : out std_logic_vector(6 downto 0));
end seven_segment_decoder;

architecture rtl of seven_segment_decoder is
begin
 O <= "0000000" when (C = "100") else					-- _
		"0000000" when (C = "101") else  				-- _
		"0000000" when (C = "110") else  				-- _
		"0000000" when (C = "111") else 					-- _
		"1110110" when (C(2 downto 1) = "00") else	-- H
		"1111001" when (C(2 downto 1) = "01") else	-- E
		"0111000" when (C(2 downto 1) = "10") else	-- L
		"0111111" when (C(2 downto 1) = "11");			-- O
end rtl;