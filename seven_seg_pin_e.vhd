-- simple lookup table to drive the seven segment on the board


library ieee;


use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;


entity seven_seg_pin_e is
	port(A0, A1, A2, A3, A4, A5, A6, A7: in std_logic;
			S: out std_logic_vector(6 downto 0));
end entity;

architecture seven_seg_pin_a of seven_seg_pin_e is
begin
process(A0, A1, A2, A3, A4, A5, A6, A7)
begin
	S(0) <= A0;
	S(1) <= A1;
	S(2) <= A2;
	S(3) <= A3;
	S(4) <= A4;
	S(5) <= A5;
	S(6) <= A6;
	S(7) <= A7;
	end process;
end architecture;