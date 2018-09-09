----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2018 10:40:49 AM
-- Design Name: 
-- Module Name: PC_extend_tb - Behavioral
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

entity PC_extend_tb is
--  Port ( );
end PC_extend_tb;

architecture Behavioral of PC_extend_tb is
component PC_extend
Port(
    SRSB : in STD_LOGIC_VECTOR(5 downto 0);
    output : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

signal SRSB : std_logic_vector(5 downto 0) := (others => '0');

signal output : std_logic_vector(15 downto 0);

begin
uut: PC_extend PORT MAP(
    SRSB => SRSB,
    output => output
);

stim_proc: process
begin

SRSB <= "010110";
wait for 50ns;
SRSB <= "110110";
wait for 50ns;

end process;
end Behavioral;
