library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder is
    port(
            v0: in std_logic;
            v1: in std_logic;
            v2: in std_logic;
            v3: in std_logic;
            v4: in std_logic;
            v5: in std_logic;
            v6: in std_logic;
            v7: in std_logic;
            a0: out std_logic;
            a1: out std_logic;
            a2: out std_logic;
            a3: out std_logic;
            b0: out std_logic;
            b1: out std_logic;
            b2: out std_logic;
            b3: out std_logic
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

begin
end behavorial;
