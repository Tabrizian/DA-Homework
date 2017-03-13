library ieee;
use ieee.std_logic_1164.all;

entity ripple_counter is
	generic (
				n: integer := 4
			);
	port (
			 clk: in std_logic;
			 reset: in std_logic;
			 dout: out std_logic_vector(n - 1 downto 0)
		 );
end entity;

architecture rtl of ripple_counter is
	signal clk_i, ff_i: std_logic_vector(n - 1 downto 0);

begin
	clk_i(0) <= clk;
	clk_i(n - 1 downto 1) <= ff_i(n - 2 downto 0);

	counter_instance: for i in 0 to n - 1 generate
		process(reset, clk_i)
		begin
			if (reset = '1') then
				ff_i(i) <= '1';
			elsif (clk_i(i)'event and clk_i(i) = '1') then
				ff_i(i) <= not ff_i(i);
			end if;
		end process;
	end generate;

	dout <= not ff_i;
end rtl;
