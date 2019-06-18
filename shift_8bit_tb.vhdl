

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity shift_8bit_tb is

end shift_8bit_tb;

architecture Behavioral of shift_8bit_tb is
component shift_8bit
port(	I:	in std_logic_vector (7 downto 0);
		I_SHIFT_IN: in std_logic;
		sel:        in std_logic_vector(1 downto 0); -- 00:hold; 01: shift left; 10: shift right; 11: load
		clock:		in std_logic; -- positive level triggering in problem 3
		enable:		in std_logic; -- 0: don't do anything; 1: shift_reg is enabled
		O:	out std_logic_vector(7 downto 0)   
); 
end component;

signal i, o : std_logic_vector(7 downto 0);
signal i_shift_in, clk, enable : std_logic;
signal sel : std_logic_vector(1 downto 0);

begin
shift_8bit_reg_0: shift_8bit port map (I=>i,I_SHIFT_IN=>i_shift_in,sel=>sel,clock=>clk,enable=>enable,O=>o);
process
type pattern_type is record
--  The inputs of the shift_reg.
i: std_logic_vector (7 downto 0);
i_shift_in, clock, enable: std_logic;
sel: std_logic_vector(1 downto 0);
--  The expected outputs of the shift_reg.
o: std_logic_vector (7 downto 0);
end record;
--  The patterns to apply.
type pattern_array is array (natural range <>) of pattern_type;
constant patterns : pattern_array :=
(
("00000001", '0', '0', '1', "00", "00000000"),  --data format is ：i  i_shift_in  clock   enable  o
("00000001", '0', '1', '1', "00", "00000001"),
("00000001", '0', '0', '0', "00", "00000001"),
("00000001", '0', '1', '0', "00", "00000000"),
("00000001", '1', '0', '1', "00", "00000000"),
("00000001", '1', '1', '1', "00", "00000001"),
("00000001", '1', '0', '0', "00", "00000001"),
("00000001", '1', '1', '0', "00", "00000000"),

("00000001", '0', '0', '1', "01", "00000000"),
("00000001", '0', '1', '1', "01", "00000010"),
("00000001", '0', '0', '0', "01", "00000010"),
("00000001", '0', '1', '0', "01", "00000000"),
("00000001", '1', '0', '1', "01", "00000000"),
("00000001", '1', '1', '1', "01", "00000011"),
("00000001", '1', '0', '0', "01", "00000011"),
("00000001", '1', '1', '0', "01", "00000000"),

("00000001", '0', '0', '1', "10", "00000000"),
("00000001", '0', '1', '1', "10", "00000000"),
("00000001", '0', '0', '0', "10", "00000000"),
("00000001", '0', '1', '0', "10", "00000000"),
("00000001", '1', '0', '1', "10", "00000000"),
("00000001", '1', '1', '1', "10", "00000000"),
("00000001", '1', '0', '0', "10", "10000000"),
("00000001", '1', '1', '0', "10", "10000000"),

("00000001", '0', '0', '1', "11", "00000000"),
("00000001", '0', '1', '1', "11", "01010101"),
("00000001", '0', '0', '0', "11", "01010101"),
("00000001", '0', '1', '0', "11", "00000000"),
("00000001", '1', '0', '1', "11", "00000000"),
("00000001", '1', '1', '1', "11", "01010101"),
("00000001", '1', '0', '0', "11", "01010101"),
("00000001", '1', '1', '0', "11", "00000000")
);
begin
--  Check each pattern.
for n in patterns'range loop
--  Set the inputs.
i <= patterns(n).i;
i_shift_in <= patterns(n).i_shift_in;
sel <= patterns(n).sel;
clk <= patterns(n).clock;
enable <= patterns(n).enable;
--  Wait for the results.
wait for 20 ns;
--  Check the outputs.
assert o = patterns(n).o 
report "bad output value" severity error;
end loop;
assert false report "end of test" severity note;
--  Wait forever; this will finish the simulation.
wait;
end process;
end Behavioral;
