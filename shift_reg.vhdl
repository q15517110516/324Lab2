library ieee;
use ieee.std_logic_1164.all;

entity shift_reg is
port(	I:	in std_logic_vector (3 downto 0); -- for loading
		I_SHIFT_IN: in std_logic; -- shifted in bit for both left and right
		sel:        in std_logic_vector(1 downto 0); -- 00:hold; 01: shift left; 10: shift right; 11: load
		clock:		in std_logic; -- positive level triggering in problem 3
		enable:		in std_logic; -- 0: don't do anything; 1: shift_reg is enabled
		O:	out std_logic_vector(3 downto 0) -- output the current register content
);
end shift_reg;

architecture behav of shift_reg is
signal en : std_logic:='0';
begin
    process(clock,enable)				
    begin
        if(clock'event and clock = '1') then
            case enable is
                when '1'=> en<='1';
                when others=> en<='0';
            end case;
        end if;
    end process;
    
    process(en)
    begin
        if(en'event and en = '1') then
            case sel is
                when "00"=>O<=I;
                when "01"=>O<=I(2 downto 0) & I_SHIFT_IN;
                when "10"=>O<=I_SHIFT_IN & I(3 downto 1);
                when "11"=>O<="0101";
                when others=>O<=I;
            end case;
        else
            O<="0000";
        end if;
    end process;
end behav;
