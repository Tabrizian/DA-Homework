library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder is
    port(
            a: in std_logic;
            b: in std_logic;
            cin: in std_logic;
            s: out std_logic;
            cout: out std_logic
        );
end entity;

architecture behavorial of full_adder is
    component half_adder
        port(
                a: in std_logic;
                b: in std_logic;
                s: out std_logic;
                cout: out std_logic
            );
    end component;

    signal s1, cout1, cout2 : std_logic;

begin
    half_adder_1: half_adder port map (a, b, s1, cout1);
    half_adder_2: half_adder port map (s1, cin, s, cout2);
    cout <= cout1 or cout2;
end behavorial;
