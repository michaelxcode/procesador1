library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity ALU is
    Port ( operando1 : in  STD_LOGIC_VECTOR (31 downto 0);
           operando2 : in  STD_LOGIC_VECTOR (31 downto 0);
           aluOP : in  STD_LOGIC_VECTOR (5 downto 0);

           AluResult : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture arqALU of ALU is

begin

	process(operando1,operando2,aluOP)
	begin
	   case (aluOP) is 
			when "000000" => -- add
				AluResult <= operando1 + operando2;
			when "001000" => -- or
				AluResult <= operando1 or operando2;
			when "010000" => -- sub
				AluResult <= operando1 - operando2;
			when "000001" => -- and
				AluResult <= operando1 and operando2;
			when "010011" => -- xor
				AluResult <= operando1 xor operando2;
			when "000111" => -- xnor
				AluResult <= operando1 xnor operando2;
			when "000101" => -- andn
				AluResult <= not(operando1 and operando2);
			when "000110" => -- orn
				AluResult <= not(operando1 or operando2);
			when others => -- Implementar demas instrucciones
				AluResult <= (others=>'0');
		end case;
	end process;
end arqALU;
