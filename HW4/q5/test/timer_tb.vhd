library ieee;
use ieee.std_logic_1164.all;

entity timer_tb is
end entity;

architecture tb of timer_tb is
    component timer is
        port(
                pause: in std_logic := '0';
                clk: in std_logic;
                rst: in std_logic;
                counted: out integer
            );
    end component;
    signal pause, clk, rst: std_logic := '0';
    signal counted: integer := 0;
begin
    mapping: timer port map(pause, clk, rst, counted);
    clk <= not clk after 1 ms;
end tb;
