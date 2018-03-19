-- Data Memory
-- This code implement a Data Memory for our procesor
-- Alexis Aceves & Esaú Acosta
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity data_mem is
    port(clk:in std_logic;
			addr:in STD_LOGIC_VECTOR (31 downto 0);
        data_in:in STD_LOGIC_VECTOR (31 downto 0);
        MemRead: in STD_LOGIC;
        MemWrite: in STD_LOGIC;
        data_out: out STD_LOGIC_VECTOR (31 downto 0)
    );
end data_mem;

architecture Behavioral_dm of data_mem is
    type RAM_16x32 is array (0 to 15) of STD_LOGIC_VECTOR (31 downto 0);
    signal DM: RAM_16x32:= (x"00000000",
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
                            x"00000000");
    begin
		process(clk)
		begin

			if (MemWrite = '1' and (clk'event and clk='1')) then
            DM((to_integer(unsigned(addr))-268500992)/4)<=data_in; --Nota:268500992=0x10010000

        end if;    

    end process;
	 data_out<= DM((to_integer(unsigned(addr))-268500992)/4) when MemRead = '1' else (others => 'Z');
end Behavioral_dm; 