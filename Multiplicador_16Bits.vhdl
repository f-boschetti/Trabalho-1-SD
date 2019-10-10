library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- estamos multiplicando 2 numeros de 16 bits
-- e se fosse pra pensar no algoritmo de multiplcação, apos cada numero multiplicado
-- adicionaria um zero a direita
-- daí é preciso 2*16 bits para ter o resultado da multiplicação desses 2 numeros

ENTITY multiplicador IS
  PORT(
    a :       IN     std_logic_vector (15 downto 0);
    b :       IN     std_logic_vector (15 downto 0);
    seletor:    IN   std_logic;
    overflow:   out  std_logic;
    resultado : OUT  std_logic_vector (31 downto 0)
  );
END ENTITY multiplicador;

ARCHITECTURE arch OF multiplicador IS

	signal intermediario: std_logic_vector(31 downto 0)
	
BEGIN

	PROCESS(a, b, seletor)
	-- selecao do multiplicador
	if (seletor = '0') then
	
		--faz a operacao
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
    
