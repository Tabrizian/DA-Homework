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
                floor: out std_logic
            );
    end component;

    signal floor_3_key_down

begin

end tb;
