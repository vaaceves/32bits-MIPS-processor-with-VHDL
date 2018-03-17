-- HALF_ADDER
-- This code implement a HALF_ADDER for our FULL_ADDER
-- Alexis Aceves & Esaú Acosta
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder is
    port (
        ha_in0, ha_in1 : in std_logic;
        ha_sum, ha_cout: out std_logic
    );
end half_adder;

architecture ha_dataflow of half_adder is
    begin
        ha_sum <= a xor b;
        ha_cout <= a and b;
end ha_dataflow; --ha_dataflow