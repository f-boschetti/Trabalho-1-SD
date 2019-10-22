library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


ENTITY ula IS
  PORT(
    a :         IN   std_logic_vector (15 downto 0);
    b :         IN   std_logic_vector (15 downto 0);
    seletor:    IN   std_logic;
    overflow:   out  std_logic;
    resultado:  out  std_logic_vector (15 downto 0)
  );
END ENTITY ula;

ARCHITECTURE arch OF ula IS
BEGIN

	PROCESS(seletor, a, b)
	
	--O resultado saia um "clock" atrasado por que estavamos usando signals
	-- ai usando variable como intermediario a resposta ficou alinhada com o "clock"
	-- e o valor da multiplicacao foi dividido em dois para melhor entendimento
	variable intermediario_multi : std_logic_vector(31 downto 0);
	variable inicio_multi        : std_logic_vector(15 downto 0);  
	variable fim_multi           : std_logic_vector(15 downto 0);
	variable intermediario_soma  : std_logic_vector(15 downto 0);
	
	begin

	--Atribuindo valor as variaveis
	intermediario_multi := std_logic_vector(signed(a) * signed(b));
	inicio_multi        := intermediario_multi(31 downto 16);
	fim_multi           := intermediario_multi(15 downto 0);
	intermediario_soma  := std_logic_vector(signed(a) + signed(b));
	
	--SOMA
	if seletor = '0' then
		resultado <= intermediario_soma;
		--teste de overflow
		if intermediario_soma > "0111111111111111" then
			overflow <= '1';
		else
			overflow <= '0';
		end if;
	end if;
	
	
	--MULTIPLICACAO
    if seletor = '1' then
	    resultado <= fim_multi; 	
    	--teste de overflow
    	--se um dos 16 bits mais significativos for 1, entao da overflow
    	if inicio_multi > "0000000000000001" then
    		overflow <= '1';
   		else 
   			overflow <= '0';
   		end if; 
    end if;
    	
end process;
 		
END ARCHITECTURE arch;
    
