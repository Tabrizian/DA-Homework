library ieee;
use ieee.std_logic_1164.all;
use work.common.all;

entity sort is
    generic(N: integer);
    port(
            a: in array_2d(N - 1 downto 0);
            b: in std_logic_vector(N - 1 downto 0)
        );
end entity;

architecture struct of sort is
    component comparator_8_bit is
    port(
            a: in std_logic_vector(7 downto 0);
            b: in std_logic_vector(7 downto 0);
            smaller: out std_logic_vector(7 downto 0);
            bigger: out std_logic_vector(7 downto 0)
        );
    end component;

    signal intermediate: std_logic_vector(63 downto 0);
begin
    comparator_first: comparator_8_bit port map(a(0), a(1), intermediate(0), intermediate(1));
    first_round:
    for i in 1 to N - 1 - 1 generate
        comparator_i: comparator_8_bit port map(a(i), intermediate(i), intermediate(i + 1), intermediate(i + 2));
    end generate first_round;
end struct;
