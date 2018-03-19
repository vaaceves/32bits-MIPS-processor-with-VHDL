-- d latch
-- This code implement a a latch for our d register
-- Alexis Aceves & Esaú Acosta
--
library ieee;
use ieee.std_logic_1164.all;

entity d_latch is
  port(
    d, e: in std_logic;
    q: out std_logic
  );
end d_latch;

architecture behavioral of d_latch is
begin

  process( d, e )
  begin
    if e = '1' then
      q <= d;
    end if;
  end process ; -- identifier

end behavioral ; -- behavioral