library ieee;
use ieee.std_logic_1164.all;

entity timer is
    port(
        zero: in std_logic;
        one: in std_logic;
        rst: in std_logic;
        clk: in std_logic;
        hashtag: in std_logic;
        unlock: out std_logic
    );
end entity;

architecture rtl of timer is
    type STATE_TYPE is (s0, s1, s2, s3, s4, s5, s6, accept, trap);
    signal state: STATE_TYPE := s0;
begin
    process(clk)
    begin
        if (rising_edge(clk)) then
            if(rst = '1') then
                state <= s0;
            else
                case state is
                    when s0 =>
                        if(zero = '1') then
                            state <= s1;
                        else
                            state <= trap;
                        end if;
                        unlock <= '0';
                    when s1 =>
                        if(one = '1') then
                            state <= s2;
                        else
                            state <= trap;
                        end if;
                        unlock <= '0';
                    when s2 =>
                        if(zero = '1') then
                            state <= s3;
                        else
                            state <= trap;
                        end if;
                        unlock <= '0';
                    when s3 =>
                        if(one = '1') then
                            state <= s4;
                        else
                            state <= trap;
                        end if;
                        unlock <= '0';
                    when s4 =>
                        if(one = '1') then
                            state <= s5;
                        else
                            state <= trap;
                        end if;
                        unlock <= '0';
                    when s5 =>
                        if(one = '1') then
                            state <= s6;
                        else
                            state <= trap;
                        end if;
                        unlock <= '0';
                    when s6 =>
                        if(hashtag = '1') then
                            state <= accept;
                        else
                            state <= trap;
                        end if;
                        unlock <= '0';
                    when accept =>
                        if(zero = '1') then
                            state <= s1;
                        else
                            state <= trap;
                        end if;
                        unlock <= '1';
                    when trap =>
                        state <= trap;
                end case;
            end if;
        end if;
    end process;
end rtl;
