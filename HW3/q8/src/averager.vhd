library ieee;
use ieee.std_logic_1164.all;

entity averager is
    port(
            input: in natural range 15 to 40;
            average: inout integer := 0;
            clk: in std_logic
        );
end averager;

architecture behavorial of averager is
    function avg (a, b: in natural) return integer is
    begin
        if(a = 0) then
            return b / 16;
        else
            return a + b;
        end if;

    end avg;
begin
    process(clk)
    begin
        if(rising_edge(clk)) then
            average <= avg(input, average);
        end if;
    end process;

end behavorial;
