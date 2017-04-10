library ieee;
use ieee.std_logic_1164.all;

entity averager_tb is

    end entity;

architecture tb of averager_tb is
    component averager is
    port(
            input: in natural range 0 to 40;
            average: inout integer := 0;
            clk: in std_logic
        );
    end component;

    signal input: natural range 0 to 40;
    signal average: integer;
    signal clk: std_logic := '0';

begin
    mapping: averager port map(input, average, clk);
    clk <= not clk after 5 ns;
    input <= 17 after 0 ns,
             18 after 10 ns,
             19 after 20 ns,
             20 after 30 ns,
             21 after 40 ns,
             22 after 50 ns,
             23 after 60 ns,
             24 after 70 ns,
             25 after 80 ns,
             26 after 90 ns,
             27 after 100 ns,
             28 after 110 ns,
             29 after 120 ns,
             30 after 130 ns,
             31 after 140 ns,
             32 after 150 ns,
             0 after 160 ns;

end tb;
