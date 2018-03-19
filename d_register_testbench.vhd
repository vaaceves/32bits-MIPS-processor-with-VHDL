library ieee;
use ieee.std_logic_1164.all;

entity d_register_testbench is
end d_register_testbench;

architecture mixed of d_register_testbench is

  signal d, q : std_logic_vector(7 downto 0) ;
  signal clk : std_logic := '0';
  signal load, clear : std_logic;
  signal finish_flag: boolean := false;
  component d_register
    generic (n : integer);
    port (
      d: in std_logic_vector(n-1 downto 0) ;
      load, clear, clock: in std_logic;
      q: out std_logic_vector(n-1 downto 0)
    ) ;
  end component d_register;

begin

  clock_gen : process
  begin
    wait for 1 ns;
    clk <= not clk;
    if finish_flag then
      wait;
    end if;
  end process ; -- clock_gen

  stimuli : process
  begin
    clear <= '1'; load <= '0'; d <= "11110011"; wait for 2 ns;
    clear <= '0';load <= '1'; wait for 2 ns;
    finish_flag <= true;
    wait;
  end process ; -- stimuli

  d_reg: d_register generic map (8) port map(d, load, clear, clk, q);

end mixed ; -- mixed