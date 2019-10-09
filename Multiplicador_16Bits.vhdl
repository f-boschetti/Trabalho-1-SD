library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY multiplicador IS
  PORT(
    a : IN           std_logic_vector (15 downto 0);
    b : IN           std_logic_vector (15 downto 0);
    produto : OUT    std_logic_vector (31 downto 0)
  );
  
  
END ENTITY multiplicador;

ARCHITECTURE arch OF multiplicador IS
BEGIN 

signal a: unsigned(15 downto 0);
signal b: unsigned(15 downto 0);
signal produto:  unsigned(31 downto 0);


produto <= a * b;
END ARCHITECTURE arch;
