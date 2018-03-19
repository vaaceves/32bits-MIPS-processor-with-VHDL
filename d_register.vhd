-- d register
-- This code implement a d register 
-- Alexis Aceves & Esaú Acosta
--
library ieee;
use ieee.std_logic_1164.all;

entity d_register is
  generic (n : integer);
  port (
    d: in std_logic_vector(n-1 downto 0) ;
    load, clear, clock: in std_logic;
    q: out std_logic_vector(n-1 downto 0)
  ) ;
end d_register;

architecture structural of d_register is

  signal not_clock: std_logic;
  signal mux_load, and_clear, q_slave, q_master: std_logic_vector(n-1 downto 0) ;

  component d_latch
    port(
      d, e: in std_logic;
      q: out std_logic
    );
  end component;

begin

  not_clock <= not clock;

  q <= q_master;
  
  latch_gen : for i in 0 to n-1 generate,
    mux_load(i) <= d(i) when load = '1' else q_master(i);
    and_clear(i) <= mux_load(i) and not clear;
    slave: d_latch port map(and_clear(i), not_clock, q_slave(i));
    master: d_latch port map(q_slave(i), clock, q_master(i));
  end generate ; -- latch_gen


end structural ; -- structural