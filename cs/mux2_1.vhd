----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2018 10:40:05 AM
-- Design Name: 
-- Module Name: mux2_1 - Behavioral
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

entity mux2_1 is
    Port(
         S0 : in STD_LOGIC;
         S1 : in STD_LOGIC;
         B_i : in STD_LOGIC;
         Y_i : out STD_LOGIC
    );
end mux2_1;

architecture Behavioral of mux2_1 is

begin
Y_i <= S0 after 1ns when B_i = '1' else 
       S1 after 1ns when B_i = '0' else
       '0' after 1ns;

end Behavioral;
