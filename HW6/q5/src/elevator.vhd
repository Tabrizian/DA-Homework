library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cryptor is
    port(
            floor_1_key_up: in std_logic;
            floor_1_key_down: in std_logic;
            floor_2_key_up: in std_logic;
            floor_2_key_down: in std_logic;
            floor_3_key_up: in std_logic;
            floor_3_key_down: in std_logic;
            floor_1: in std_logic;
            floor_2: in std_logic;
            floor_3: in std_logic;
            no_stop: in std_logic;
            clk: in std_logic
        );
end entity;

architecture rtl of cryptor is

    type STATE is (S1, S2, S3);
    signal current_state: STATE := S1;


begin

    process(clk)
    begin
        if(rising_edge(clk)) then
            case current_state is
                when S1 =>
                    if(floor_1 = '1') then
                        current_state <= S1;
                    elsif(floor_2 = '1') then
                        current_state <= S2;
                    elsif(floor_3 = '1') then
                        if(no_stop = '1') then
                            current_state <= S3;
                        else
                            if(floor_2_key_up = '1') then
                                current_state <= S2;
                            else
                                current_state <= S3;
                            end if;

                        end if;
                    end if;

                when S2 =>
                    if(floor_2 = '1') then
                        current_state <= S2;
                    elsif(floor_1 = '1') then
                        current_state <= S1;
                    elsif(floor_3 = '1') then
                        current_state <= S3;
                    end if;

                when S3 =>
                    if(floor_3 = '1') then
                        current_state <= S1;
                    elsif(floor_2 = '1') then
                        current_state <= S2;
                    elsif(floor_1 = '1') then
                        if(no_stop = '1') then
                            current_state <= S3;
                        else
                            if(floor_2_key_down = '1') then
                                current_state <= S2;
                            else
                                current_state <= S1;
                            end if;

                        end if;
                    end if;
            end case;
        end if;
    end process;
end rtl;


