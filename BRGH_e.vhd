--this block generate the baudrate clock at predefined frequency of 
-- 9600 bits/s and 19200 bits/s depending on the "sel" input
-- work just like a prescaler but with hardcoded division values


library ieee;


use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_signed.ALL;


entity BRGH_e is
	port(clk_in, sel: in std_logic;
			clk_out: out std_logic);
end entity;

architecture BRGH_a of BRGH_e is
	
begin	
	process (clk_in)
	variable count, max_count : std_logic_vector(31 downto 0):= x"00000000";
	variable rst_flag : std_logic := '0';
	begin
	if clk_in'event and clk_in='1' then
		if sel = '1' then
			max_count := x"00001458"; -- max value for 9600
		else 
			max_count := x"00000A2C"; -- max value for 19200
		end if;
		clk_out <= '0';
		if rst_flag = '1'then
			count := x"00000000";
			rst_flag := '0';
		end if;
		count := count + 1;
	
		if count > (max_count - 1)  then
			clk_out <= '1';
			rst_flag := '1';
		end if;
	end if;
	end process;
	
end architecture;