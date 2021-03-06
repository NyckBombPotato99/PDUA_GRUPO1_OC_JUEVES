LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

ENTITY shif_unit IS 
	GENERIC (N : INTEGER :=8);

	PORT( clk     : IN STD_LOGIC;
			shamt   : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		   dataa   : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			dataout : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
	);
	END ENTITY shif_unit;
	----
	ARCHITECTURE rtl OF shif_unit IS 
	BEGIN 
	

					

					WITH shamt SELECT 
						dataout <= dataa              WHEN "00", -- NO SHIFT
						'0' & dataa(N-1 DOWNTO 1)     WHEN "01", -- srl
						dataa(N-2 DOWNTO 0) & '0'     WHEN "10",
						(OTHERS => '0')               WHEN OTHERS;
						
											
	
	END ARCHITECTURE; 