library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cryptor is
    port(
            a: in std_logic_vector(7 downto 0);
            b: in std_logic_vector(7 downto 0);
            key: in std_logic_vector(7 downto 0);
            rst: in std_logic;
            clk: in std_logic;
            outputa: out std_logic_vector(7 downto 0);
            outputb: out std_logic_vector(7 downto 0)
        );
end entity;

architecture rtl of cryptor is

    component stage is
        port(
                a: in std_logic_vector(7 downto 0);
                b: in std_logic_vector(7 downto 0);
                key: in std_logic_vector(7 downto 0);
                outputa: out std_logic_vector(7 downto 0);
                outputb: out std_logic_vector(7 downto 0)
            );
    end component;

    type STATE is (S1, S2, S3, S4, S5, S6, S7, S8, FINISH);
    signal current_state: STATE := S1;

    signal a_current: std_logic_vector(7 downto 0);
    signal b_current: std_logic_vector(7 downto 0);

    signal crypted_a: std_logic_vector(7 downto 0);
    signal crypted_b: std_logic_vector(7 downto 0);

begin

    crypto: stage port map(a_current, b_current, key, crypted_a, crypted_b);

    process(clk)
    begin
        if(rising_edge(clk)) then
            if(rst = '1') then
                current_state <= S1;
            else
                case current_state is
                    when S1 =>
                        a_current <= a;
                        b_current <= b;
                        current_state <= S2;

                    when S2 =>
                        a_current <= crypted_a;
                        b_current <= crypted_b;
                        current_state <= S3;

                    when S3 =>
                        a_current <= crypted_a;
                        b_current <= crypted_b;
                        current_state <= S3;

                    when S4 =>
                        a_current <= crypted_a;
                        b_current <= crypted_b;
                        current_state <= S3;

                    when S5 =>
                        a_current <= crypted_a;
                        b_current <= crypted_b;
                        current_state <= S3;

                    when S6 =>
                        a_current <= crypted_a;
                        b_current <= crypted_b;
                        current_state <= S3;

                    when S7 =>
                        a_current <= crypted_a;
                        b_current <= crypted_b;
                        current_state <= S3;

                    when S8 =>
                        a_current <= crypted_a;
                        b_current <= crypted_b;
                        current_state <= FINISH;

                    when FINISH =>
                        outputa <= a_current;
                        outputb <= b_current;
                        current_state <= FINISH;

                end case;
            end if;
        end if;
    end process;
end rtl;


