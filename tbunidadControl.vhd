--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:38:52 04/09/2016
-- Design Name:   
-- Module Name:   C:/Users/Jhon Sebastian/Documents/universidad/semestre7/arquitortura/procesador/procesador2/tbunidadControl.vhd
-- Project Name:  procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: unidadControl
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tbunidadControl IS
END tbunidadControl;
 
ARCHITECTURE behavior OF tbunidadControl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT unidadControl
    PORT(
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         wren : OUT  std_logic;
         ALUOP : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal wren : std_logic;
   signal ALUOP : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: unidadControl PORT MAP (
          op => op,
          op3 => op3,
          wren => wren,
          ALUOP => ALUOP
        );
	stim_proc: process
   begin		
      op <= "10";
		op3 <= "000010" ;
      wait for 100 ns;
		op <= "00";
		op3 <= "010011" ;
      wait for 100 ns;
		op <= "10";
		op3 <= "000101" ;	
      wait;
   end process;

END;
