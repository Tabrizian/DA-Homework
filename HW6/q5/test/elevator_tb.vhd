library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity elevator_tb is
end entity;

architecture tb of elevator_tb is
    component elevator is
        port(
                floor_1_key_up: in std_logic;
                floor_1_key_down: in std_logic;
                floor_2_key_up: in std_logic;
                floor_2_key_down: in std_logic;
                floor_3_key_up: in std_logic;
                floor_3_key_down: in std_logic;
                floor_1: in std_logic;
                floor_2: in std_logic;
                floor_3: in std_logic;
                no_stop: in std_logic;
                clk: in std_logic;
                floor: out integer
            );
    end component;

    signal floor_1_key_up: std_logic := '0';
    signal floor_1_key_down: std_logic := '0';
    signal floor_2_key_up: std_logic := '0';
    signal floor_2_key_down: std_logic := '0';
    signal floor_3_key_up: std_logic := '0';
    signal floor_3_key_down: std_logic := '0';
    signal floor_1: std_logic := '0';
    signal floor_2: std_logic := '0';
    signal floor_3: std_logic := '0';
    signal no_stop: std_logic := '0';
    signal clk: std_logic := '0';
    signal floor: integer := 1;

begin
    mapping: elevator port map(floor_1_key_up, floor_1_key_down,
                floor_2_key_up, floor_2_key_down, floor_3_key_up,
                floor_3_key_down, floor_1, floor_2, floor_3, no_stop, clk,
                floor);

    floor_3 <= '1';
    floor_2_key_up <= '1';
    clk <= not clk after 2 ns;

end tb;
