library ieee;
use ieee.std_logic_1164.all:

entity mealy_fsm is
    port(tog_en     : in std_logic;
        clk, clr    : in std_logic;
        z1          : out std_logic);
end mealy_fsm;

architecture rtl of mealy_fsm is 
    type state_type is (st0, st1);
    signal ps, ns   : state_type;
    -- ps = present state
    -- ns = next state

begin
    sec_proc : process(clk, ns, clr)
    begin
        if(clr = '1') then
            ps <= st0;
        elsif(rising_edge(clk)) then 
            ps <= ns;
        end if;
    end process sec_proc;
    
    comb_proc : process(ps, tog_en)
    begin
        z1 <= '0';
        case ps is 
            when st0 => 
                if(tog_en = '1') then
                    z1 <= '1';
                    ns <= st1;
                else
                    z1 <= '0';
                    ns <= st0;
                end if;
            
            when st1 => 
                if(tog_en = '1') then
                    z1 <= '0';
                    ns <= st0;
                else
                    z1 <= '1';
                    ns <= st1;
                end if;

            when others =>
                z1 <= '0';
                ns <= st0;
        end case;
    end process comb_proc:
end rtl;