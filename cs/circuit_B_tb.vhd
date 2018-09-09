----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2018 12:08:30 PM
-- Design Name: 
-- Module Name: circuit_B_tb - Behavioral
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

entity circuit_B_tb is
--  Port ( );
end circuit_B_tb;

architecture Behavioral of circuit_B_tb is
component circuit_B
Port(
     B : in STD_LOGIC_VECTOR(15 downto 0);
     S_in : in STD_LOGIC_VECTOR(1 downto 0);
     Y_out : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

signal B : std_logic_vector(15 downto 0) := (others => '0');
signal S_in : std_logic_vector(1 downto 0) := (others => '0');
signal Y_out : std_logic_vector(15 downto 0);

begin
uut: circuit_B PORT MAP(
    B => B,
    S_in => S_in,
    Y_out => Y_out
);

stim_proc: process 
begin

B <= "1010101010101010";
S_in <= "00";
wait for 10ns;
S_in <= "01";
wait for 10ns;
S_in <= "10";
wait for 10ns;
S_in <= "11";

end process;
END;

