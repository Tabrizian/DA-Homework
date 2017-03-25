library IEEE;
use IEEE.std_logic_1164.all;

entity multiplier_2_by_2_tb is
end entity;

architecture tb of multiplier_2_by_2_tb is
    component multiplier_2_by_2 is
        port(
                a: in std_logic_vector(1 downto 0);
                b: in std_logic_vector(1 downto 0);
                res: out std_logic_vector(3 downto 0)
            );
    end component;

    signal a: std_logic_vector(1 downto 0);
    signal b: std_logic_vector(1 downto 0);
    signal res: std_logic_vector(3 downto 0);

begin
    mapping: multiplier_2_by_2 port map(a, b, res);

    a <= "00" after 0 ns,
         "01" after 10 ns,
         "10" after 20 ns,
         "11" after 30 ns,
         "00" after 40 ns,
         "01" after 50 ns,
         "10" after 60 ns,
         "11" after 70 ns,
         "00" after 80 ns,
         "01" after 90 ns,
         "10" after 100 ns,
         "11" after 110 ns;

    b <= "00" after 0 ns,
         "00" after 10 ns,
         "00" after 20 ns,
         "00" after 30 ns,
         "01" after 40 ns,
         "01" after 50 ns,
         "01" after 60 ns,
         "01" after 70 ns,
         "11" after 80 ns,
         "11" after 90 ns,
         "11" after 100 ns,
         "11" after 110 ns;

end tb;
