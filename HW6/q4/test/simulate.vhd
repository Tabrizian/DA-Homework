library ieee;
use ieee.std_logic_1164.all;

entity question is
end entity;

architecture test of question is
    signal a, b, c: std_logic := '0';
    signal clk: std_logic := '0';
begin
    c <= '1';
    b <= '0';
    clk <= not clk after 10 ns;
    process(clk)
        variable d: std_logic;
    begin
        a <= b;
        b <= c xor b;
        d := c and a;
        c <= not c;
    end process;
end test;
