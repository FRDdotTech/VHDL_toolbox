library ieee;


use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_signed.ALL;


entity uart_e is
	port(clk, rst : in std_logic;
			data_valid : in std_logic := '1';
			en, br : in std_logic;
			TX: out std_logic := '1');
end entity;

architecture uart_a of uart_e is
	
begin	
	
	process (clk, en, br)
	variable message_bit_count, en_flag : integer := 0;
	variable message : std_logic_vector(9 downto 0);
	begin
	
	if data_valid = '1' then
		message := b"1010000100";	--char "B" LSB fisrt (data valid)
	else
		message := b"1010001010";	--char "E" LSB fisrt (data error)
	end if;
	
	if clk'event and clk = '1' then
		if en = '1' then
			en_flag := 1;
		end if;
		if br = '1' and en_flag = 1 then
				TX <= message(message_bit_count);
				message_bit_count := message_bit_count + 1;
		if message_bit_count = 10 then
			message_bit_count := 0;
			en_flag := 0;
		end if;
		end if;
		end if;
		
	end process;
	
end architecture;