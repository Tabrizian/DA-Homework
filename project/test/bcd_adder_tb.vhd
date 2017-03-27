library IEEE;
use IEEE.std_logic_1164.all;

entity bcd_adder_tb is
end entity;

architecture tb of bcd_adder_tb is

    component bcd_adder is
        port(
                a: in std_logic_vector(7 downto 0);
                b: in std_logic_vector(3 downto 0);
                res: out std_logic_vector(3 downto 0);
                cout: out std_logic_vector(3 downto 0)
            );
    end component;

    signal a: std_logic_vector(7 downto 0) := "00000000";
    signal b, res, cout: std_logic_vector(3 downto 0) := "0000";

begin
    mapping: bcd_adder port map(a, b, res, cout);
    a <= "10000001" after 0 ns,
         "10010000" after 10 ns;

    b <= "1001" after 0 ns,
         "1000" after 10 ns;
end tb;
