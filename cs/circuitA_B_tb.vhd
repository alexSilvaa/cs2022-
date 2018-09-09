----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2018 12:10:25 PM
-- Design Name: 
-- Module Name: circuitA_B_tb - Behavioral
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

entity circuitA_B_tb is
--  Port ( );
end circuitA_B_tb;

architecture Behavioral of circuitA_B_tb is
component circuitA_B
Port(
     logic_inputA : in STD_LOGIC_VECTOR(15 downto 0);
     logic_inputB : in STD_LOGIC_VECTOR(15 downto 0);
     selection : in STD_LOGIC_VECTOR(1 downto 0);
     logic_output : out STD_LOGIC_VECTOR(15 downto 0)  
);
end component;

signal logic_inputA, logic_inputB : std_logic_vector(15 downto 0) := (others => '0');
signal selection : std_logic_vector(1 downto 0) := (others => '0');
signal logic_output : std_logic_vector(15 downto 0);
 
begin
uut: circuitA_B PORT MAP(
    logic_inputA => logic_inputA,
    logic_inputB => logic_inputB,
    selection => selection,
    logic_output => logic_output
);

stim_proc: process
begin
wait for 5ns;
logic_inputA <= "1010101010101010";
logic_inputB <= "1111000011110000";
selection <= "00";
wait for 5ns;
selection <= "01";
wait for 5ns;
selection <= "10";
wait for 5ns;
selection <= "11";

end process;
END;

