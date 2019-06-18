library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity Add is
port(i1:in std_logic_vector(3 downto 0);
     i2:in std_logic_vector(3 downto 0);
     dout:out std_logic_vector(3 downto 0);
     carry:out std_logic;				--carry
     downcarry:out std_logic);			--borrow
end Add;

architecture behavioral of Add is
signal s0,s1,s2,s3,c3,c0,c1,c2:std_logic;		--the sun of s0 s1 s2 s3 
												--the carry of c0 c1 c2 c3 
signal i11,i22:std_logic_vector(3 downto 0);
begin 
i22<=i2;
i11<=i1;
c0<=i11(0) and i22(0);
c1<=((i11(1) xor i22(1)) and c0) or (i11(1) and i22(1));	--full Add
c2<=((i11(2) xor i22(2)) and c1) or (i11(2) and i22(2));
c3<=((i11(3) xor i22(3)) and c2) or (i11(3) and i22(3));
s0<=i11(0) xor i22(0);
s1<=i11(1) xor i22(1) xor c0;
s2<=i11(2) xor i22(2) xor c1;
s3<=i11(3) xor i22(3) xor c2;
dout<=s3&s2&s1&s0;
carry<=c2;
downcarry<=c2 xor c3;			-- judging the highest two bits of carry
end behavioral;   
