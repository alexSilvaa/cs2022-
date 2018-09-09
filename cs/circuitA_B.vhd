----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2018 12:10:24 PM
-- Design Name: 
-- Module Name: circuitA_B - Behavioral
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

entity circuitA_B is
    Port(
         logic_inputA : in STD_LOGIC_VECTOR(15 downto 0);
         logic_inputB : in STD_LOGIC_VECTOR(15 downto 0);
         selection : in STD_LOGIC_VECTOR(1 downto 0);
         logic_output : out STD_LOGIC_VECTOR(15 downto 0)  
    );
end circuitA_B;

architecture Behavioral of circuitA_B is

begin
logic_output <= (logic_inputA and logic_inputB) after 1ns when selection = "00" else 
                (logic_inputA or logic_inputB) after 1ns when selection = "01" else 
                (logic_inputA xor logic_inputB) after 1ns when selection = "10" else
                (not (logic_inputA)) after 1ns;

end Behavioral;

