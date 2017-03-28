library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter is
    port(
            direction: in std_logic;
            reset: in std_logic;
            clk: in std_logic;
            number: out std_logic_vector(4 downto 0)
        );
end entity;

architecture behavorial of counter is
    type STATE_TYPE is (COUNTING_ST);
    signal state: STATE_TYPE := COUNTING_ST;
begin
    process(clk)
        variable counting: integer := 0;
    begin
        if(clk'event and clk = '1') then
            if(reset = '1') then
                counting := 0;
                number <= std_logic_vector(to_unsigned(counting, 5));
            else
                case state is
                    when COUNTING_ST =>
                        if(direction = '1') then
                            number <= std_logic_vector(to_unsigned(counting, 5));
                            if(counting = 18) then
                                counting := 0;
                            else
                                counting := counting + 1;
                            end if;
                        else
                            number <= std_logic_vector(to_unsigned(counting, 5));
                            if(counting = 0) then
                                counting := 18;
                            else
                                counting := counting - 1;
                            end if;
                        end if;
                end case;
            end if;
            report integer'image(counting);
        end if;
    end process;
end behavorial;
