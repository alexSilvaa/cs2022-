----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2018 10:40:49 AM
-- Design Name: 
-- Module Name: PC_extend - Behavioral
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

entity PC_extend is
Port(
    SRSB : in STD_LOGIC_VECTOR(5 downto 0);
    output : out STD_LOGIC_VECTOR(15 downto 0)
);
end PC_extend;

architecture Behavioral of PC_extend is

signal pc_extend : std_logic_vector(15 downto 0);

begin
pc_extend(5 downto 0) <= SRSB;
pc_extend(15 downto 6) <= "0000000000" when SRSB(5) = '0' else "1111111111";

output <= pc_extend;

end Behavioral;
