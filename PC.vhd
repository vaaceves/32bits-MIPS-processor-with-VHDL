
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pc is
	port(
		ck: in std_logic;
		siguientedireccion: in std_logic_vector(31 downto 0);--direccion que llega, recordemos que es la anterior +4
		actualdireccion: out std_logic_vector(31 downto 0)
	);
end pc;

architecture Behavioral_pc of pc is

	signal address: std_logic_vector(31 downto 0):= x"00000000";

	begin

	process(ck)
		begin
		actualdireccion <= address;
		if ck='0' and ck'event then --apesar de estar el 0, esto se activa en el flanco de subida
			address <= siguientedireccion;
		end if;
	end process;

end Behavioral_pc;
