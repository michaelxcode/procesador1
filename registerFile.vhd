
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity registerFile is
    Port ( --clkFPGA : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           registerSource1 : in  STD_LOGIC_VECTOR (4 downto 0);
           registerSource2 : in  STD_LOGIC_VECTOR (4 downto 0);
           registerDestination : in  STD_LOGIC_VECTOR (4 downto 0);
           --writeEnable : in  STD_LOGIC;
			  dataToWrite : in STD_LOGIC_VECTOR (31 downto 0);
           contentRegisterSource1 : out  STD_LOGIC_VECTOR (31 downto 0);
           contentRegisterSource2 : out  STD_LOGIC_VECTOR (31 downto 0));
           --contentRegisterDestination : out  STD_LOGIC_VECTOR (31 downto 0));
end registerFile;

architecture arqRegisterFile of registerFile is

	type ram is array (0 to 39) of std_logic_vector (31 downto 0);
	signal registers : ram := (others => x"00000000");--(x"00000000", x"00000000", x"00000000", x"00000000",
									 --x"00000000", x"00000000", x"00000000", x"00000000",
--									 x"00000000", x"00000000", x"00000000", x"00000000",
--									 x"00000000", x"00000000", x"00000000", x"00000000",
--									 x"11111000", x"00000100", x"00000111", x"00000000",
--									 x"00000000", x"00000000", x"00000000", x"00000000",
--									 x"00000000", x"00000000", x"00000000", x"00000000",
--	                         x"00000000", x"00000000", x"00000000", x"00000000",
--									 x"00000000", x"00000000", x"00000000", x"00000000",
--	                         x"00000000", x"00000000", x"00000000", x"00000000");

begin
--,reset,registerSource1,registerSource2,registerDestination,writeEnable,dataToWrite
	process(reset,registerSource1,registerSource2,registerDestination,dataToWrite)--clkFPGA)
	begin
		--if(rising_edge(clkFPGA))then
		
			registers(0) <= x"00000000";
			if(reset = '1')then
				contentRegisterSource1 <= (others=>'0');
				contentRegisterSource2 <= (others=>'0');
				--contentRegisterDestination <= (others=>'0');
				registers(16) <= x"fffffff8";
				registers(17) <= x"00000004";
				registers(18) <= x"00000007";
			else
				contentRegisterSource1 <= registers(conv_integer(registerSource1));
				contentRegisterSource2 <= registers(conv_integer(registerSource2));
				--contentRegisterDestination <= registers(conv_integer(registerDestination));
				if(registerDestination /= "000000")then
					registers(conv_integer(registerDestination)) <= dataToWrite;
				end if;
			end if;
		--end if;
	end process;
end arqRegisterFile;