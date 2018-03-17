-- ALU CONTROL UNIT
-- This code implement a the control sign for the ALU module for our procesor
-- Alexis Aceves & Esaú Acosta
--
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity alu_control_unit is 
    port(
        ALUOp: in std_logic_vector(1 downto 0);
        FuncCode: in std_logic_vector(5 downto 0); 
        ALUCtl: out std_logic_vector(3 downto 0)
    );
end alu_control_unit;

architecture alu_ctrl_structural of alu_control_unit is
    begin
        ALUCtl <= "0010" when ALUOp(1) = '0' and ALUOp(0) = '0' else
                  "0110" when ALUOp(1) = '0' and ALUOp(0) = '1' else
                  "0010" when ALUOp(1) = '1' and ALUOp(0) = '0' and FuncCode(3) = '0' and FuncCode(2) = '0' and FuncCode(1) = '0' and FuncCode(0) = '0' else
                  "0110" when ALUOp(1) = '1' and FuncCode(3) = '0' and FuncCode(2) = '0' and FuncCode(1) = '1' and FuncCode(0) = '0' else
                  "0000" when ALUOp(1) = '1' and ALUOp(0) = '0' and FuncCode(3) = '0' and FuncCode(2) = '1' and FuncCode(1) = '0' and FuncCode(0) = '0' else
                  "0001" when ALUOp(1) = '1' and ALUOp(0) = '0' and FuncCode(3) = '0' and FuncCode(2) = '1' and FuncCode(1) = '0' and FuncCode(0) = '1' else
                  "0111" when ALUOp(1) = '1' and FuncCode(3) = '1' and FuncCode(2) = '0' and FuncCode(1) = '1' and FuncCode(0) = '0';

end alu_ctrl_structural;--alu control unit structural