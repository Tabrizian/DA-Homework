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
    type STATE_TYPE is (C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18);
begin
    process(clk)
        variable counting: integer := 0;
        variable state: STATE_TYPE := C0;
    begin
        if(clk'event and clk = '1') then
            if(reset = '1') then
                counting := 0;
                number <= std_logic_vector(to_unsigned(counting, 5));
            else
                number <= std_logic_vector(to_unsigned(counting, 5));
                case state is
                    when C0 =>
                        if(direction = '1') then
                            counting := counting + 1;
                            state := C1;
                        else
                            counting := 18;
                            state := C18;
                        end if;
                    when C1 =>
                        if(direction = '1') then
                            counting := counting + 1;
                            state := C2;
                        else
                            report integer'image(counting);
                            counting := counting - 1;
                            state := C0;
                        end if;
                    when C2 =>
                        if(direction = '1') then
                            counting := counting + 1;
                            state := C3;
                        else
                            counting := counting - 1;
                            state := C1;
                        end if;
                    when C3 =>
                        if(direction = '1') then
                            counting := counting + 1;
                            state := C4;
                        else
                            counting := counting - 1;
                            state := C2;
                        end if;
                    when C4 =>
                        if(direction = '1') then
                            counting := counting + 1;
                            state := C5;
                        else
                            counting := counting - 1;
                            state := C3;
                        end if;
                    when C5 =>
                        if(direction = '1') then
                            counting := counting + 1;
                            state := C6;
                        else
                            counting := counting - 1;
                            state := C4;
                        end if;
                    when C6 =>
                        if(direction = '1') then
                            counting := counting + 1;
                            state := C7;
                        else
                            counting := counting - 1;
                            state := C5;
                        end if;
                    when C7 =>
                        if(direction = '1') then
                            counting := counting + 1;
                            state := C8;
                        else
                            counting := counting - 1;
                            state := C6;
                        end if;
                    when C8 =>
                        if(direction = '1') then
                            counting := counting + 1;
                            state := C9;
                        else
                            counting := counting - 1;
                            state := C7;
                        end if;
                    when C9 =>
                        if(direction = '1') then
                            counting := counting + 1;
                            state := C10;
                        else
                            counting := counting - 1;
                            state := C8;
                        end if;
                    when C10 =>
                        if(direction = '1') then
                            counting := counting + 1;
                            state := C11;
                        else
                            counting := counting - 1;
                            state := C9;
                        end if;
                    when C11 =>
                        if(direction = '1') then
                            counting := counting + 1;
                            state := C12;
                        else
                            counting := counting - 1;
                            state := C10;
                        end if;
                    when C12 =>
                        if(direction = '1') then
                            counting := counting + 1;
                            state := C13;
                        else
                            counting := counting - 1;
                            state := C11;
                        end if;
                    when C13 =>
                        if(direction = '1') then
                            counting := counting + 1;
                            state := C14;
                        else
                            counting := counting - 1;
                            state := C12;
                        end if;
                    when C14 =>
                        if(direction = '1') then
                            counting := counting + 1;
                            state := C15;
                        else
                            counting := counting - 1;
                            state := C13;
                        end if;
                    when C15 =>
                        if(direction = '1') then
                            counting := counting + 1;
                            state := C16;
                        else
                            counting := counting - 1;
                            state := C14;
                        end if;
                    when C16 =>
                        if(direction = '1') then
                            counting := counting + 1;
                            state := C17;
                        else
                            counting := counting - 1;
                            state := C15;
                        end if;
                    when C17 =>
                        if(direction = '1') then
                            counting := counting + 1;
                            state := C18;
                        else
                            counting := counting - 1;
                            state := C16;
                        end if;
                    when C18 =>
                        if(direction = '1') then
                            counting := 0;
                            state := C0;
                        else
                            counting := counting - 1;
                            state := C17;
                        end if;
                end case;
            end if;
        end if;
    end process;
end behavorial;
