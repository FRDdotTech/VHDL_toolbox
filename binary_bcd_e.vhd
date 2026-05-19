-- this block is used to convert 4*4bits binnary vectors to 4*4bits BCDs vectors
-- it uses the double-dabble (shif_and_add_3) Algorithme




library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity binary_bcd_e is
    Port (
        bcd_hex_sel : in std_logic;
		  bin_in : in  STD_LOGIC_VECTOR(15 downto 0);
        d0, d1, d2, d3     : out STD_LOGIC_VECTOR(3 downto 0));
end entity;

architecture binary_bcd_a of binary_bcd_e is
begin

    process(bin_in)
        variable bcd  : unsigned(19 downto 0);  -- 4 digits BCD = 16 bits + 4 overflow bits
		variable bin  : unsigned(15 downto 0);  -- bin_in image
    begin
	 if bcd_hex_sel = '1' then -- 1 = display BCD
        bcd := (others => '0');
        bin := unsigned(bin_in);

        for i in 0 to 15 loop
            if bcd(3 downto 0) >= 5 then
                bcd(3 downto 0) := bcd(3 downto 0) + 3;		-- unit
            end if;
            if bcd(7 downto 4) >= 5 then
                bcd(7 downto 4) := bcd(7 downto 4) + 3;		-- ten
            end if;
            if bcd(11 downto 8) >= 5 then
                bcd(11 downto 8) := bcd(11 downto 8) + 3;	-- hundred
            end if;
            if bcd(15 downto 12) >= 5 then
                bcd(15 downto 12) := bcd(15 downto 12) + 3; -- thousand
            end if;

            bcd := bcd(18 downto 0) & bin(15 - i);
        end loop;

        d0 <= std_logic_vector(bcd(3 downto 0));    -- unit
        d1 <= std_logic_vector(bcd(7 downto 4));    -- ten
        d2 <= std_logic_vector(bcd(11 downto 8));   -- hundred
        d3 <= std_logic_vector(bcd(15 downto 12));  -- thousand
		else
			d0 <= std_logic_vector(bin_in(3 downto 0));    -- unit
			d1 <= std_logic_vector(bin_in(7 downto 4));    -- ten
			d2 <= std_logic_vector(bin_in(11 downto 8));   -- hundred
			d3 <= std_logic_vector(bin_in(15 downto 12));  -- thousand
		end if;
    end process;

end architecture;