-- Register File
-- This code implement a Register File for our procesor
-- Alexis Aceves & Esaú Acosta
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Register_File is
    generic(
        B: integer:=32;
        W: integer:=5
    );

    port(ReadRegister1: in STD_LOGIC_VECTOR (4 downto 0);
         ReadRegister2: in STD_LOGIC_VECTOR (4 downto 0);
         WriteRegister: in STD_LOGIC_VECTOR (4 downto 0);
         WriteData: in STD_LOGIC_VECTOR (31 downto 0);
         RegWrite: in STD_LOGIC;
         ReadData1: out STD_LOGIC_VECTOR(31 downto 0);
         ReadData2: out STD_LOGIC_VECTOR (31 downto 0)
    );
end Register_File;

architecture Behavioral of Register_File is
type reg_file_type is array (0 to 2**W-1)of 
STD_LOGIC_VECTOR (B-1 downto 0);
    signal array_reg: reg_file_type := (x"00000000",
                                      x"11111111",
                                      x"22222222",
                                      x"33333333",
                                      x"44444444",
                                      x"55555555",
                                      x"66666666",
                                      x"77777777",
                                      x"88888888",
                                      x"99999999",
                                      x"aaaaaaaa",
                                      x"bbbbbbbb",
                                      x"cccccccc",
                                      x"dddddddd",
                                      x"eeeeeeee",
                                      x"ffffffff",
                                      x"00000000",
                                      x"11111111",
                                      x"22222222",
                                      x"33333333",
                                      x"44444444",
                                      x"55555555",
                                      x"66666666",
                                      x"77777777",
                                      x"88888888",
                                      x"99999999",
                                      x"aaaaaaaa",
                                      x"bbbbbbbb",
                                      x"10008000",
                                      x"7ffff1ec",
                                      x"eeeeeeee",
                                      x"ffffffff");
    begin
        process(RegWrite)
            begin
                if(RegWrite='1')then
                    array_reg(to_integer(unsigned(WriteRegister))) <= WriteData ;
            end if;
            end process;
            
            ReadData1 <= array_reg(to_integer(unsigned(ReadRegister1)));
            ReadData2 <= array_reg(to_integer(unsigned(ReadRegister2)));

end Behavioral;