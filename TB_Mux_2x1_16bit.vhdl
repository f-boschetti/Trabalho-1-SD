-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;


entity TB_Mux_2x1 is 
end TB_Mux_2x1;


architecture arch of TB_Mux_2x1 is

	signal T_in1: std_logic_vector (15 downto 0);
    signal T_in2: std_logic_vector (15 downto 0);
    signal T_sel: std_logic;
    
    begin
    
    MUX_2x1: entity work.mux_2x1
    port map( in1 => T_in1, in2 => T_in2, sel => T_sel);
    
    process
    	begin
        
        T_in1 <= "0000000000000001";
        T_in2 <= "0000000000000101";
        wait for 10 ns;
        
        
        T_sel <= '0';
        wait for 10 ns;
        
        
        T_sel <= '1';
        wait for 10 ns;
        
        T_sel <= '0';
        wait;
        
	end process;
    
end arch;