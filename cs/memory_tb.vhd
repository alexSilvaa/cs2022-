----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2018 12:41:45 PM
-- Design Name: 
-- Module Name: memory_tb - Behavioral
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

entity memory_tb is
--  Port ( );
end memory_tb;

architecture Behavioral of memory_tb is
component memory
Port(
     address : in STD_LOGIC_VECTOR(15 downto 0);
     dataW : in STD_LOGIC_VECTOR(15 downto 0);
     memoryW : in STD_LOGIC;
     dataR : out STD_LOGIC_VECTOR(15 downto 0)
);
end component; 

signal address : std_logic_vector(15 downto 0) := (others => '0');
signal dataW : std_logic_vector(15 downto 0) := (others => '0');
signal memoryW : std_logic := '0';

signal dataR : std_logic_vector(15 downto 0);

begin
uut: memory PORT MAP(
    address => address,
    dataW => dataW,
    memoryW => memoryW,
    dataR => dataR
);

stim_proc: process 
begin 
memoryW <= '0';

address <= "0000000000000001";
wait for 10ns;
address <= "0000000000000010";
wait for 10ns;
address <= "0000000000000011";
dataW <= "1111111111111111";
memoryW <= '1';
wait for 10ns;

end process;
end Behavioral;
