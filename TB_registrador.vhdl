-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
 
--###########################################################################################################################
--#FALTA FAZER O TESTBENCH PRA VER SE TA FUNCIONANDO                                                                        #
--#Está dando o erro:                                                                                                       #
--#                                                                                                                         #
--#Error launching EPWave: [Could not parse file: 16: Unknown binary character encountered: U]. Could not load './dump.vcd' #
--###########################################################################################################################

entity TB_registrador is
end TB_registrador;

--Nomeia os sinais para poder atribuir valos as entradas
architecture teste of TB_registrador is
	signal TB_entrada: std_logic_vector(15 DOWNTO 0);
    signal TB_load: std_logic;
    signal TB_clk: std_logic;
    signal TB_reset: std_logic;
begin


--O que cada entrada va receber
entity work.TB_registrador port map(entrada => TB_entrada, load => TB_load, clk => TB_clk, reset => TB_reset);

	process
    begin
        
    	TB_reset <= '0';                      --reset em zero
    	TB_clk <= '0';                        --seta o clock em 0
        TB_entrada <= "0000000011111111";     --numero aleatorio
        
        
        TB_load <= '1';                       --Manda gravar
        TB_clk <= '1';
        wait for 10 ns;
        
        
        TB_clk <= '0';                        --Seta tudo em zero de novo
        TB_load <= '0';
        wait for 10 ns;
        
        TB_clk <= '1';                         --Teste para ver se o clk ativa "sozinho"
        wait for 10 ns;
        
        TB_clk <= '0';                         --Teste para ver se o load ativa 'sozinho"
        TB_load <= '1';
        wait for 10 ns;
        
        
        TB_entrada <= "1111111100000000";
        wait for 10 ns;                       --Teste pra ver se a entrada ativa sozinha
        
        
        TB_load <= '1';                       --Troca a saida
        TB_clk <= '1';
        wait for 10 ns;
        
        TB_clk <= '0';                        --Seta tudo em zero de novo
        TB_load <= '0';
        wait for 10 ns;
        
        TB_reset <= '1';                      --Testa o reset
        
        
        
        TB_entrada <= "1111111100000000";
        wait ;
        
        
	end process;
    
end architecture;
        