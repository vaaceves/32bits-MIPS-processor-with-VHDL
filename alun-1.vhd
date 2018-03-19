--31 bits ALU
-- This code implement a 31 bits ALU conection for our procesor
-- Alexis Aceves & Esaú Acosta
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_1 is 
    port (
        alu_in0, alu_in1, alu_cin : in std_logic;
        alu_cout, alu_sign, alu_result : out std_logic;
        selector: in std_logic_vector(3 downto 0)
    );
end alu_1;

architecture alu_structural of alu_1 is
    --
    component Mux2x1
        port (
            mux_in0:in std_logic;
            mux_in1:in std_logic;
            mux_selector: in STD_LOGIC_VECTOR(1 downto 0);
            mux_out: out std_logic
        );
    end component;
    --
    component Mux4x1 
        port (
            mux_in0: in std_logic;
            mux_in1: in std_logic;
            mux_in2: in std_logic;
            mux_in3: in std_logic;
            mux_selector: in STD_LOGIC_VECTOR(1 downto 0);
            mux_out: out std_logic
        );
    end component;
    --
    component full_adder
        port(
            fa_in0, fa_in1, fa_cin: in std_logic;
            fa_sum, fa_cout: out std_logic
        );
    end component;
    --
    signal signal_fa, signal_or, signal_and, signal_selectorM2, signal_selectorM3, result1, result2 : std_logic;
    --
    begin
        --
        signal_and <= signal_selectorM2 and signal_selectorM3;
        signal_or <= signal_selectorM2 or signal_selectorM3;
        result1 <= not alu_in0;
        result2 <= not alu_in1;
        alu_sign <= signal_fa;
        --
        mux2x1_in0: Mux2x1 port map (
            mux_in0 => alu_in0,
            mux_in1 => result1,
            mux_selector => selector(3),
            mux_out => signal_selectorM3
        );
        --
        mux2x1_in1: Mu2x1 port map (
            mux_in0 => alu_in1,
            mux_in1 => result2,
            mux_selector => selector(2),
            mux_out => signal_selectorM2
        );
        --
        FullAdder: full_adder port map (
            fa_in0 => signal_selectorM3,
            fa_in1 => signal_selectorM2,
            fa_cin => alu_cin,
            fa_cout =>alu_cout,
            fa_sum => signal_fa
        );
        --
        mux4x1: Mux4x1 port map (
            mux_in0 => signal_and,
            mux_in1 => signal_or,
            mux_in2 => signal_fa,
            mux_in3 => '0',
            mux_selector(1) => selector(1),
            mux_selector(0) => selector(0),
            mux_out => alu_result
        );
        --
end alu_structural; --alu_1_structural
