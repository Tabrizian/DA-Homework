library IEEE;
use IEEE.std_logic_1164.all;

entity spaghetti_controller is
    port(
            pressure: in integer;
            output: out std_logic_vector(1 downto 0)
        );
end entity;

architecture selected_signal_assignment of spaghetti_controller is
begin

    with pressure select output <=
        "00" when 5,
        "00" when 6,
        "00" when 7,
        "00" when 8,
        "00" when 9,
        "00" when 10,
        "01" when 11,
        "01" when 12,
        "01" when 13,
        "01" when 14,
        "01" when 15,
        "10" when 16,
        "10" when 17,
        "10" when 18,
        "10" when 19,
        "10" when 20,
        "11" when 21,
        "10" when 22,
        "10" when 23,
        "10" when 24,
        "10" when 25,
        "UU" when others;

end selected_signal_assignment;

architecture conditional_signal_assignment of spaghetti_controller is
begin

    output <= "00" when pressure >= 5 and pressure <= 10 else
              "01" when pressure >= 11 and pressure <= 15 else
              "10" when pressure >= 16 and pressure <= 20 else
              "11" when pressure >= 21 and pressure <= 25 else
              "UU";

end conditional_signal_assignment;

architecture if_then_else of spaghetti_controller is
begin

    process(pressure)
    begin
        if(pressure >= 5 and pressure <= 10) then
            output <= "00";
        elsif(pressure >= 11 and pressure <= 15) then
            output <= "01";
        elsif(pressure >= 16 and pressure <= 20) then
            output <= "10";
        elsif(pressure >= 21 and pressure <= 25) then
            output <= "11";
        else
            output <= "UU";
        end if;
    end process;

end if_then_else;
