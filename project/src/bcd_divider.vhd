library ieee;
use ieee.std_logic_1164.all;

entity bcd_divider is
    port(
        a: in std_logic_vector(3 downto 0);
        q: in std_logic_vector(3 downto 0);
        b: in std_logic_vector(3 downto 0);
        rst: in std_logic;
        clk: in std_logic;
    );
end entity;

architecture rtl of bcd_divider is
    component n_bit_adder
        generic(N: integer);
        port(
                a: in std_logic_vector(N - 1 downto 0);
                b: in std_logic_vector(N - 1 downto 0);
                cin: in std_logic;
                res: out std_logic_vector(N - 1 downto 0);
                cout: out std_logic
            );
    end component;

    type STATE_T is (S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11,
                    S_END);
    signal state: STATE_T := S1;
    signal a_adder, b_adder, res_adder: std_logic_vector(3 downto 0);
    signal cout_adder, cin_adder: std_logic;

begin
    adder: n_bit_adder generic map(4) port map(a_adder, b_adder,
                                        cin_adder, res_adder, cout_adder);
    process(clk)
    begin
        if(rising_edge(clk)) then
            if(rst = '1') then
                state <= S1;
            else
                case state is
                    when S1 =>
                    when S2 =>
                    when S3 =>
                    when S4 =>
                    when S5 =>
                    when S6 =>
                    when S7 =>
                    when S8 =>
                    when S9 =>
                    when S10 =>
                    when S11 =>
                    when S_END =>
                end case;
            end if;
        end if;
    end process;
end rtl;
