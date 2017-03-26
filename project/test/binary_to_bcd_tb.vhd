library IEEE;
use IEEE.std_logic_1164.all;

entity binary_to_bcd_tb is
end entity;

architecture tb of binary_to_bcd_tb is
    component binary_to_bcd
        port(
                binary: in std_logic_vector(7 downto 0);
                bcd: out std_logic_vector(7 downto 0)
            );
    end component;

    signal binary, bcd: std_logic_vector(7 downto 0) := "00000000";
begin
    mapping: binary_to_bcd port map(binary, bcd);

    binary <= "00000000" after 0 ns,
              "00000100" after 10 ns,
              "00001000" after 20 ns,
              "00001100" after 30 ns,
              "00000000" after 40 ns,
              "00000100" after 50 ns,
              "00001000" after 60 ns,
              "00001100" after 70 ns,
              "00011101" after 80 ns,
              "00011100" after 90 ns,
              "00101000" after 100 ns,
              "01010001" after 110 ns;
end tb;
