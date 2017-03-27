library IEEE;
use IEEE.std_logic_1164.all;

entity bcd_8_by_1_multiplier_tb is
end entity;

architecture tb of bcd_8_by_1_multiplier_tb is
    component bcd_8_by_1_multiplier is
        port(
                a: in std_logic_vector(31 downto 0);
                b: in std_logic_vector(3 downto 0);
                res: out std_logic_vector(35 downto 0)
            );
    end component;

    signal a: std_logic_vector(31 downto 0) := (others => '0');
    signal b: std_logic_vector(3 downto 0) := (others => '0');
    signal res: std_logic_vector(35 downto 0) := (others => '0');

begin
    mapping: bcd_8_by_1_multiplier port map(a, b, res);
    a <= "00000000000000000000000000010001";
    b <= "1001";
end tb;
