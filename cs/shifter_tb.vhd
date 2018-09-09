----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2018 12:05:40 PM
-- Design Name: 
-- Module Name: shifter_tb - Behavioral
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

entity shifter_tb is
--  Port ( );
end shifter_tb;

architecture Behavioral of shifter_tb is

component shifter 
Port(
     B : in STD_LOGIC_VECTOR(15 downto 0);
     S : in STD_LOGIC_VECTOR(1 downto 0);
     IL : in STD_LOGIC;
     IR : in STD_LOGIC;
     H : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

signal B : std_logic_vector(15 downto 0) := (others => '0');
signal S : std_logic_vector(1 downto 0) := (others => '0');
signal IL : std_logic := '0';
signal IR : std_logic := '0';

signal H : std_logic_vector(15 downto 0);

begin
uut: shifter PORT MAP(
    B => B,
    S => S,
    IL => IL,
    IR => IR,
    H => H
);

stim_proc: process 
begin
wait for 10ns;
B <= "1111111111111111";
S <= "00";
wait for 10ns;
S <= "01";
wait for 10ns;
S <= "10";
wait for 10ns;
S <= "11";
wait for 10ns;
B <= "1010101010101010";
S <= "00";
wait for 10ns;
S <= "01";
wait for 10ns;
S <= "10";
wait for 10ns;
S <= "11";

end process;
END;


