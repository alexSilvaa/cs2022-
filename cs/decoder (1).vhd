----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2018 11:46:11 AM
-- Design Name: 
-- Module Name: decoder - Behavioral
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

entity decoder is
    Port(
         A0 : in STD_LOGIC;
         A1 : in STD_LOGIC;
         A2 : in STD_LOGIC;
         A3 : in STD_LOGIC;
         Q0 : out STD_LOGIC;
         Q1 : out STD_LOGIC;
         Q2 : out STD_LOGIC;
         Q3 : out STD_LOGIC;
         Q4 : out STD_LOGIC;
         Q5 : out STD_LOGIC;
         Q6 : out STD_LOGIC;
         Q7 : out STD_LOGIC;
         Q8 : out STD_LOGIC
    );
end decoder;

architecture Behavioral of decoder is

begin
Q0 <= ((not A0) and (not A1) and (not A2) and (not A3)) after 5ns;
Q1 <= ((not A0) and (not A1) and (not A2) and A3) after 5ns;
Q2 <= ((not A0) and (not A1) and A2 and (not A3)) after 5ns;
Q3 <= ((not A0) and (not A1) and A2 and A3) after 5ns;
Q4 <= ((not A0) and A1 and (not A2) and (not A3)) after 5ns;
Q5 <= ((not A0) and A1 and (not A2) and A3) after 5ns;
Q6 <= ((not A0) and A1 and A2 and (not A3)) after 5ns;
Q7 <= ((not A0) and A1 and A2 and A3) after 5ns;
Q8 <= (A0 and (not A1) and (not A2) and (not A3)) after 5ns;

end Behavioral;
