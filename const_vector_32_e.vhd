library ieee;


use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;


entity const_vector_32_e is
	port(S: out std_logic_vector(31 downto 0));
end entity;

architecture const_vector_32_a of const_vector_32_e is
begin
	S <= x"02faf080"; -- 16 000 000
end architecture;