
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Add_tb is
    
end Add_tb;

architecture Behavioral of Add_tb is
component add
port(i1:in std_logic_vector(3 downto 0);        
     i2:in std_logic_vector(3 downto 0);
     dout:out std_logic_vector(3 downto 0);
     carry:out std_logic;
     downcarry:out std_logic);
end component;
signal i1,i2,dout:std_logic_vector(3 downto 0);
signal carry:std_logic;
signal downcarry:std_logic;
begin
add_0: add port map (i1=>i1,i2=>i2,dout=>dout,carry=>carry,downcarry=>downcarry);
process
type pat_type is record
i1,i2,dout:std_logic_vector(3 downto 0);
carry:std_logic;
downcarry:std_logic;
end record;
type pat_arr is array (natural range <>) of pat_type;
constant pat : pat_arr :=
(
    ("0000","0001","0001",'0','0'),      --data format is：i1    i2    dout    carry    downcarry
    ("0010","0001","0011",'0','0'),
    ("0100","0011","0111",'0','0'),
    ("1000","0111","0111",'0','0'),
    ("1100","0001","0001",'0','0'),
    ("1101","1010","0001",'0','1'),
    ("1110","1001","0001",'0','1'),
    ("0100","0101","0001",'1','1'),
    ("0110","1001","0001",'0','0'),
    ("0010","1001","0001",'0','0'),
    ("1001","1001","0001",'0','1')  
);
begin
for i in pat'range loop
i1<=pat(i).i1;
i2<=pat(i).i2;
wait for 10 ns;
assert dout=pat(i).dout;		--to verify the correctness of result.
assert carry=pat(i).carry;
assert downcarry=pat(i).downcarry;
end loop;

end process;
end Behavioral;
