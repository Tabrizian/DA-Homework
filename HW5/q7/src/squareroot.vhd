library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity square_root is
    port(
            input: in std_logic_vector(4 downto 0);
            output: out std_logic_vector(2 downto 0)
        );
end entity;

architecture rtl of square_root is
begin
    output(2) <= input(4);
    output(1) <= ((not input(4)) and input(2)) or ((not input(4)) and input(3));
    output(0) <= (input(3) and input(0)) or (input(3) and input(1)) or
                 ((input(3) and input(2))) or ((not input(4)) and
                 (not input(2)) and input(0)) or ((not input(4)) and
                 (not input(2)) and input(1));
end rtl;

architecture memory of square_root is

    type ram_type is array(31 downto 0) of std_logic_vector(2 downto 0);
    signal ram: ram_type := ("101", "101", "101", "101", "101", "101", "101",
                            "100", "100", "100", "100", "100", "100", "100",
                            "100", "100", "011", "011", "011", "011", "011",
                            "011", "011", "010", "010", "010", "010" , "010",
                            "001", "001", "001", "000");
begin

    output <= ram(to_integer(unsigned(input)));

end memory;
