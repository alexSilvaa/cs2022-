----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2018 06:44:54 PM
-- Design Name: 
-- Module Name: zero_fill - Behavioral
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

entity zero_fill is
Port(
     SB : in STD_LOGIC_VECTOR(2 downto 0);
     output : out STD_LOGIC_VECTOR(15 downto 0)
);
end zero_fill;

architecture Behavioral of zero_fill is

--signal zeroFill : std_logic_vector(15 downto 0);

begin
output(2 downto 0) <= SB;
output(15 downto 3) <= "0000000000000";

end Behavioral;
