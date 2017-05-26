library IEEE;
use IEEE.std_logic_1164.all;

entity fsm_tb is
end entity;

architecture tb of fsm_tb is
    component fsm is
        port(
                input: in std_logic_vector(1 downto 0);
                clk: in std_logic;
                output: out std_logic
            );
    end component;

    signal input: std_logic_vector(1 downto 0);
    signal clk: std_logic;
    signal output: std_logic;
begin
    mapping: fsm port map(input, clk, output);

    input <= "00" after 10 ns,
             "10" after 20 ns,
             "11" after 30 ns;

    clk <= not clk after 5 ns;
end tb;
