library ieee;


use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;


entity const_vector_e is
	port(S: out std_logic_vector(7 downto 0));
end entity;

architecture const_vector_a of const_vector_e is
begin
	S <= x"41";
end architecture;