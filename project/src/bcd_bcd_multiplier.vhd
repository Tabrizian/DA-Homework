library IEEE;
use IEEE.std_logic_1164.all;

entity bcd_bcd_multiplier is
    port(
            a: in std_logic_vector(3 downto 0);
            b: in std_logic_vector(3 downto 0);
            res: out std_logic_vector(3 downto 0);
            cout: out std_logic_vector(3 downto 0)
        );
end entity;

architecture struct of bcd_bcd_multiplier is
    component bcd_bcd_multiplier is
        port(
                a: in std_logic_vector(3 downto 0);
                b: in std_logic_vector(3 downto 0);
                v: out std_logic_vector(7 downto 0)
            );
    end component;

    signal multipication_binary: std_logic_vector(7 downto 0);
begin
    binary_muliplier: bcd_bcd_multiplier port map(a, b, multipication_binary);

end struct;
