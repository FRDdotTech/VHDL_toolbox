library ieee;


use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_signed.ALL;


entity ctl_e is
	generic(start, stop : in std_logic_vector(31 downto 0) := x"00000000");
	port(clk, M, D, RAZ: in std_logic;
			timout : out std_logic;
			val_out: out std_logic_vector(31 downto 0));
end entity;

architecture ctl_a of ctl_e is
	
begin	
	process (clk)
	variable count, output : std_logic_vector(31 downto 0):= start; --count and output to separated immidiate/concurential execution
	variable rst_flag : std_logic := '0';
	variable state : std_logic_vector(1 downto 0) := b"00";
	begin
	if clk'event and clk='1' then
		
		if RAZ = '1'then
			rst_flag := '1';
		end if;
		
		if rst_flag = '1'then
			count := start;
			output := start;
			rst_flag := '0';
			state := b"00";
		end if;
		
		output := count;
		
		if M = '1'then
			timout <= '0';
			state := b"01";
		end if;
		
		if D = '1'then
			timout <= '0';
			state := b"11";
		end if;
		
		if state(0) = '1'then
			count := count + 1;
		end if;
		
		if state = b"10" then
			count := count - 1;
			if count < start then
				rst_flag := '1';
				timout <= '1';
			end if;
		end if;
	
		if count > stop then
			if state = b"11" then
				state := b"10";
				count := count - 1;
			else
				rst_flag := '1';
				timout <= '1';
			end if;
		end if;
		val_out <= output;
	end if;
	end process;
	
end architecture;