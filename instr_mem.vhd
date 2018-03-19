-- Instruction Memory
-- This code implement a Instruction Memory for our procesor
-- Alexis Aceves & Esaú Acosta
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity instr_mem is
    port(addr: in STD_LOGIC_VECTOR(31 downto 0);
         instruction: out STD_LOGIC_VECTOR(31 downto 0)
    );
end instr_mem;

architecture behavioral_im of instr_mem is
    type RAM_16X32 is array (0 to 15) of std_logic_vector(31 downto 0);
    signal IM: RAM_16X32:=(x"00000024",
                            x"00000000",
                            x"00000000",
                            x"00000000",
                            x"00000000",
                            x"00000000",
                            x"00000000",
                            x"00000000",
                            x"00000000",
                            x"00000000",
                            x"00000000",
                            x"00000000",
                            x"00000000",
                            x"00000000",
                            x"00000000",
                            x"00000000"
                            ); --AQUI VAN LAS INSTRUCCIONES A EJECUTAR!
    
    begin
        Instruction <= x"00000000" when addr=x"003ffffc" else
                       IM ((to_integer(unsigned(addr))-4194304)/4);
    end behavioral_im;