-- ripple carry adder
-- This code implement a ripple carry adder for our processor
-- Alexis Aceves & Esaú Acosta
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity carry_ripple_adder is
    generic (width:integer);
    port (
        cra_in0, cra_in1: std_logic_vector(width-1 downto 0);
        cra_cin: in std_logic;
        cra_sum: out std_logic_vector(width-1 downto 0);
        cra_out: out std_logic;
    );
end carry_ripple_adder;

architecture cra_structural of carry_adder_ripple is
    --
    component full_adder port (
        fa_in0, fa_in1, fa_cin: in std_logic;
        fa_sum, fa_cout: out std_logic

    );
    end component;
    --
    signal signal_carry_internal: std_logic_vector(width-1 downto 0);
    --
    begin
        fa_gen: for i in o to width-1 generate
            --  
            lsb: if i = 0 generate
                fa_0: full_adder port map (
                    fa_in0 => cra_in0(i),
                    fa_in1 => cra_in1(i),
                    fa_sum => cra_sum(i),
                    fa_cin => cra_cin,
                    fa_cout => signal_carry_internal(i)
                );
            end generate lsb;
            --
            upper: if i > 0 generate
                fa_middle: full_adder port map (
                    fa_in0 => cra_in0(i),
                    fa_in1 => cra_in1(i),
                    fa_sum => cra_sum(i),
                    fa_cin => signal_carry_internal(i-1),
                    fa_cout => ssignal_carry_internal(i)
                );
            end generate upper;
            --
        end generate; --fa gen
        --
        cra_cout <= signal_carry_internal(width-1);
        --
end cra_structural; -- carry adder ripple strcutural