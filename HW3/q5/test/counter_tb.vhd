library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter_tb is
end entity;

architecture tb of counter_tb is
    component counter is
        port(
                direction: in std_logic;
                reset: in std_logic;
                clk: in std_logic;
                number: out std_logic_vector(4 downto 0)
            );
    end component;

    signal direction, reset, clk: std_logic := '0';
    signal number: std_logic_vector(4 downto 0) := (others => '0');
begin
    mapping: counter port map(direction, reset, clk, number);

    direction <= '1' after 0 ns,
                 '0' after 10 ns,
                 '1' after 30 ns;

    reset <= '1' after 20 ns,
             '0' after 25 ns;

    clk <= not clk after 5 ns;
end tb;
