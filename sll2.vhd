-- Shift Left
-- This code implement a Shift Left for our procesor
-- Alexis Aceves & Esaú Acosta
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sll2 is
    generic(
        B: integer:=32;
        W: integer:=2
    );
	port (
		entrada: in std_logic_vector(B-1 downto 0);
		salida: out std_logic_vector(B-1 downto 0)
	);
end entity;

architecture behavioral_sh of sll2 is
	signal temp: std_logic_vector(B-1 downto 0);

	begin
	temp <= std_logic_vector(resize(unsigned(entrada), B));
	salida <= std_logic_vector(shift_left(signed(temp), 2));
end behavioral_sh;