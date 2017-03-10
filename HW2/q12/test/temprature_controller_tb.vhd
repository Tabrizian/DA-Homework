library IEEE;
use IEEE.std_logic_1164.all;

entity temprature_controller_tb is
end entity;

architecture tb of temprature_controller_tb is
    component temprature_controller is
        port(
                t0: in integer;
                t1: in integer;
                t2: in integer;
                t3: in integer;
                t4: in integer;
                heater: out std_logic;
                cooler: out std_logic
            );
    end component;

    signal t0: integer;
    signal t1: integer;
    signal t2: integer;
    signal t3: integer;
    signal t4: integer;
    signal heater: std_logic;
    signal cooler: std_logic;

begin
    mapping: temprature_controller port map(t0, t1, t2, t3, t4, heater, cooler);

    t0 <= 0 after 0 ns,
          0 after 10 ns,
          0 after 20 ns,
          0 after 30 ns;

    t1 <= 0 after 0 ns,
          0 after 10 ns,
          0 after 20 ns,
          0 after 30 ns;

    t2 <= 0 after 0 ns,
          0 after 10 ns,
          0 after 20 ns,
          0 after 30 ns;

    t3 <= 0 after 0 ns,
          0 after 10 ns,
          0 after 20 ns,
          0 after 30 ns;

    t4 <= 0 after 0 ns,
          0 after 10 ns,
          0 after 20 ns,
          0 after 30 ns;
end tb;
