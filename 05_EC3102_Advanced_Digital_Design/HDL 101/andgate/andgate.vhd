library IEEE;
use IEEE.std_logic_1164.all;

entity andgate is 
port (
	ii1 : in std_logic;
	ii2 : in std_logic;
	o   : out std_logic
);
end entity andgate;

architecture rtl of andgate is begin 
  process(ii1, ii2) is
  begin
    	o <= ii1 and ii2;
  end process;
end architecture rtl; 