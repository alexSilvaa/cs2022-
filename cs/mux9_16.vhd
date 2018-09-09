----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2018 10:58:02 AM
-- Design Name: 
-- Module Name: mux3_1 - Behavioral
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

entity mux9_16 is
    Port(
         S0 : in STD_LOGIC;
         S1 : in STD_LOGIC;
         S2 : in STD_LOGIC;
         S3 : in STD_LOGIC;
         In0 : in STD_LOGIC_VECTOR(15 downto 0);
         In1 : in STD_LOGIC_VECTOR(15 downto 0);
         In2 : in STD_LOGIC_VECTOR(15 downto 0);
         In3 : in STD_LOGIC_VECTOR(15 downto 0);
         In4 : in STD_LOGIC_VECTOR(15 downto 0);
         In5 : in STD_LOGIC_VECTOR(15 downto 0);
         In6 : in STD_LOGIC_VECTOR(15 downto 0);
         In7 : in STD_LOGIC_VECTOR(15 downto 0);
         In8 : in STD_LOGIC_VECTOR(15 downto 0);
         Z : out STD_LOGIC_VECTOR(15 downto 0)
    );
end mux9_16;

architecture Behavioral of mux9_16 is

begin
Z <= In0 after 1ns when S0 = '0' and S1 = '0' and S2 = '0' and S3 = '0' else
     In1 after 1ns when S0 = '0' and S1 = '0' and S2 = '0' and S3 = '1' else 
     In2 after 1ns when S0 = '0' and S1 = '0' and S2 = '1' and S3 = '0' else 
     In3 after 1ns when S0 = '0' and S1 = '0' and S2 = '1' and S3 = '1' else 
     In4 after 1ns when S0 = '0' and S1 = '1' and S2 = '0' and S3 = '0' else 
     In5 after 1ns when S0 = '0' and S1 = '1' and S2 = '0' and S3 = '1' else 
     In6 after 1ns when S0 = '0' and S1 = '1' and S2 = '1' and S3 = '0' else 
     In7 after 1ns when S0 = '0' and S1 = '1' and S2 = '1' and S3 = '1' else 
     In8 after 1ns when S0 = '1' and S1 = '0' and S2 = '0' and S3 = '0' else
     "0000000000000000" after 1ns;

end Behavioral;