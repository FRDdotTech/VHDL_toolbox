library ieee;


use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;


entity const_vector_16_e is
	port(S: out std_logic_vector(15 downto 0));
end entity;

architecture const_vector_16_a of const_vector_16_e is
begin
	S <= "1";
end architecture;