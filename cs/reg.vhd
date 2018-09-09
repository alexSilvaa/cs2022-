----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2018 10:35:58 AM
-- Design Name: 
-- Module Name: reg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg is
    Port ( 
           D : in STD_LOGIC_VECTOR(15 downto 0);
           clk : in STD_LOGIC;
           load0 : in STD_LOGIC;
           load1 : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR(15 downto 0)
           );
end reg;

architecture Behavioral of reg is

begin process (clk)
    begin 
        if(rising_edge(clk)) then
            if((load0 = '1') and (load1 = '1')) then
                Q <= D after 5ns;
            end if;
        end if;
    end process;
 

end Behavioral;
