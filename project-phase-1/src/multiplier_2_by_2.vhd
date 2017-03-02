library IEEE;
use IEEE.std_logic_1164.all;

entity multiplier_2_by_2 is
    port(
            a: in std_logic_vector(1 downto 0);
            b: in std_logic_vector(1 downto 0);
            res: out std_logic_vector(3 downto 0)
        );
end entity;

architecture struct of multiplier_2_by_2 is
    component half_adder is
        port(
                a: in std_logic;
                b: in std_logic;
                s: out std_logic;
                cout: out std_logic
            );
    end component;
    signal half_adder_1_cout: std_logic;
    signal half_adder_1_a: std_logic;
    signal half_adder_1_b: std_logic;

    signal half_adder_2_a: std_logic;
begin
    res(0) <= a(0) and b(0);
    half_adder_1_a <= a(1) and b(0);
    half_adder_1_b <= a(0) and b(1);
    half_adder_1: half_adder port map(half_adder_1_a, half_adder_1_b, res(1), half_adder_1_cout);

    half_adder_2_a <= a(1) and b(1);
    half_adder_2: half_adder port map(half_adder_2_a, half_adder_1_cout, res(2), res(3));
end struct;
