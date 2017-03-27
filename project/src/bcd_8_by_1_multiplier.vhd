library IEEE;
use IEEE.std_logic_1164.all;

entity bcd_8_by_1_multiplier is
    port(
            a: in std_logic_vector(31 downto 0);
            b: in std_logic_vector(3 downto 0);
            res: out std_logic_vector(35 downto 0)
        );
end entity;

architecture struct of bcd_8_by_1_multiplier is
    component bcd_binary_multiplier is
        port(
                a: in std_logic_vector(3 downto 0);
                b: in std_logic_vector(3 downto 0);
                v: out std_logic_vector(7 downto 0)
            );
    end component;

    component binary_to_bcd is
        port(
                binary: in std_logic_vector(7 downto 0);
                bcd: out std_logic_vector(7 downto 0)
            );
    end component;

    component bcd_adder is
        port(
                a: in std_logic_vector(7 downto 0);
                b: in std_logic_vector(3 downto 0);
                res: out std_logic_vector(3 downto 0);
                cout: out std_logic_vector(3 downto 0)
            );
    end component;

    type multipication_result is array (7 downto 0) of std_logic_vector(7 downto 0);
    type cout_result is array (7 downto 0) of std_logic_vector(3 downto 0);
    signal carry_out: cout_result;
    signal multipication_binary : multipication_result;
    signal multipication_bcd : multipication_result;

begin
    bcd_multiplier_1: bcd_binary_multiplier port map(a(3 downto 0), b, multipication_binary(0));
    bcd_converter_1: binary_to_bcd port map(multipication_binary(0), multipication_bcd(0));
    res(3 downto 0) <= multipication_bcd(0)(3 downto 0);
    carry_out(0) <= multipication_bcd(0)(7 downto 4);

    generate_multiplier:
    for i in 1 to 7 generate
        bcd_multiplier_i: bcd_binary_multiplier port map(a(4 * (i + 1) - 1 downto 4 * i), b, multipication_binary(i));
        bcd_converter_i: binary_to_bcd port map(multipication_binary(i), multipication_bcd(i));
        bcd_adder_i: bcd_adder port map(multipication_bcd(i), carry_out(i - 1), res((4 * (i + 1) - 1) downto (4 * i)), carry_out(i));
    end generate generate_multiplier;

    res(35 downto 32) <= carry_out(7);

end struct;
