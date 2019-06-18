library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_8bit is
port(	I:	in std_logic_vector (7 downto 0); -- for loading
		I_SHIFT_IN: in std_logic; -- shifted in bit for both left and right
		sel:        in std_logic_vector(1 downto 0); -- 00:hold; 01: shift left; 10: shift right; 11: load
		clock:		in std_logic; -- positive level triggering in problem 3
		enable:		in std_logic; -- 0: don't do anything; 1: shift_reg is enabled
		O:	out std_logic_vector(7 downto 0)   -- output the current register content
); 
end shift_8bit;

architecture Behavioral of shift_8bit is
component shift_reg
port (	I:	in std_logic_vector (3 downto 0);
		I_SHIFT_IN: in std_logic;
		sel:        in std_logic_vector(1 downto 0); -- 00:hold; 01: shift left; 10: shift right; 11: load
		clock:		in std_logic; 
		enable:		in std_logic;
		O:	out std_logic_vector(3 downto 0)
);
end component;

signal outl,outh : std_logic_vector(3 downto 0);

begin	--8-bit register with two 4-bit registers combined, i(3) as intermediate shift data
shift_reg_0: shift_reg port map (I=>I(3 downto 0),I_SHIFT_IN=>I_SHIFT_IN,sel=>sel,clock=>clock,enable=>enable,O=>O(3 downto 0));
shift_reg_1: shift_reg port map (I=>I(7 downto 4),I_SHIFT_IN=>I(3),sel=>sel,clock=>clock,enable=>enable,O=>O(7 downto 4));
end Behavioral;
