library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cryptor is
    port(
            a: in std_logic_vector(7 downto 0);
            b: in std_logic_vector(7 downto 0);
            clk: in std_logic;
            output: out std_logic_vector(2 downto 0)
        );
end entity;


