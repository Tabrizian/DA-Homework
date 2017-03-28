library IEEE;
use IEEE.std_logic_1164.all;

entity bcd_64_bit_adder_tb is
end entity;

architecture tb of bcd_64_bit_adder_tb is
    component bcd_64_bit_adder is
        port(
                a: in std_logic_vector(63 downto 0);
                b: in std_logic_vector(63 downto 0);
                res: out std_logic_vector(63 downto 0)
            );
    end component;
    signal a, b, res: std_logic_vector(63 downto 0) := (others => '0');
begin
    mapping: bcd_64_bit_adder port map(a, b, res);
    a(7 downto 0) <= "10010101";
    b(7 downto 0) <= "10010101";

end tb;
