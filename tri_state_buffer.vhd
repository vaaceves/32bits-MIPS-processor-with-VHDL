-- tri-state buffer
-- This code implement a tri-state-buffer for our procesor
-- Alexis Aceves & Esaú Acosta
--
library ieee;
use ieee.std_logic_1164.all;

entity tri_state_buff is 
    port(
        data_in: in std_logic_vector(31 downto 0);
        data_out: out std_logic_vector(31 downto 0);
        en_buff: in std_logic
    );   
end tri_state_buff;

architecture behavioral of tri_state_buff is
    begin 
        gen_buffer_array : for i in 0 to 31 generate
            data_out(i) <= data_in(i) when (en_buff = '1') else 'Z';
    end generate;    
end behavioral;