library IEEE;
use IEEE.std_logic_1164.all;

--Declara todas as entradas e saidas do circuto

entity mux_4x1 is
	port(
    	in0, in1, in2, in3: in std_logic_vector (15 downto 0);
    	sel1 , sel2: in std_logic;
        s: out std_logic_vector (15 downto 0)
    );
end mux_4x1;

architecture arch of mux_4x1 is
	begin
    
	process(in0, in1, in2, in3, sel1, sel2)
    	begin
        	
            if (sel1 = '0') then --Se for 00 a saida e a in0
            	if (sel2 = '0') then
            		s <= in0;
            	end if;
            end if; 	
            		
            if (sel1 = '0') then -- Se for 01 a saida e in1
            	if (sel2 = '1') then
            		s <= in1;
            	end if;
            end if;
            		
            if (sel1 = '1') then -- Se for 10 a saida e in2
            	if (sel2 = '0') then
            		s <= in2;
            	end if;
            end if;
            	
            if (sel1 = '1') then -- se for 11 a saida é in3
            	if (sel2 = '1') then
						s <= in3;
                end if;
            end if;
    end process;        
    
end arch;