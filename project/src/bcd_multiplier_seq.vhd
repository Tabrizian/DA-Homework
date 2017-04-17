library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity bcd_multiplier_seq is
    port(
            a: in std_logic_vector(31 downto 0) := (others => '0');
            b: in std_logic_vector(31 downto 0) := (others => '0');
            c: out std_logic_vector(63 downto 0) := (others => '0');
            rst : in std_logic := '0';
            clk: in std_logic := '0'
        );
end entity;

architecture struct of bcd_multiplier_seq is
    component bcd_8_by_1_multiplier is
        port(
                a: in std_logic_vector(31 downto 0);
                b: in std_logic_vector(3 downto 0);
                res: out std_logic_vector(35 downto 0)
            );
    end component;

    component bcd_64_bit_adder is
        port(
                a: in std_logic_vector(63 downto 0);
                b: in std_logic_vector(63 downto 0);
                res: out std_logic_vector(63 downto 0)
            );
    end component;

    signal res: std_logic_vector(35 downto 0) := (others => '0');
    signal final_result: std_logic_vector(63 downto 0) := (others => '0');
    signal multipicand: std_logic_vector(3 downto 0) := (others => '0');

    signal to_be_added: std_logic_vector(63 downto 0) := (others => '0');
    signal addition: std_logic_vector(63 downto 0) := (others => '0');

begin

    digit_multiplier: bcd_8_by_1_multiplier port map(a, multipicand, res);
    adder: bcd_64_bit_adder port map(final_result, to_be_added, addition);

    process(clk)
        variable i: integer := 0;
        variable state: integer := 0;
        constant WAITING: integer := 0;
        constant MULTIPLYING: integer := 1;
        constant ADDING: integer := 2;
    begin
        if(clk'event and clk = '1') then
            if(i < 7) then
                if(state = WAITING) then
                    multipicand <= b(4 * (8 - i) - 1 downto 4 * (8 - i - 1));
                    final_result <= std_logic_vector(unsigned(final_result) sll 4);
                    state := MULTIPLYING;
                elsif(state = MULTIPLYING) then
                    to_be_added(35 downto 0) <= res;
                    state := ADDING;
                elsif(state = ADDING) then
                    final_result <= addition;
                    state := WAITING;
                    i := i + 1;
                end if;
            elsif(i = 7) then
                final_result <= std_logic_vector(unsigned(final_result) sll 4);
                i := i + 1;
            elsif(i = 8) then
                c <= final_result;
            else
            end if;
            if(rst = '1') then
                state := WAITING;
                i := 0;
            end if;
        end if;
        if(a'event or b'event) then
            i := 0;
        end if;

    end process;

end struct;
