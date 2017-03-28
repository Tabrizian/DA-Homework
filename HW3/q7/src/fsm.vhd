library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity remainder is
    port(
            input: in std_logic;
            clk: in std_logic;
            output: out integer
        );
end entity;

architecture behavorial of remainder is
    type STATE_TYPE is (START, s0, s1, s2, s3, s4, s5, FINAL);
    signal state: STATE_TYPE := START;
begin
    process(clk)
        variable length: integer := 0;
        variable remain: integer := 0;
    begin
        case state is
            when START =>
                if(input = '1') then
                    state <= s0;
                else
                    state <= START;
                end if;
                remain := 0;
            when s0 =>
                length := length + 1;
                if(length = 8) then
                    state <= FINAL;
                else
                    if(input = '1') then
                        state <= s3;
                    else
                        state <= s1;
                    end if;
                end if;
                remain := 0;
            when s1 =>
                length := length + 1;
                if(length = 8) then
                    state <= FINAL;
                else
                    if(input = '1') then
                        state <= s4;
                    else
                        state <= s0;
                    end if;
                end if;
                remain := 0;
            when s2 =>
                length := length + 1;
                if(length = 8) then
                    state <= FINAL;
                else
                    if(input = '1') then
                        state <= s5;
                    else
                        state <= s3;
                    end if;
                end if;
                remain := 1;
            when s3 =>
                if(length = 8) then
                    state <= FINAL;
                else
                    if(input = '1') then
                        state <= s0;
                    else
                        state <= s3;
                    end if;
                end if;
                remain := 1;
            when s4 =>
                length := length + 1;
                if(length = 8) then
                    state <= FINAL;
                else
                    if(input = '1') then
                        state <= s1;
                    else
                        state <= s5;
                    end if;
                end if;
                remain := 2;
            when s5 =>
                if(length = 8) then
                    state <= FINAL;
                else
                    if(input = '1') then
                        state <= s2;
                    else
                        state <= s4;
                    end if;
                end if;
                remain := 2;
            when FINAL =>
                if(input = '0') then
                    output <= remain;
                else
                    output <= 3;
                end if;

        end case;

    end process;
end behavorial;
