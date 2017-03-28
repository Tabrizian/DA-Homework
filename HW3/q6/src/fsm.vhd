library ieee;
use ieee.std_logic_1164.all;

entity fsm is
    port(
            x: in std_logic;
            res: out std_logic;
            clk: in std_logic;
            rst: in std_logic
        );
end entity;

architecture process_3 of fsm is
    type STATE_TYPE is (A, B, C, D, RST_ST);
    signal current_state, next_state: STATE_TYPE;
begin
    process(clk)
    begin
        if(rising_edge(clk)) then
            if(rst = '1') then
                current_state <= RST_ST;
            else
                current_state <= next_state;
            end if;
        end if;
    end process;

    process(current_state, x)
    begin
        case current_state is
            when RST_ST =>
                next_state <= A;
            when A =>
                if(x = '1') then
                    next_state <= B;
                else
                    next_state <= A;
                end if;
            when B =>
                if(x = '1') then
                    next_state <= C;
                else
                    next_state <= A;
                end if;
            when C =>
                if(x = '1') then
                    next_state <= D;
                else
                    next_state <= A;
                end if;
            when D =>
                if(x = '1') then
                    next_state <= D;
                else
                    next_state <= A;
                end if;
        end case;
    end process;

    process(current_state)
    begin
        case current_state is
            when RST_ST =>
                res <= '0';
            when A =>
                res <= '0';
            when B =>
                res <= '0';
            when C =>
                res <= '0';
            when D =>
                res <= '1';
        end case;
    end process;
end process_3;

architecture process_2 of fsm is
    type STATE_TYPE is (A, B, C, D, RST_ST);
    signal current_state: STATE_TYPE;
begin

    process(clk)
    begin
        if(rising_edge(clk)) then
            if(rst = '1') then
                current_state <= RST_ST;
            else
                case current_state is
                    when RST_ST =>
                        current_state <= A;
                    when A =>
                        if(x = '1') then
                            current_state <= B;
                        else
                            current_state <= A;
                        end if;
                    when B =>
                        if(x = '1') then
                            current_state <= C;
                        else
                            current_state <= A;
                        end if;
                    when C =>
                        if(x = '1') then
                            current_state <= D;
                        else
                            current_state <= A;
                        end if;
                    when D =>
                        if(x = '1') then
                            current_state <= D;
                        else
                            current_state <= A;
                        end if;
                end case;
            end if;
        end if;
    end process;

    process(current_state)
    begin
        case current_state is
            when RST_ST =>
                res <= '0';
            when A =>
                res <= '0';
            when B =>
                res <= '0';
            when C =>
                res <= '0';
            when D =>
                res <= '1';
        end case;
    end process;
end process_2;
