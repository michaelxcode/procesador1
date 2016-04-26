
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity nPC is
    Port ( address : in  STD_LOGIC_VECTOR (31 downto 0);
			  reset : in  STD_LOGIC;
           clkFPGA : in  STD_LOGIC;
           nextInstruction : out  STD_LOGIC_VECTOR (31 downto 0));
end nPC;

architecture arqNPC of nPC is

begin
process(clkFPGA, address, reset)
	begin
		if(reset = '1')then
			nextInstruction <= (others=>'0');
		else
			if(rising_edge(clkFPGA))then
				nextInstruction <= address;
			end if;
		end if;
	end process;
end arqNPC;