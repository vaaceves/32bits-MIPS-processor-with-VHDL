-- Dec5x32
-- This code implement a decoder 5x32 for our procesor
-- Alexis Aceves & Esaú Acosta
--
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Dec5x32 is
    port (
        a: in std_logic_vector(4 downto 0);
        e: in std_logic;
        d: out std_logic_vector(31 downto 0)
    );
end Dec5x32;

architecture behavorial of Dec5x32 is
    begin
        process (a, e) begin 
        if a="00000" and e='1' then --0
            d <= x"00000001";
        elsif a="00001" and e='1' then --1
            d <= x"00000002";
        elsif a="00010" and e='1' then --2
            d <= x"00000004";
        elsif a="00011" and e='1' then --3
            d <= x"00000008";
        elsif a="00100" and e='1' then --4
            d <= x"00000010";
        elsif a="00101" and e='1' then --5
            d <= x"00000020";
        elsif a="00110" and e='1' then --6
            d <= x"00000040";
        elsif a="00111" and e='1' then --7
            d <= x"00000080";
        elsif a="01000" and e='1' then --8
            d <= x"00000100";
        elsif a="01001" and e='1' then --9
            d <= x"00000200";
        elsif a="01010" and e='1' then --10
            d <= x"00000400";
        elsif a="01011" and e='1' then --11
            d <= x"00000800";
        elsif a="01100" and e='1' then --12
            d <= x"00001000";
        elsif a="01101" and e='1' then --13
            d <= x"00002000";
        elsif a="01110" and e='1' then --14
            d <= x"00004000";
        elsif a="01111" and e='1' then --15
            d <= x"00008000";
        elsif a="10000" and e='1' then --16
            d <= x"00010000";
        elsif a="10001" and e='1' then --17
            d <= x"00020000";
        elsif a="10010" and e='1' then --18
            d <= x"00040000";
        elsif a="10011" and e='1' then --19
            d <= x"00080000";
        elsif a="10100" and e='1' then --20
            d <= x"00100000";
        elsif a="10101" and e='1' then --21
            d <= x"00200000";
        elsif a="10110" and e='1' then --22
            d <= x"00400000"; 
        elsif a="10111" and e='1' then --23
            d <= x"00800000";
        elsif a="11000" and e='1' then --24
            d <= x"01000000";
        elsif a="11001" and e='1' then --25
            d <= x"02000000";
        elsif a="11010" and e='1' then --26
            d <= x"04000000";
        elsif a="11011" and e='1' then --27
            d <= x"08000000";
        elsif a="11100" and e='1' then --28
            d <= x"10000000";
        elsif a="11101" and e='1' then --29
            d <= x"20000000";
        elsif a="11110" and e='1' then --30
            d <= x"40000000";
        elsif a="11111" and e='1' then --31
            d <= x"80000000";
        else
            d <= x"00000000";
        end if;
    end process;
end behavorial; -- dec 5x32 behavorial