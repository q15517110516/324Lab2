library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux is
    port( i0 : in std_logic;
          i1 : in std_logic;
          i2 : in std_logic;
          i3 : in std_logic;
          sel: in std_logic_vector(1 downto 0);
          o  : out std_logic);
end Mux;

architecture Behavioral of Mux is

begin
    process(sel)					--refer sel to choose channel
    begin
        case sel is
            when "00"=>o<=i0;
            when "01"=>o<=i1;
            when "10"=>o<=i2;
            when "11"=>o<=i3;
            when others=>o<=i0;
        end case;
    end process;
end Behavioral;
