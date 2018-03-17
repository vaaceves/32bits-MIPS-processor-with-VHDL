-- FULL_ADDER
-- This code implement a FULL_ADDER for our ALU
-- Alexis Aceves & Esaú Acosta
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    port (
        fa_in0, fa_in1, fa_cin: in std_logic;
        fa_sum, fa_cout: out std_logic
    );
end full_adder;

architecture fa_dataflow of full_adder is
    component half_adder port (
        ha_in0, ha_in1 : in std_logic;
        ha_sum, ha_cout: out std_logic
    );
    end component;

    signal sum_partial, cout1, cout2: std_logic;

    begin
        ha_u0 : half_adder port map (
            ha_in0 => ha_in0,
            ha_in1 => ha_in1,
            ha_sum => sum_partial,
            ha_cout => cout1
        );
        --
        ha_u1 : half_adder port map (
            ha_in0 => sum_partial,
            ha_in1 => fa_cin,
            ha_sum => fa_sum,
            ha_cout => cout2
        );

        fa_cout <= cout1 or cout2;
end fa_dataflow; -- full adder data flow