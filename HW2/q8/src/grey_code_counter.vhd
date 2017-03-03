library IEEE;
use IEEE.std_logic_1164.all;

entity grey_code_counter is
    port(
            clk: in std_logic;
            count: out std_logic_vector(3 downto 0)
        );
end entity;

architecture rtl of grey_code_counter is
    signal counter: std_logic_vector(3 downto 0) := "0000";
begin
    count <= counter;
    process(clk)
    begin
        if(clk'event and clk = '1') then
            if(counter = "0000") then
                counter <= "0001";
            elsif (counter = "0001") then
                counter <= "0011";
            elsif (counter = "0011") then
                counter <= "0010";
            elsif (counter = "0010") then
                counter <= "0110";
            elsif (counter = "0110") then
                counter <= "0111";
            elsif (counter = "0111") then
                counter <= "0101";
            elsif (counter = "0101") then
                counter <= "0100";
            elsif (counter = "0100") then
                counter <= "1100";
            elsif (counter = "1100") then
                counter <= "1101";
            elsif (counter = "1101") then
                counter <= "1111";
            elsif (counter = "1111") then
                counter <= "1110";
            elsif (counter = "1110") then
                counter <= "1010";
            elsif (counter = "1010") then
                counter <= "1011";
            elsif (counter = "1011") then
                counter <= "1001";
            elsif (counter = "1001") then
                counter <= "1000";
            elsif (counter = "1000") then
                counter <= "0000";
            end if;
        end if;

    end process;
end rtl;

