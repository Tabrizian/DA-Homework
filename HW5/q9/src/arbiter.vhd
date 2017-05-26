library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity arbiter is
    port(
            data_bus0: in std_logic_vector(7 downto 0);
            request0: in std_logic;
            ack0: buffer std_logic;
            data_bus1: in std_logic_vector(7 downto 0);
            request1: in std_logic;
            ack1: buffer std_logic;
            data_bus2: in std_logic_vector(7 downto 0);
            request2: in std_logic;
            ack2: buffer std_logic;
            data_bus3: in std_logic_vector(7 downto 0);
            request3: in std_logic;
            ack3: buffer std_logic;
            output: out std_logic_vector(7 downto 0);
            clk: in std_logic
        );
end entity;

architecture rtl of arbiter is

begin
    process(clk)
    begin
        if(rising_edge(clk)) then
            if(request0 = '0' and request1 = '0' and request2 = '0' and request3 = '0') then
                ack0 <= '0';
                ack1 <= '0';
                ack2 <= '0';
                ack3 <= '0';
            elsif(request0 = '0' and request1 = '0' and request2 = '0' and request3 = '1') then
                ack0 <= '0';
                ack1 <= '0';
                ack2 <= '0';
                ack3 <= '1';
                output <= data_bus3;
            elsif(request0 = '0' and request1 = '0' and request2 = '1' and request3 = '0') then
                ack0 <= '0';
                ack1 <= '0';
                ack2 <= '1';
                output <= data_bus2;
                ack3 <= '0';
            elsif(request0 = '0' and request1 = '0' and request2 = '1' and request3 = '1') then
                ack0 <= '0';
                ack1 <= '0';
                if(ack2 = '1' and ack3 = '0') then
                    ack2 <= '0';
                elsif(ack2 = '0' and ack3 = '1') then
                    ack3 <= '0';
                else
                    output <= data_bus2;
                    ack2 <= '1';
                end if;
            elsif(request0 = '0' and request1 = '1' and request2 = '0' and request3 = '0') then
                ack0 <= '0';
                ack1 <= '1';
                output <= data_bus1;
                ack2 <= '0';
                ack3 <= '0';
            elsif(request0 = '0' and request1 = '1' and request2 = '0' and request3 = '1') then
                ack0 <= '0';
                ack2 <= '0';
                if(ack1 = '1' and ack3 = '0') then
                    ack1 <= '0';
                elsif(ack1 = '0' and ack3 = '1') then
                    ack3 <= '0';
                    output <= data_bus3;
                else
                    ack1 <= '1';
                end if;
            elsif(request0 = '0' and request1 = '1' and request2 = '1' and request3 = '0') then
                ack0 <= '0';
                ack3 <= '0';
                if(ack1 = '1' and ack2 = '0') then
                    ack1 <= '0';
                elsif(ack1 = '0' and ack2 = '1') then
                    ack2 <= '0';
                else
                    ack1 <= '1';
                    output <= data_bus1;
                end if;
            elsif(request0 = '0' and request1 = '1' and request2 = '1' and request3 = '1') then
                ack0 <= '0';
                ack3 <= '0';
                if(ack1 = '1' and ack2 = '0') then
                    ack1 <= '0';
                elsif(ack1 = '0' and ack2 = '1') then
                    ack2 <= '0';
                else
                    ack1 <= '1';
                    output <= data_bus1;
                end if;
            elsif(request0 = '1' and request1 = '0' and request2 = '0' and request3 = '0') then
                ack0 <= '1';
                output <= data_bus0;
                ack1 <= '0';
                ack2 <= '0';
                ack3 <= '0';
            elsif(request0 = '1' and request1 = '0' and request2 = '0' and request3 = '1') then
                ack0 <= '0';
                ack3 <= '0';
                if(ack1 = '1' and ack2 = '0') then
                    ack1 <= '0';
                elsif(ack1 = '0' and ack2 = '1') then
                    ack2 <= '0';
                else
                    ack1 <= '1';
                    output <= data_bus1;
                end if;
            elsif(request0 = '1' and request1 = '0' and request2 = '1' and request3 = '0') then
                ack0 <= '0';
                ack3 <= '0';
                if(ack1 = '1' and ack2 = '0') then
                    ack1 <= '0';
                elsif(ack1 = '0' and ack2 = '1') then
                    ack2 <= '0';
                else
                    ack1 <= '1';
                    output <= data_bus1;
                end if;
            elsif(request0 = '1' and request1 = '0' and request2 = '1' and request3 = '1') then
                ack0 <= '0';
                ack3 <= '0';
                if(ack1 = '1' and ack2 = '0') then
                    ack1 <= '0';
                elsif(ack1 = '0' and ack2 = '1') then
                    ack2 <= '0';
                else
                    ack1 <= '1';
                    output <= data_bus1;
                end if;
            elsif(request0 = '1' and request1 = '1' and request2 = '0' and request3 = '0') then
                ack0 <= '0';
                ack3 <= '0';
                if(ack1 = '1' and ack2 = '0') then
                    ack1 <= '0';
                elsif(ack1 = '0' and ack2 = '1') then
                    ack2 <= '0';
                else
                    ack1 <= '1';
                    output <= data_bus1;
                end if;
            elsif(request0 = '1' and request1 = '1' and request2 = '0' and request3 = '1') then
                ack0 <= '0';
                ack3 <= '0';
                if(ack1 = '1' and ack2 = '0') then
                    ack1 <= '0';
                elsif(ack1 = '0' and ack2 = '1') then
                    ack2 <= '0';
                else
                    ack1 <= '1';
                    output <= data_bus1;
                end if;
            elsif(request0 = '1' and request1 = '1' and request2 = '1' and request3 = '0') then
                ack0 <= '0';
                ack3 <= '0';
                if(ack1 = '1' and ack2 = '0') then
                    ack1 <= '0';
                elsif(ack1 = '0' and ack2 = '1') then
                    ack2 <= '0';
                else
                    ack1 <= '1';
                    output <= data_bus1;
                end if;
            elsif(request0 = '1' and request1 = '1' and request2 = '1' and request3 = '1') then
                ack0 <= '0';
                ack3 <= '0';
                if(ack1 = '1' and ack2 = '0') then
                    ack1 <= '0';
                elsif(ack1 = '0' and ack2 = '1') then
                    ack2 <= '0';
                else
                    ack1 <= '1';
                    output <= data_bus1;
                end if;
            end if;
        end if;
    end process;
end rtl;
