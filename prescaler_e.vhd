-- this block toggle the output at 1Hz
-- it doesn't work stricly as a prescaler as the duty cycle isn't 50% 
-- instead the on time is only equale to 1 period of the input frequency
-- the generic argument allow the user to change the prescaler value depending of the input clock
-- or the desired ouput frequency

library ieee;


use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_signed.ALL;
use ieee.numeric_std.all;


entity prescaler_e is
	generic(N : in integer := 50000000);
	port(clk_in: in std_logic;
			clk_out: out std_logic);
end entity;

architecture prescaler_a of prescaler_e is
	
begin	
	process (clk_in)
	variable count : std_logic_vector(31 downto 0):= x"00000000";
	variable rst_flag : std_logic := '0';
	begin
	if clk_in'event and clk_in='1' then
		clk_out <= '0';
		if rst_flag = '1'then
			count := x"00000000";
			rst_flag := '0';
		end if;
		count := count + 1;
	
		if to_integer(unsigned(count)) = N then
			clk_out <= '1';
			rst_flag := '1';
		end if;
	end if;
	end process;
	
end architecture;