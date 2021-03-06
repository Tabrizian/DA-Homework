library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity bcd_adder_simple is
    port(
            a: in std_logic_vector(3 downto 0);
            b: in std_logic_vector(3 downto 0);
            cin: in std_logic;
            res: out std_logic_vector(3 downto 0);
            cout: out std_logic
        );
end entity;

architecture struct of bcd_adder_simple is
    component n_bit_adder
        generic(N: integer);
        port(
                a: in std_logic_vector(N - 1 downto 0);
                b: in std_logic_vector(N - 1 downto 0);
                cin: in std_logic;
                res: out std_logic_vector(N - 1 downto 0);
                cout: out std_logic
            );
    end component;

    signal not_aligned_res: std_logic_vector(3 downto 0);
    signal forced_aligned_res: std_logic_vector(3 downto 0);
    signal cout_plus_1: std_logic_vector(3 downto 0);
    signal fully_fake_signal_1: std_logic;
    signal fully_fake_signal_2: std_logic;
    signal readable_cout: std_logic;

begin
    simple_adder: n_bit_adder generic map(4)
        port map(a, b, cin, not_aligned_res, readable_cout);

    shifting_adder: n_bit_adder generic map(4)
        port map(not_aligned_res, "0110", '0', forced_aligned_res, fully_fake_signal_1);

    res <= forced_aligned_res when to_integer(unsigned(not_aligned_res)) > 9 else
           forced_aligned_res when readable_cout = '1' else
           not_aligned_res when readable_cout = '0' else
           not_aligned_res when to_integer(unsigned(not_aligned_res)) < 10 else
           "XXXX";

    cout <= '1' when to_integer(unsigned(not_aligned_res)) > 9 else
            '1' when readable_cout = '1' else
            '0' when readable_cout = '0' else
            '0' when to_integer(unsigned(not_aligned_res)) < 10 else
            'X';

end struct;
