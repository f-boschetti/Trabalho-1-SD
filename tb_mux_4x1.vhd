-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;


entity tb_mux_4x1 is end;


architecture arch of tb_mux_4x1 is
	
	--criando componente
	component mux_4x1
		port(
		in0:  in std_logic_vector (15 downto 0);
		in1:  in std_logic_vector (15 downto 0);
		in2:  in std_logic_vector (15 downto 0);
		in3:  in std_logic_vector (15 downto 0);
    	sel1: in std_logic;
    	sel2: in std_logic;
        s:    out std_logic_vector (15 downto 0));
    end component;
	
	-- Declarando sinais
	signal T_in0:  std_logic_vector (15 downto 0);
    signal T_in1:  std_logic_vector (15 downto 0);
    signal T_in2:  std_logic_vector (15 downto 0);
    signal T_in3:  std_logic_vector (15 downto 0);   
    signal T_sel1: std_logic;
    signal T_sel2: std_logic;

    
begin
    
    --instanciando o componente
    mux_4x1_16bits: mux_4x1 port map( in0 => T_in0, in1 => T_in1, in2 => T_in2, in3 => T_in3, sel1 => T_sel1, sel2 => T_sel2, s => open);
    
    process
    	begin
    	
        wait for 10 ns;
        T_in0 <= "0000000000000001";
        T_in1 <= "0000000000000011";
        T_in2 <= "0000000000000111";
        T_in3 <= "0000000000001111";
        
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
