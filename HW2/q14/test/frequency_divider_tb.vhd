library IEEE;
use IEEE.std_logic_1164.all;

entity frequency_divider_tb is
end entity;

architecture tb of frequency_divider_tb is
    component frequency_divider is
    generic (n: integer);
        port(
                clk: in std_logic;
                divided: out std_logic
            );
    end component;

    signal clk: std_logic := '0';
    signal divided: std_logic;

begin
    mapping: frequency_divider generic map(2) port map (clk, divided);

    clk <= not clk after 5 ns;
end tb;
