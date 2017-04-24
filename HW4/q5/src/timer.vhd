library ieee;
use ieee.std_logic_1164.all;

entity timer is
    port(
        pause: in std_logic := '0';
        clk: in std_logic;
        rst: in std_logic;
        counted: out integer
    );
end entity;

architecture rtl of timer is
begin
    process(clk)
        variable count: integer := 0;
    begin
        if(rising_edge(clk)) then
            if (rst = '1') then
                count := 0;
            elsif (pause = '0') then
                count := count + 2;
            else
                count := count;
            end if;
            counted <= count / 1000;
        end if;
    end process;
end rtl;
