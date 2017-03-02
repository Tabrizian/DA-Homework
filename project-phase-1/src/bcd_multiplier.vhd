library IEEE;
use IEEE.std_logic_1164.all;

entity bcd_multiplier is
    port(
            a: in std_logic_vector(3 downto 0);
            b: in std_logic_vector(3 downto 0);
            v: out std_logic_vector(7 downto 0)
        );
end entity;

architecture struct of bcd_multiplier is
    component half_adder
        port(
                a: in std_logic;
                b: in std_logic;
                s: out std_logic;
                cout: out std_logic
            );
    end component;

    component full_adder
        port(
                a: in std_logic;
                b: in std_logic;
                cin: in std_logic;
                s: out std_logic;
                cout: out std_logic
            );
    end component;

    component multiplier_2_by_2
        port(
                a: in std_logic_vector(1 downto 0);
                b: in std_logic_vector(1 downto 0);
                res: out std_logic_vector(3 downto 0)
            );
    end component;
    signal multiplier_2_by_2_1_res: std_logic_vector(3 downto 0);
    signal multiplier_2_by_2_2_res: std_logic_vector(3 downto 0);
    signal multiplier_2_by_2_3_res: std_logic_vector(3 downto 0);
    signal multiplier_2_by_2_4_res: std_logic_vector(3 downto 0);

    signal full_adder_1_s: std_logic;
    signal full_adder_1_cout: std_logic;

    signal full_adder_2_s: std_logic;
    signal full_adder_2_cout: std_logic;

    signal full_adder_3_s: std_logic;
    signal full_adder_3_cout: std_logic;

    signal full_adder_4_s: std_logic;
    signal full_adder_4_cout: std_logic;

    signal full_adder_5_s: std_logic;
    signal full_adder_5_cout: std_logic;

    signal full_adder_6_s: std_logic;
    signal full_adder_6_cout: std_logic;

    signal full_adder_7_s: std_logic;
    signal full_adder_7_cout: std_logic;

    signal half_adder_1_s: std_logic;
    signal half_adder_1_cout: std_logic;

    signal half_adder_2_s: std_logic;
    signal half_adder_2_cout: std_logic;
begin
    multiplier_2_by_2_1: multiplier_2_by_2 port map(b(1 downto 0),
                         a(1 downto 0), multiplier_2_by_2_1_res);

    multiplier_2_by_2_2: multiplier_2_by_2 port map(b(1 downto 0),
                         a(3 downto 2), multiplier_2_by_2_2_res);

    multiplier_2_by_2_3: multiplier_2_by_2 port map(b(3 downto 2),
                         a(1 downto 0), multiplier_2_by_2_3_res);

    multiplier_2_by_2_4: multiplier_2_by_2 port map(b(3 downto 2),
                         a(3 downto 2), multiplier_2_by_2_4_res);

    v(1 downto 0) <= multiplier_2_by_2_1_res(1 downto 0);

    full_adder_1: full_adder port map(multiplier_2_by_2_1_res(2),
                  multiplier_2_by_2_2_res(0), multiplier_2_by_2_3_res(0),
                  full_adder_1_s, full_adder_1_cout);

    v(2) <= full_adder_1_s;

    full_adder_2: full_adder port map(multiplier_2_by_2_1_res(3),
                  multiplier_2_by_2_2_res(1), multiplier_2_by_2_3_res(1),
                  full_adder_2_s, full_adder_2_cout);

    full_adder_3: full_adder port map(full_adder_2_cout,
                  multiplier_2_by_2_2_res(2), multiplier_2_by_2_3_res(2),
                  full_adder_3_s, full_adder_3_cout);

    half_adder_1: half_adder port map(full_adder_1_cout, full_adder_2_s, v(3),
                  half_adder_1_cout);

    full_adder_6: full_adder port map(half_adder_1_cout, full_adder_3_s,
                  multiplier_2_by_2_2_res(3), v(4), full_adder_6_cout);

    full_adder_5: full_adder port map(multiplier_2_by_2_4_res(0), full_adder_3_cout,
                  multiplier_2_by_2_3_res(3), full_adder_5_s, full_adder_5_cout);

    full_adder_7: full_adder port map(full_adder_6_cout, full_adder_5_s,
                  multiplier_2_by_2_4_res(1), v(5), full_adder_7_cout);

    full_adder_4: full_adder port map(full_adder_7_cout, full_adder_5_cout,
                  multiplier_2_by_2_4_res(2), v(6), full_adder_4_cout);

    half_adder_2: half_adder port map(full_adder_4_cout, multiplier_2_by_2_4_res(3),
                  v(7), half_adder_2_cout);
end struct;
