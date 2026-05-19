library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_signed.ALL;
use ieee.numeric_std.all;


entity fibo_e is
	port(clk, rst, hex_bcd_sel, en : in std_logic;
			N : in unsigned(7 downto 0);
			data_out : out std_logic_vector(15 downto 0):=x"0000";
			data_valid : out std_logic := '1'); 
end entity;




architecture fibo_a of fibo_e is
	
begin	
	process
	variable previous_value, next_value : std_logic_vector(23 downto 0):= x"000000";
	variable current_value : std_logic_vector(23 downto 0):= x"000001";
	variable count : unsigned(7 downto 0) := x"00";
	variable display_overflow : std_logic_vector(23 downto 0);
	begin
	wait until clk'event and clk='0';
	
	if hex_bcd_sel = '1' then -- 1 = display BCD
		display_overflow := x"00270f"; --over 9 999 for BCD
	else
		display_overflow := x"009999"; --over 39 321 for BCD
	end if;
	
	if rst = '0' then
		previous_value := x"000000";
		next_value := x"000001";
		current_value := x"000001";
	end if;
	
	if en = '1' then
		data_out <= previous_value(15 downto 0);
		next_value := current_value + previous_value;
		previous_value := current_value;
		current_value := next_value;
		
		--op because previous_value doesn't represent data_out at this exact time
		if (current_value - previous_value) > display_overflow then 
			data_valid <= '0';
		else 
			data_valid <= '1';
		end if;
		count := count + 1;
		if count >= N then
			previous_value := x"000000";
			next_value := x"000001";
			current_value := x"000001";
			count := x"00";
		end if;
	end if;
	end process;
	
end architecture;