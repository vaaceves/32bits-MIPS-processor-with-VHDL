-- Sign Extender
-- This code implement a Sign extender for our procesor
-- Alexis Aceves & Esaú Acosta
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sign_ext is
	port (
		entrada: in std_logic_vector(15 downto 0);
		salida: out std_logic_vector(31 downto 0)
	);
end entity;

architecture dataflowse of sign_ext is
	begin
	salida <= x"0000" & entrada when entrada(15)='0' else
              x"FFFF" & entrada;
	
end dataflowse;