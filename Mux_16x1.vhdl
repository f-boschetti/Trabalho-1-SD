library IEEE;
use IEEE.std_logic_1164.all;

--Declara todas as entradas e saidas do circuto

entity mux_2x1 is
	port(
    	in1, in2: in std_logic_vector (15 downto 0);
    	sel: in std_logic;
        s: out std_logic_vector (15 downto 0)
    );
end mux_2x1;

architecture arch of mux_2x1 is
	begin
    
	process(in1, in2, sel)
    	begin
        	
            if (sel = '0') then
            		s <= in1;
			
            elsif (sel = '1') then
						s <= in2;
                        
            end if;
    end process;        
    
end arch;