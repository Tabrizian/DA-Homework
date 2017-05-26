library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stage is
    port(
            a: in std_logic_vector(7 downto 0);
            b: in std_logic_vector(7 downto 0);
            key: in std_logic_vector(7 downto 0);
            outputa: out std_logic_vector(7 downto 0);
            outputb: out std_logic_vector(7 downto 0)
        );
end entity;

architecture rtl of stage is

    signal le, re: std_logic_vector(7 downto 0);
    signal l1, r1: std_logic_vector(7 downto 0);

begin
    le <= std_logic_vector(to_unsigned(to_integer(unsigned(a)) + to_integer(unsigned(key)), 7));
    re <= std_logic_vector(to_unsigned(to_integer(unsigned(b)) + to_integer(unsigned(key)), 7));

    l1 <= le xor re;
end rtl;
