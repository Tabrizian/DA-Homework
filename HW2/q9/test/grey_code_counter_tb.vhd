library IEEE;
use IEEE.std_logic_1164.all;

entity grey_code_counter_tb is
end entity;

architecture tb of grey_code_counter_tb is
    component grey_code_counter is
        port(
                clk: in std_logic;
                reset: in std_logic;
                count: out std_logic_vector(3 downto 0)
            );
    end component;

    signal clk: std_logic := '0';
    signal reset: std_logic := '0';
    signal count: std_logic_vector(3 downto 0);

begin
    mapping: grey_code_counter port map(clk, reset, count);

    clk <= not clk after 5 ns;
    reset <= '1' after 100 ns,
             '0' after 110 ns;
end tb;
