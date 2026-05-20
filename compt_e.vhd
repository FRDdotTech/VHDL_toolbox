library ieee;


use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_signed.ALL;


entity compt_e is
	generic(start, stop : in std_logic_vector(31 downto 0) := x"00000000");
	port(clk, En, reload: in std_logic;
			step: in std_logic_vector(2 downto 0);
			val_out: out std_logic_vector(31 downto 0);
			overflow : out std_logic);
			
end entity;

architecture compt_a of compt_e is
	
begin	
	process (clk)
	variable count, output : std_logic_vector(31 downto 0):= start;
	variable rst_flag : std_logic := '0';
	begin
	if clk'event and clk='1' then
		if reload = '1'then
			count := x"00000000";
			count := count + step;
			overflow <= '0';
		end if;
		
		if rst_flag = '1'then
			count := start;
			output := start;
			rst_flag := '0';
			overflow <= '0';
		end if;
		
		if En = '1' then
			output := count;
			count := count + step;
		end if;
	
		if count > x"00000010" then
			overflow <= '1';
		end if;
		
		if count > stop then
			rst_flag := '1';
		end if;
		
		val_out <= output;
	end if;
	end process;
	
end architecture;