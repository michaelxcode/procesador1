
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity unidadControl is
    Port ( --clk : in STD_LOGIC;
			  op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
			  --wren : out std_logic;
           ALUOP : out  STD_LOGIC_VECTOR (5 downto 0));
end unidadControl;

architecture arqUnidadControl of unidadControl is

begin
	process(op,op3)
	begin
					if(op = "10")then				
						case op3 is
							when "000000" => -- ADD
								ALUOP <= "000000";
								--wren <= '1';
							when "000010" => -- OR
								ALUOP <= "001000";
								--wren <= '1';
							when "000100" => -- SUB
								ALUOP <= "010000";
								--wren <= '1';
							when "000001" => -- AND
								ALUOP <= "000001";
								--wren <= '1';
							when "010011" => -- XOR
								ALUOP <= "010011";
								--wren <= '1';
							when "000111" => -- XNOR
								ALUOP <= "000111";
								--wren <= '1';
							when "000101" => -- ANDN
								ALUOP <= "000101";
								--wren <= '1';
							when "000110" => -- ORN
								ALUOP <= "000110";
								--wren <= '1';
							when others => -- Cae el nop
								ALUOP <= (others=>'0');
								--wren <= '0';
							
						end case;
					else 
						ALUOP <= (others=>'0');
						--wren <= '0';
					end if;
		--end if; -- if rising_edge
	end process;
end arqUnidadControl;
