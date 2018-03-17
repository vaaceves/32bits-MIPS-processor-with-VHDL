-- Complete ALU
-- This code implement a entire ALU module for our procesor
-- Alexis Aceves & Esaú Acosta
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu is
    port (
        alu_in0: in STD_LOGIC_VECTOR(31 downto 0);
        alu_in1: in STD_LOGIC_VECTOR(31 downto 0);
        alu_control: in STD_LOGIC_VECTOR(3 downto 0);
        alu_zero: out std_logic;
        alu_cout: out std_logic;
        alu_result: out STD_LOGIC_VECTOR(31 downto 0)
    );
end alu;

architecture alu_structural of alu is
    --
    component alu_i
        port (
            alu_in0, alu_in1, alu_cin, alu_sign: in std_logic;
            alu_cout, alu_result: out std_logic;
            selector: in std_logic_vector(3 downto 0)
        );
    end component;
    --
    component alu_1
        port (
            alu_in0, alu_in1, alu_cin : in std_logic;
            alu_cout, alu_sign, alu_result : out std_logic;
            selector: in std_logic_vector(3 downto 0)
        );
    end component;
    --
    signal signal_sign: std_logic;
    signal signal_carry: std_logic_vector(31 downto 0);
    signal signal_result: std_logic_vector(31 downto 0);
    --
    begin
        alus: for i in 0 to 31 generate
            --
            alu0: if i = 0 generate
                alu_0: alu_i port map (
                    alu_in0 => alu_in0(i),
                    alu_in1 => alu_in1(i),
                    alu_result => signal_result(i),
                    alu_cin => alu_control(2),
                    alu_cout => signal_carry(i),
                    alu_sign => signal_sign,
                    selector(3) => alu_control(3),
                    selector(2) => alu_control(2),
                    selector(1) => alu_control(1),
                    selector(0) => alu_control(0)
                );
            end generate alu0;
            --
            alu_n_1: if i > 0 generate
                alu_1_30: alu_i port map (
                    alu_in0 => alu_in0(i),
                    alu_in1 => alu_in1(i),
                    alu_result => signal_result(i),
                    alu_cin => signal_carry(i-1),
                    alu_cout => signal_carry(i),
                    alu_sign => '0',
                    selector(3) => alu_control(3),
                    selector(2) => alu_control(2),
                    selector(1) => alu_control(1),
                    selector(0) => alu_control(0)
                );
            end generate alu_n_1;
            --
            final_alu: if i = 31 generate
                alu_31: alu_1 port map (
                    alu_in0 => alu_in0(i),
                    alu_in1 => alu_in1(i),
                    alu_result => signal_result(i),
                    alu_cin => signal_carry(i-1),
                    alu_cout => signal_carry(i),
                    alu_sign => signal_sign,
                    selector(3) => alu_control(3),
                    selector(2) => alu_control(2),
                    selector(1) => alu_control(1),
                    selector(0) => alu_control(0)
                );
            end generate final_alu;
            --
        end generate;
        --
        alu_result <= signal_result;
        alu_cout <= signal_carry(31);
        --sign
        alu_zero <= '1' when signal_result = (signal_result'range => '0') else '0';
    --
end alu_structural;--full alu structural

