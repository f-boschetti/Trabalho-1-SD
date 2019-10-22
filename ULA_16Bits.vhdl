library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


ENTITY ula IS
  PORT(
    a :         IN   std_logic_vector (15 downto 0);
    b :         IN   std_logic_vector (15 downto 0);
    seletor:    IN   std_logic;
    overflow:   out  std_logic;
    resultado:  out  std_logic_vector (31 downto 0)
  );
END ENTITY ula;

ARCHITECTURE arch OF ula IS

	signal intermediario: std_logic_vector(31 downto 0)
	
BEGIN

	PROCESS(a, b, seletor)
	
	-- seleciona multiplicacao na ula
	if (seletor = '0') then
	
 		intermediario <= std_logic_vector(UNSIGNED a * UNSIGNED  b);
 			-- se os bits mais a esquerda do vetor forem maiores que zero
 			--overflow recebe 1 e o resoltado vai para a saida 
 			if (intermediario(31 downto 16) > "0000000000000000") then
 				overflow <= '1';
 				resultado <= intermediario(15 downto 0);
 			end if;
 			
 			--resultado vai para a saida e overflow continua em zero
 			else
 				resultado <= intermediario(15 downto 0);
 				overflow <= '0';
 			end else;
 	end if;
 	
 	-- seleciona adicao
 	if (seletor = '1') then
 		intermediario <= std_logic_vector(UNSIGNED a + UNSIGNED  b);
 		
 		-- se os bits mais a esquerda do vetor forem maiores que zero
 		--overflow recebe 1 e o resoltado vai para a saida
 		if (intermediario(31 downto 16) > "0000000000000000") then
 			overflow <= '1';
 			resultado <= intermediario(15 downto 0);
 		end if;
 		
 		--resultado vai para a saida e overflow continua em zero
 		else
 				resultado <= intermediario(15 downto 0);
 				overflow <= '0';
 			end else;
 	end if;
 		
END ARCHITECTURE arch;
    
