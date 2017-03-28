library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity bcd_64_bit_adder is
    port(
            a: in std_logic_vector(63 downto 0);
            b: in std_logic_vector(63 downto 0);
            res: out std_logic_vector(63 downto 0)
        );
end entity;

architecture struct of bcd_64_bit_adder is
    component bcd_adder_simple is
        port(
                a: in std_logic_vector(3 downto 0);
                b: in std_logic_vector(3 downto 0);
                cin: in std_logic;
                res: out std_logic_vector(3 downto 0);
                cout: out std_logic
            );
    end component;

    signal cout: std_logic_vector(15 downto 0);

begin

    simple_adder: bcd_adder_simple port map(a(3 downto 0), b(3 downto 0), '0', res(3 downto 0), cout(0));
    adding:
    for i in 1 to 15 generate
        simple_adder_i: bcd_adder_simple port map(a((i + 1) * 4 - 1 downto i * 4), b((i + 1) * 4 - 1 downto i * 4), cout(i - 1), res((i + 1) * 4 - 1 downto i * 4), cout(i));
    end generate adding;

end struct;
