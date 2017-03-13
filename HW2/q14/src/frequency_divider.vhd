library IEEE;
use IEEE.std_logic_1164.all;

entity frequency_divider is
    generic (n: integer);
    port(
            clk: in std_logic;
            reset: in std_logic;
            divided: out std_logic
        );
end entity;

architecture behavorial of frequency_divider is
begin
    process(clk, reset)
        variable counter: integer := 0;
        variable first: integer := 0;
    begin
        if(reset = '1') then
           counter := 0;
       end if;

        if(clk'event and clk = '1') then
            if(counter mod n = 0) then
                counter := 0;
                divided <= '1';
            else
                divided <= '0';
            end if;
            counter := counter + 1;
        end if;
    end process;

end behavorial;

