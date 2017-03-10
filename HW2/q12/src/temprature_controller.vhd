library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity temprature_controller is
    port(
            t0: in integer;
            t1: in integer;
            t2: in integer;
            t3: in integer;
            t4: in integer;
            heater: out std_logic;
            cooler: out std_logic
        );
end entity;

architecture concurrent of temprature_controller is
    signal cond1: std_logic;
    signal t: integer;
begin

    t <= (t0 + t1 + t2 + t3) * 4;

    heater <= '1' when t < t4 - 5 else
              '0' when (t < t4 + 2) and (t > t4 - 2) else
              '0' when (t > t4 + 4);

    cooler <= '0' when t < t4 - 5 else
              '1' when (t < t4 + 2) and (t > t4 - 2) else
              '1' when (t > t4 + 4);

end concurrent;

architecture sequential of temprature_controller is
    signal cond1: std_logic;
    signal t: integer;
begin
    process(t0, t1, t2, t3, t4)
    begin

        t <= (t0 + t1 + t2 + t3) * 4;

        if(t < t4 - 5) then
            heater <= '1';
            cooler <= '0';
        elsif(t < t4 + 2) then
            heater <= '0';
            cooler <= '1';
        elsif(t > t4 + 4) then
            heater <= '0';
            cooler <= '1';
        end if;

    end process;
end sequential;

