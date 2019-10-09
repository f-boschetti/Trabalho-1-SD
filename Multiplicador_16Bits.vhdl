library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- estamos multiplicando 2 numeros de 16 bits
-- e se fosse pra pensar no algoritmo de multiplca��o, apos cada numero multiplicado
-- adicionaria um zero a direita
-- da� � preciso 2*16 bits para ter o resultado da multiplica��o desses 2 numeros

ENTITY multiplicador IS
  PORT(
    a : IN           std_logic_vector (15 downto 0);
    b : IN           std_logic_vector (15 downto 0);
    produto : OUT    std_logic_vector (31 downto 0)
  );
  
  
END ENTITY multiplicador;

ARCHITECTURE arch OF multiplicador IS
BEGIN 

produto <= a * b;
END ARCHITECTURE arch;
