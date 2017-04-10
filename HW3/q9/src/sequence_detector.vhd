library ieee;
use ieee.std_logic_1164.all;
use work.common.all;

entity sequence_detector is
    port(
            input: in std_logic_vector(1 downto 0);
            clk: in std_logic;
            output: out std_logic_vector(1 downto 0)
        );
end sequence_detector;

architecture behavorial of sequence_detector is
    type STATE_TYPE is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12);
    signal state: STATE_TYPE := s0;
    constant A: std_logic_vector(1 downto 0) := "00";
    constant T: std_logic_vector(1 downto 0) := "01";
    constant C: std_logic_vector(1 downto 0) := "10";
    constant G: std_logic_vector(1 downto 0) := "11";
begin
    process(clk)
    begin
        if (rising_edge(clk)) then
            case state is
                when s0 =>
                    if(input = A) then
                        state <= s12;
                    elsif(input = T) then
                        state <= s0;
                    elsif(input = C) then
                        state <= s0;
                    elsif(input = G) then
                        state <= s1;
                    end if;
                    output <= "00";
                    report integer'image(0);
                when s1 =>
                    if(input = A) then
                        state <= s2;
                    elsif(input = T) then
                        state <= s0;
                    elsif(input = C) then
                        state <= s0;
                    elsif(input = G) then
                        state <= s1;
                    end if;
                    output <= "00";
                    report integer'image(1);
                when s2 =>
                    if(input = A) then
                        state <= s12;
                    elsif(input = T) then
                        state <= s3;
                    elsif(input = C) then
                        state <= s11;
                    elsif(input = G) then
                        state <= s1;
                    end if;
                    output <= "00";
                    report integer'image(2);
                when s3 =>
                    if(input = A) then
                        state <= s4;
                    elsif(input = T) then
                        state <= s0;
                    elsif(input = C) then
                        state <= s0;
                    elsif(input = G) then
                        state <= s1;
                    end if;
                    output <= "00";
                    report integer'image(3);
                when s4 =>
                    if(input = A) then
                        state <= s12;
                    elsif(input = T) then
                        state <= s5;
                    elsif(input = C) then
                        state <= s11;
                    elsif(input = G) then
                        state <= s1;
                    end if;
                    output <= "00";
                    report integer'image(4);
                when s5 =>
                    if(input = A) then
                        state <= s6;
                    elsif(input = T) then
                        state <= s0;
                    elsif(input = C) then
                        state <= s0;
                    elsif(input = G) then
                        state <= s1;
                    end if;
                    output <= "00";
                    report integer'image(5);
                when s6 =>
                    if(input = A) then
                        state <= s12;
                    elsif(input = T) then
                        state <= s7;
                    elsif(input = C) then
                        state <= s11;
                    elsif(input = G) then
                        state <= s1;
                    end if;
                    output <= "00";
                    report integer'image(6);
                when s7 =>
                    if(input = A) then
                        state <= s12;
                    elsif(input = T) then
                        state <= s0;
                    elsif(input = C) then
                        state <= s0;
                    elsif(input = G) then
                        state <= s8;
                    end if;
                    output <= "00";
                    report integer'image(7);
                when s8 =>
                    if(input = A) then
                        state <= s12;
                    elsif(input = T) then
                        state <= s0;
                    elsif(input = C) then
                        state <= s9;
                    elsif(input = G) then
                        state <= s1;
                    end if;
                    output <= "00";
                    report integer'image(8);
                when s9 =>
                    if(input = A) then
                        state <= s12;
                    elsif(input = T) then
                        state <= s0;
                    elsif(input = C) then
                        state <= s0;
                    elsif(input = G) then
                        state <= s1;
                    end if;
                    output <= "01";
                    report integer'image(9);
                when s10 =>
                    if(input = A) then
                        state <= s2;
                    elsif(input = T) then
                        state <= s0;
                    elsif(input = C) then
                        state <= s11;
                    elsif(input = G) then
                        state <= s1;
                    end if;
                    output <= "10";
                    report integer'image(10);
                when s11 =>
                    if(input = A) then
                        state <= s12;
                    elsif(input = T) then
                        state <= s0;
                    elsif(input = C) then
                        state <= s0;
                    elsif(input = G) then
                        state <= s10;
                    end if;
                    output <= "00";
                    report integer'image(11);
                when s12 =>
                    if(input = A) then
                        state <= s12;
                    elsif(input = T) then
                        state <= s0;
                    elsif(input = C) then
                        state <= s11;
                    elsif(input = G) then
                        state <= s1;
                    end if;
                    output <= "00";
                    report integer'image(12);
            end case;
        end if;

    end process;
end behavorial;
