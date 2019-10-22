library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

ENTITY Ligacoes_circuito IS
	port(
		a, b, c: in std_logic_vector(15 downto 0);
		x      : in std_logic_vector(7 downto 0);
		resultoado: out std_logic_vector(15 downto 0));
		
END ENTITY Ligacoes_circuito;

ARCHITECTURE arch_Ligacoes_circuito OF Ligacoes_circuito IS

	--COMPONENTE ULA
	component ula 
		port(
			a :         IN   std_logic_vector (15 downto 0);
	    	b :         IN   std_logic_vector (15 downto 0);
	    	seletor:    IN   std_logic;
		    overflow:   out  std_logic;
		    resultado:  out  std_logic_vector (31 downto 0));
	end component;
    
    --COMPONENTE REGISTRADOR 16 BITS
	component registrador
		PORT(
			entrada: in std_logic_vector(15 DOWNTO 0);
			load: in std_logic;
  	    	clk: in std_logic;
  	    	reset: in std_logic;
  	    	saida: out std_logic_vector(15 DOWNTO 0));
  	end component;
  	
  	--COMPONENTE REGISTRADOR 8 PARA 16 BITS
  	component registrador_8
		PORT(
			entrada: in std_logic_vector(7 DOWNTO 0);
  	        load: in std_logic;
  	        clk: in std_logic;
  	   		reset: in std_logic;
  	   		saida: out std_logic_vector(15 DOWNTO 0));
  	end component;
  	
  	--COMPONENTE MUX 4X1 16 BITS
  	component mux_4x1
		port(
    		in0, in1, in2, in3: in std_logic_vector (15 downto 0);
    		sel1 , sel2: in std_logic;
        	s: out std_logic_vector (15 downto 0));
    end component;
  	
  	-- Eu sei que podia ser escrito em uma linha
  	-- mas achei feio
  	signal saida_registrador_8 : std_logic_vector(15 downto 0);
  	signal saida_mux_a_b_c     : std_logic_vector(15 downto 0);
  	signal saida_reg_esq       : std_logic_vector(15 downto 0);
  	signal saida_reg_dir       : std_logic_vector(15 downto 0);
  	signal saida_ula           : std_logic_vector(15 downto 0);
  	signal saida_mux_dir       : std_logic_vector(15 downto 0);
  	signal saida_mux_esq       : std_logic_vector(15 downto 0);  	
  	--Nao sei se as entradas dos MUX, ula e etc tem q ser sinais
  	
  	  	
  	signal lx : std_logic;
  	signal ls : std_logic;
  	signal lh : std_logic;
  	
  	signal m0_0 : std_logic;
  	signal m0_1 : std_logic;
  	
  	signal m1_0 : std_logic;
  	signal m1_1 : std_logic;
  	
  	signal m2_0 : std_logic;
  	signal m2_1 : std_logic;
  	
  	signal h  : std_logic;
  	signal overflow: std_logic;
  	
  	signal clk   : std_logic;
  	signal reset1 : std_logic;
  	signal reset2 : std_logic;
  	signal reset3 : std_logic;
  	
BEGIN

    regis_8_p_16 : registrador_8 port map(x, lx, clk, reset1, saida_registrador_8);
	
	--ver se passa null mesmo
    Mux_a_b_c : mux_4x1 port map(null, a, b, c, m0_0, m0_1, saida_mux_a_b_c);
    
    Mux_esquerda: mux_4x1 port map(saida_registrador_8, saida_mux_a_b_c, saida_reg_esq, saida_reg_dir, m1_0, m1_1, saida_mux_esq);
    Mux_direita : mux_4x1 port map(saida_mux_a_b_c, saida_registrador_8, saida_reg_esq, saida_reg_dir, m2_0, m2_1, saida_mux_dir);
    
    lUla : ula port map(saida_mux_esq, saida_mux_dir, h, overflow, saida_ula);--lula livre
    
    regis_esquerda: registrador port map(saida_ula, ls, clk, reset2, saida_reg_esq);
    regis_direita : registrador port map(saida_ula, lh, clk, reset3, saida_reg_dir);
    
    resultado <= saida_reg_esq;
    
	

END ARCHITECTURE arch_Ligacoes_circuito; -- Of entity Ligacoes_circuito

