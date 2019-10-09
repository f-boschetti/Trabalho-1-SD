-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;


entity TB_Mux_4x1 is 
end TB_Mux_4x1;


architecture arch of TB_Mux_4x1 is
	-- Declarando sinais
	--NÃO FUNCIONOU ASSIM
	signal T_in0: std_logic_vector (15 downto 0):= "000000000000001";
    signal T_in1: std_logic_vector (15 downto 0):= "000000000000011";
    signal T_in2: std_logic_vector (15 downto 0):= "000000000000111";
    signal T_in3: std_logic_vector (15 downto 0):= "000000000001111";
    signal T_s: std_logic_vector (15 downto 0);    
    signal T_sel1: std_logic;
    signal T_sel2: std_logic;
    
begin
    
    MUX_4x1: entity work.mux_4x1
    port map( in0 => T_in0, in1 => T_in1, in2 => T_in2, in3 => T_in3,  sel1 => T_sel, sel2 => T_sel2, s => T_s);
    
    process
    	begin
    --NÃO FUNCIONOU ASSIM
    --    T_in0 <= "000000000000001";
    --    T_in1 <= "000000000000011";
    --    T_in2 <= "000000000000111";
    --    T_in3 <= "000000000001111";
        
        -- Operando com os seletores para analizar a saida
        T_sel1 <= '0';
        T_sel2 <= '0';
        wait for 10 ns;
        
        
        T_sel1 <= '0';
        T_sel2 <= '1';
        wait for 10 ns;
        
        T_sel1 <= '1';
        T_sel2 <= '0';
        wait for 10 ns;
        
        T_sel1 <= '1';
        T_sel2 <= '1';
        wait for 10 ns;
        
	end process;
    
end arch;