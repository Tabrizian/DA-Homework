library IEEE;
use IEEE.std_logic_1164.all;

entity bcd_multiplier is
    port(
            a: in std_logic_vector(31 downto 0);
            b: in std_logic_vector(31 downto 0);
            c: out std_logic_vector(63 downto 0)
        );
end entity;

architecture struct of bcd_multiplier is
    component bcd_8_by_1_multiplier is
        port(
                a: in std_logic_vector(31 downto 0);
                b: in std_logic_vector(3 downto 0);
                res: out std_logic_vector(35 downto 0)
            );
    end component;

    type multipication_result is array (7 downto 0) of std_logic_vector(35 downto 0);
    signal res: multipication_result := (others => (others => '0'));
begin
    multiply_digit:
    for i in 0 to 7 generate
        digit_multiplier: bcd_8_by_1_multiplier port map(a, b((i + 1) * 4 - 1 downto i * 4), res(i));
    end generate multiply_digit;


end struct;
