-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity registrador16 is end;

architecture TB_registrador of registrador16 is

	component registrador
    	PORT(
  		entrada: in std_logic_vector(15 DOWNTO 0);
  	    load: in std_logic;
  	    clk: in std_logic;
  	    reset: in std_logic;
  	    saida: out std_logic_vector(15 DOWNTO 0));
	end component;
    	
	signal TB_entrada: std_logic_vector(15 DOWNTO 0);
    signal TB_load:    std_logic;
    signal TB_clk:     std_logic;
    signal TB_reset:   std_logic;

begin

-- instanciaondo o componente
registrador1: registrador port map( entrada => TB_entrada, load => TB_load, clk => TB_clk, reset => TB_reset, saida => open);

	estimulo : process
    begin
    	
        wait for 5 ns; 
    	--valores iniciais
    	TB_entrada <= "0000000000000111";
    	TB_load    <= '0';
    	TB_clk     <= '0';
    	TB_reset   <= '0';
    	
        --teste
    	wait for 5 ns; 
        TB_load <= '1';
        TB_clk  <= '1';
        
        wait for 5 ns;
        TB_reset <= '1';
        
        wait for 5 ns;
        TB_load <= '0';
        TB_clk     <= '0';
		
		wait for 5 ns;
		TB_entrada <= "0000000000000001";
		TB_load <= '1';        
        TB_clk  <= '0';
        
        wait for 5 ns;
        TB_reset <= '0';
        TB_clk  <= '1';
        
        wait for 5 ns;
        TB_entrada <= "0000000000000111";
        TB_load    <= '0';
    	TB_clk     <= '0';
    	TB_reset   <= '0';
        
        wait;
    
    end process estimulo;
    
end architecture TB_registrador;
