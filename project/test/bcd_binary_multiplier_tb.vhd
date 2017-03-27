library IEEE;
use IEEE.std_logic_1164.all;

entity bcd_multiplier_tb is
end entity;

architecture tb of bcd_multiplier_tb is
    component bcd_binary_multiplier is
        port(
                a: in std_logic_vector(3 downto 0);
                b: in std_logic_vector(3 downto 0);
                v: out std_logic_vector(7 downto 0)
            );
    end component;

    signal a: std_logic_vector(3 downto 0);
    signal b: std_logic_vector(3 downto 0);
    signal v: std_logic_vector(7 downto 0);

begin
    mapping: bcd_binary_multiplier port map(a, b, v);

    a <= "0000" after 0 ns,
         "0100" after 10 ns,
         "1000" after 20 ns,
         "1100" after 30 ns,
         "0000" after 40 ns,
         "0100" after 50 ns,
         "1000" after 60 ns,
         "1100" after 70 ns,
         "0000" after 80 ns,
         "0100" after 90 ns,
         "1000" after 100 ns,
         "1100" after 110 ns;

    b <= "0000" after 0 ns,
         "0000" after 10 ns,
         "0000" after 20 ns,
         "0000" after 30 ns,
         "0100" after 40 ns,
         "0100" after 50 ns,
         "0100" after 60 ns,
         "0100" after 70 ns,
         "1100" after 80 ns,
         "1100" after 90 ns,
         "1100" after 100 ns,
         "1100" after 110 ns;

end tb;
