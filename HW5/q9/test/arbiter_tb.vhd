library IEEE;
use IEEE.std_logic_1164.all;

entity arbiter_tb is
end entity;

architecture tb of arbiter_tb is
    component arbiter is
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
    end component;

    signal data_bus0: std_logic_vector(7 downto 0);
    signal request0: std_logic := '0';
    signal ack0: std_logic := '0';
    signal data_bus1: std_logic_vector(7 downto 0);
    signal request1: std_logic := '0';
    signal ack1: std_logic := '0';
    signal data_bus2: std_logic_vector(7 downto 0);
    signal request2: std_logic := '0';
    signal ack2: std_logic := '0';
    signal data_bus3: std_logic_vector(7 downto 0);
    signal request3: std_logic := '0';
    signal ack3: std_logic := '0';
    signal output: std_logic_vector(7 downto 0);
    signal clk: std_logic := '0';

begin
    mapping: arbiter port map(data_bus0, request0, ack0, data_bus1, request1, ack1, data_bus2, request2, ack2, data_bus3, request3, ack3, output, clk);
    clk <= not clk after 2 ns;
    data_bus0 <= "11111000";
    request0 <= '1' after 0 ns,
                '0' after 10 ns;
    data_bus1 <= "11111111";
    request1 <= '0' after 0 ns,
                '1' after 10 ns;

end tb;
