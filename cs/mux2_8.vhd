----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2018 10:48:18 AM
-- Design Name: 
-- Module Name: mux2_8 - Behavioral
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

entity mux2_8 is
    Port(
         MC : in STD_LOGIC;
         NA : in STD_LOGIC_VECTOR(7 downto 0);
         OPCODE : in STD_LOGIC_VECTOR(7 downto 0);
         CAR : out STD_LOGIC_VECTOR(7 downto 0)
    );
end mux2_8;

architecture Behavioral of mux2_8 is

begin
CAR <= NA after 1ns when MC = '0' else 
       OPCODE after 1ns when MC = '1' else 
       "00000000" after 10ns;

end Behavioral;
