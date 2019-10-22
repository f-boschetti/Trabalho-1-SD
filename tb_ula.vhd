library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity entidade_tb is end;

ARCHITECTURE tb_ula OF entidade_tb IS
	--componente
  component ula
  	port(
  	a :         IN   std_logic_vector (15 downto 0);
    b :         IN   std_logic_vector (15 downto 0);
    seletor:    IN   std_logic;
    overflow:   out  std_logic;
    resultado:  out  std_logic_vector (31 downto 0));
  end component;  
    
    
    signal t_a:        std_logic_vector (15 downto 0);
    signal t_b:        std_logic_vector (15 downto 0);
    signal t_seletor:  std_logic;
--    signal t_overflow: std_logic;
BEGIN
	
	--cria o componente da ula
	ula_s_m: ula port map( a => t_a, b => t_b, seletor => t_seletor, overflow => open, resultado => open);
	
	process
		begin
	

		wait for 10 ns;
		t_a <= "0000000000000101";
		t_b <= "0000000000000011";
		t_seletor <= '1'; --multiplicacao sem overflow
		
		wait for 10 ns;
		t_a <= "0000000000000111";
		t_b <= "0000000000000011";
		t_seletor <= '0'; --soma sem overflow
		
		wait for 10 ns;
  		t_a <= "0111111111111111";
		t_b <= "0111111111111111";
		t_seletor <= '1'; --multiplicacao COM overflow 
		
		wait for 10 ns;
		t_a <= "0111111111111111";
		t_b <= "0111111111111111";
		t_seletor <= '0'; --soma COM overflow
		
		
	end process;	

END ARCHITECTURE tb_ula; -- Of entity tb_ula


