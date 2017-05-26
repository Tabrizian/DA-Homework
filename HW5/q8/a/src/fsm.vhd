library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fsm is
    port(
            input: in std_logic_vector(1 downto 0);
            clk: in std_logic;
            output: out std_logic
        );
end entity;

architecture behavorial of fsm is
    signal state: std_logic_vector(2 downto 0) := "000";
    type ram_type is array(19 downto 0) of std_logic_vector(3 downto 0);
    signal ram: ram_type := ("0101", "1000", "1000", "1000", "1000", "1000",
                             "1000", "1000", "1000", "1000", "1000", "1000",
                             "1000", "1000", "1000", "1000", "1000", "1000",
                             "1000", "1000");
   signal address: std_logic_vector(4 downto 0);
begin
    address <= state & input;
    process(clk)
    begin
        if(rising_edge(clk)) then
            state <= ram(to_integer(unsigned(address)))(3 downto 1);
            output <= ram(to_integer(unsigned(address)))(0);
        end if;
    end process;
end behavorial;
