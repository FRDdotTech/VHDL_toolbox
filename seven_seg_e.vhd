-- simple lookup table to drive the seven segment on the board


library ieee;


use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;


entity seven_seg_e is
	port(A: in std_logic_vector(3 downto 0);
			S: out std_logic_vector(6 downto 0));
end entity;

architecture seven_seg_a of seven_seg_e is
begin
process(A)
begin
	case A is 
		when X"0"	=> S <= b"1000000";		-- 0
		when X"1"	=> S <= b"1111001";		-- 1
		when X"2"	=> S <= b"0100100";		-- 2
		when X"3"	=> S <= b"0110000";		-- 3
		when X"4"	=> S <= b"0011001";		-- 4
		when X"5"	=> S <= b"0010010";		-- 5
		when X"6"	=> S <= b"0000010";		-- 6
		when X"7"	=> S <= b"1111000";		-- 7
		when X"8"	=> S <= b"0000000";		-- 8
		when X"9"	=> S <= b"0010000";		-- 9
		when X"A"	=> S <= b"0001000";		-- A
		when X"B"	=> S <= b"0000011";		-- B
		when X"C"	=> S <= b"1000110";		-- C
		when X"D"	=> S <= b"0100001";		-- D
		when X"E"	=> S <= b"0000110";		-- E
		when X"F"	=> S <= b"0001110";		-- F
		when others => S <= b"1111111";		-- NONE
	end case;
	end process;
end architecture;