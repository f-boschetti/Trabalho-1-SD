LIBRARY IEEE;
use IEEE.std_logic_1164.all;

--###################################################
--#FALTA FAZER O TESTBENCH PRA VER SE TA FUNCIONANDO#
--###################################################

-- Portas de entrada e saida
ENTITY registrador IS
  PORT(entrada: in std_logic_vector(7 DOWNTO 0);
  	   load: in std_logic;
  	   clk: in std_logic;
  	   reset: in std_logic;
  	   saida: out std_logic_vector(15 DOWNTO 0)
  	   );
END ENTITY registrador;

architecture arch of registrador is
	-- se tiver sinais eles vem aqui
	begin
		--se tiver mais alguma coisa pra arrumar no flipflop vem aqui
		
		process (reset, load, clk) is
			begin
			
			-- se o reset for 1, a saida zera
			if(reset = '1') then
				saida <= "0000000000000000";
			
			
			--Quando tiver um evento no clock e ele for zero, a saida recebe a entrada	
			elsif(clk'event and clk = '1') then
				if (load = '1') then
					saida <= "00000000" & entrada;
				end if;
			end if;
		end process;
		
end arch;	


-- é quase igual a um flip flop JK
-- no de 8 pra 16 tem q adicionar zeros a direita com o "&"
-- gatilhado na borda de subida e quando o "Lx" for 1
