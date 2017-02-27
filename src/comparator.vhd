library IEEE;
use IEEE.std_logic_1164.all;

entity comparator is
    port(
            a: in std_logic_vector(1 downto 0);
            b: in std_logic_vector(1 downto 0);
            gt: out std_logic;
            eq: out std_logic;
            lt: out std_logic
    );
end entity;

architecture struct of comparator is
begin
    gt <= ((a(1) xor b(1)) and a(1)) or ((a(0) xor b(0)) and a(0));
    eq <= ((a(1) xnor b(1)) and (a(0) xnor b(0)));
    lt <= '0';
end struct;

architecture behavorial of comparator is
begin
    process(a, b)
    begin
        if(a > b) then
            gt <= '1';
            lt <= '0';
            eq <= '0';
        elsif(a < b) then
            lt <= '1';
            gt <= '0';
            eq <= '0';
        else
            eq <= '1';
            gt <= '0';
            lt <= '0';
        end if;
    end process;
end behavorial;
