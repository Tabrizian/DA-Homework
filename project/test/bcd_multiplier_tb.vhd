library IEEE;
use IEEE.std_logic_1164.all;

entity bcd_multiplier_tb is
end entity;

architecture tb of bcd_multiplier_tb is
    component bcd_multiplier is
        port(
                a: in std_logic_vector(31 downto 0);
                b: in std_logic_vector(31 downto 0);
                c: out std_logic_vector(63 downto 0)
            );
    end component;

    signal a, b: std_logic_vector(31 downto 0) := (others => '0');
    signal c: std_logic_vector(63 downto 0) := (others => '0');

begin
    mapping: bcd_multiplier port map(a, b, c);
    a(31 downto 24) <= "10011001";
    b(31 downto 24) <= "10011001";
end tb;
