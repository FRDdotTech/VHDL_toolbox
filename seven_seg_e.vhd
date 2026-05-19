-- simple lookup table to drive the seven segment on the board


library ieee;


use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;


entity seven_seg_e is
	port(A: in std_logic_vector(7 downto 0);
			S: out std_logic_vector(6 downto 0));
end entity;

architecture seven_seg_a of seven_seg_e is
begin
process(A)
begin
	case A is 
		when X"00"	=> S <= b"1000000";		-- 0
		when X"01"	=> S <= b"1111001";		-- 1
		when X"02"	=> S <= b"0100100";		-- 2
		when X"03"	=> S <= b"0110000";		-- 3
		when X"04"	=> S <= b"0011001";		-- 4
		when X"05"	=> S <= b"0010010";		-- 5
		when X"06"	=> S <= b"0000010";		-- 6
		when X"07"	=> S <= b"1111000";		-- 7
		when X"08"	=> S <= b"0000000";		-- 8
		when X"09"	=> S <= b"0010000";		-- 9
		when X"0A"	=> S <= b"0001000";		-- A
		when X"0B"	=> S <= b"0000011";		-- B
		when X"0C"	=> S <= b"1000110";		-- C
		when X"0D"	=> S <= b"0100001";		-- D
		when X"0E"	=> S <= b"0000110";		-- E
		when X"0F"	=> S <= b"0001110";		-- F
		when X"10"	=> S <= b"0111111";		-- mid
		when X"11"	=> S <= b"1011111";		-- top_left
		when X"12"	=> S <= b"1101111";		-- bottom_left
		when X"13"	=> S <= b"1110111";		-- bottom
		when X"14"	=> S <= b"1111011";		-- bottom_right
		when X"15"	=> S <= b"1111101";		-- top_right
		when X"16"	=> S <= b"1111110";		-- top
		when others => S <= b"1111111";		-- NONE
	end case;
	end process;
end architecture;