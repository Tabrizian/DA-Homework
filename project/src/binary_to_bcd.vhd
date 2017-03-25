library IEEE;
use IEEE.std_logic_1164.all;

entity binary_to_bcd is
    port(
            binary: in std_logic_vector(3 downto 0);
            bcd: out std_logic_vector(3 downto 0);
            cout: out std_logic
        );
end entity;

architecture struct of binary_to_bcd is
begin
    with binary select bcd <=
        "0000" when "0000",
        "0001" when "0001",
        "0010" when "0010",
        "0011" when "0011",
        "0100" when "0100",
        "0101" when "0101",
        "0110" when "0110",
        "0111" when "0111",
        "1000" when "1000",
        "1001" when "1001",
        "0000" when "1010",
        "0001" when "1011",
        "0010" when "1100",
        "0011" when "1101",
        "0100" when "1110",
        "0101" when "1111",
        "XXXX" when others;

    with binary select cout <=
        '0' when "0000",
        '0' when "0001",
        '0' when "0010",
        '0' when "0011",
        '0' when "0100",
        '0' when "0101",
        '0' when "0110",
        '0' when "0111",
        '0' when "1000",
        '0' when "1001",
        '1' when "1010",
        '1' when "1011",
        '1' when "1100",
        '1' when "1101",
        '1' when "1110",
        '1' when "1111",
        'X' when others;
end struct;
