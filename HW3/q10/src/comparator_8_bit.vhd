library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comparator_8_bit is
    port(
            a: in std_logic_vector(7 downto 0);
            b: in std_logic_vector(7 downto 0);
            smaller: out std_logic_vector(7 downto 0);
            bigger: out std_logic_vector(7 downto 0)
        );
end entity;

architecture struct of comparator_8_bit is
    component comparator is
        port(
                a: in std_logic;
                b: in std_logic;
                smaller: out std_logic;
                bigger: out std_logic
            );
    end component;
begin
    smaller <= a when to_integer(unsigned(a)) < to_integer(unsigned(b)) else
               b;

    bigger <= a when to_integer(unsigned(a)) <= to_integer(unsigned(b)) else
              b;
end struct;
