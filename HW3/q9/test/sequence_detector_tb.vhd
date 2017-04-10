library ieee;
use ieee.std_logic_1164.all;

entity sequence_detector_tb is
end sequence_detector_tb;

architecture tb of sequence_detector_tb is
    component sequence_detector is
        port(
                input: in std_logic_vector(1 downto 0);
                clk: in std_logic;
                output: out std_logic_vector(1 downto 0)
            );
    end component;

    signal input: std_logic_vector(1 downto 0);
    signal clk: std_logic := '0';
    signal output: std_logic_vector(1 downto 0);
    constant A: std_logic_vector(1 downto 0) := "00";
    constant T: std_logic_vector(1 downto 0) := "01";
    constant C: std_logic_vector(1 downto 0) := "10";
    constant G: std_logic_vector(1 downto 0) := "11";
begin
    mapping: sequence_detector port map(input, clk, output);

    clk <= not clk after 5 ns;
    input <= G after 0 ns,
             A after 10 ns,
             T after 20 ns,
             A after 30 ns,
             T after 40 ns,
             A after 50 ns,
             T after 60 ns,
             G after 70 ns,
             C after 80 ns,
             A after 90 ns,
             A after 100 ns,
             C after 110 ns,
             G after 120 ns,
             C after 130 ns,
             G after 140 ns,
             C after 150 ns;
end tb;

