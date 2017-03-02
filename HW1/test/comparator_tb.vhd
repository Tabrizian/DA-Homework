library IEEE;
use IEEE.std_logic_1164.all;

entity comparator_tb is
end entity;

architecture tb of comparator_tb is
    component comparator is
        port(
                a: in std_logic_vector(1 downto 0);
                b: in std_logic_vector(1 downto 0);
                gt: out std_logic;
                eq: out std_logic;
                lt: out std_logic
        );
    end component;

    signal a, b: std_logic_vector(1 downto 0);
    signal gt, eq, lt: std_logic;
begin
    mapping: comparator port map(a, b, gt, eq, lt);

    a <= "11" after 0 ns,
         "10" after 5 ns,
         "01" after 10 ns,
         "00" after 15 ns;

    b <= "00" after 0 ns,
         "01" after 5 ns,
         "10" after 10 ns,
         "11" after 15 ns;

end tb;
