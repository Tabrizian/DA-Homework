library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity bcd_adder is
    port(
            a: in std_logic_vector(3 downto 0);
            b: in std_logic_vector(3 downto 0);
            cin: in std_logic;
            res: out std_logic_vector(3 downto 0);
            cout: out std_logic
        );
end entity;

architecture struct of bcd_adder is
    component four_bit_adder
    port(
            a: in std_logic_vector(3 downto 0);
            b: in std_logic_vector(3 downto 0);
            cin: in std_logic;
            res: out std_logic_vector(3 downto 0);
            cout: out std_logic
        );
    end component;

    signal intermediate: std_logic_vector(3 downto 0);
    signal not_aligned_res: std_logic_vector(3 downto 0);
    signal forced_aligned_res: std_logic_vector(3 downto 0);
    signal fully_fake_signal: std_logic;
    signal readable_cout: std_logic;

begin
    simple_adder: four_bit_adder port map(a, b, cin, not_aligned_res, readable_cout);
    shifted_adder: four_bit_adder port map(not_aligned_res, "0110", '0', forced_aligned_res, fully_fake_signal);

    res <= forced_aligned_res when readable_cout = '1' else
           forced_aligned_res when to_integer(unsigned(not_aligned_res)) > 9 else
           "XXXX";


end struct;
