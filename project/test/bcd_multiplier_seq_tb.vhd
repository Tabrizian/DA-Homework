library IEEE;
use IEEE.std_logic_1164.all;

entity bcd_multiplier_seq_tb is
end entity;

architecture tb of bcd_multiplier_seq_tb is
    component bcd_multiplier_seq is
        port(
                a: in std_logic_vector(31 downto 0);
                b: in std_logic_vector(31 downto 0);
                c: out std_logic_vector(63 downto 0);
                clk: in std_logic
            );
    end component;

    signal a, b: std_logic_vector(31 downto 0) := (others => '0');
    signal c: std_logic_vector(63 downto 0) := (others => '0');
    signal clk: std_logic := '0';

begin
    mapping: bcd_multiplier_seq port map(a, b, c, clk);
    a(31 downto 24) <= "10011001";
    b(31 downto 24) <= "10011001";
    clk <= not clk after 5 ns;

end tb;
