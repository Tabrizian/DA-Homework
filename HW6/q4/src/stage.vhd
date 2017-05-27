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
    signal l1_shifted, r1_shifted: std_logic_vector(7 downto 0);
    signal result_a: std_logic_vector(7 downto 0);
    signal result_b: std_logic_vector(7 downto 0);

begin
    le <= std_logic_vector(to_unsigned(to_integer(unsigned(a)) + to_integer(unsigned(key)), 7));
    re <= std_logic_vector(to_unsigned(to_integer(unsigned(b)) + to_integer(unsigned(key)), 7));

    l1 <= le xor re;
    l1_shifted <= l1(6 downto 0) & l1(7);
    result_a <= std_logic_vector(to_unsigned(to_integer(unsigned(l1_shifted)) + to_integer(unsigned(key)), 7));

    r1 <= result_a xor re;
    r1_shifted <= r1(6 downto 0) & r1(7);
    result_b <= std_logic_vector(to_unsigned(to_integer(unsigned(r1_shifted)) + to_integer(unsigned(key)), 7));

    outputa <= result_a;
    outputb <= result_b;

end rtl;
