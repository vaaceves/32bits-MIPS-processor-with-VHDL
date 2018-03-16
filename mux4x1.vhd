-- 4 to 1 MUX
-- This code implement a 4x1 mux for our procesor
-- Alexis Aceves & Esaú Acosta
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4x1 is
    port(
         mux_in0:in STD_LOGIC;
         mux_in1:in STD_LOGIC;
         mux_in2:in STD_LOGIC;
         mux_in3:in STD_LOGIC;
         mux_selector: in STD_LOGIC_VECTOR(1 downto 0);
         mux_out: out STD_LOGIC;
    );
end Mux4x1;

architecture DataFlow of Mux4x1 is
    begin
        -- the mux output will be the 0 if mux_ctl value its 0,
        -- otherwise it the output will be 1.
        mux_out<=mux_in0 when mux_selector="00"else
                mux_in1 when mux_selector="01"else
                mux_in2 when mux_selector="10"else 
                mux_in3;
end DataFlow;                