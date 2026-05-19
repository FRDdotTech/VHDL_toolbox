library ieee;


use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_signed.ALL;


entity counter_e is
	generic(start, stop : in std_logic_vector(31 downto 0) := x"00000000");
	port(clk: in std_logic;
			val_out: out std_logic_vector(31 downto 0));
end entity;

architecture counter_a of counter_e is
	
begin	
	process (clk)
	variable count, output : std_logic_vector(31 downto 0):= start;
	variable rst_flag : std_logic := '0';
	begin
	if clk'event and clk='1' then
	
		if rst_flag = '1'then
			count := start;
			output := start;
			rst_flag := '0';
		end if;
		output := count;
		count := count + 1;
	
		if count > stop then
			rst_flag := '1';
		end if;
		val_out <= output;
	end if;
	end process;
	
end architecture;