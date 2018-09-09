----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2018 06:44:54 PM
-- Design Name: 
-- Module Name: zero_fill_tb - Behavioral
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

entity zero_fill_tb is
--  Port ( );
end zero_fill_tb;

architecture Behavioral of zero_fill_tb is
component zero_fill
Port(
     SB : in STD_LOGIC_VECTOR(2 downto 0);
     output : out STD_LOGIC_VECTOR(15 downto 0)
);
end component; 

signal SB : std_logic_vector(2 downto 0) := (others => '0');
signal output : std_logic_vector(15 downto 0);

begin
uut: zero_fill PORT MAP(
    SB => SB,
    output => output
);


stim_proc: process
begin 
SB <= "101";
wait for 100ns;
SB <= "000";
wait for 100ns;
SB <= "010";
wait;
end process;
end Behavioral;
