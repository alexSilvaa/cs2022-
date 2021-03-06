----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2018 11:58:52 AM
-- Design Name: 
-- Module Name: full_adder - Behavioral
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

entity full_adder is
    Port(
         X : in STD_LOGIC;
         Y : in STD_LOGIC;
         Cin : in STD_LOGIC;
         S : out STD_LOGIC;
         Cout : out STD_LOGIC
    );
end full_adder;

architecture Behavioral of full_adder is

signal S0, S1, S2 : STD_LOGIC;

begin
    S0 <= (X xor Y) after 1ns;
    S1 <= (Cin and S0) after 1ns;
    S2 <= (X and Y) after 1ns;
    S <= (S0 xor Cin) after 1ns;
    Cout <= (S1 or S2) after 1ns;

end Behavioral;
