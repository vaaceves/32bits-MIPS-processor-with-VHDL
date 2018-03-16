-- 2 to 1 MUX
-- This code implement a 2x1 mux for our procesor
-- Alexis Aceves & Esaú Acosta
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2x1 is
    port(mux_in0:in std_logic;
         mux_in1:in std_logic;
         mux_selector: in STD_LOGIC_VECTOR(1 downto 0);
         mux_out: out std_logic;
    );
end Mux2x1;

architecture DataFlow of Mux2x1 is
    begin
        -- the mux output will be the 0 if mux_ctl value its 0,
        -- otherwise it the output will be 1.
        mux_out<=mux_in0 when mux_selector='0'else
                mux_in1;
end DataFlow;                