----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2018 10:42:20 AM
-- Design Name: 
-- Module Name: mux2_16_tb - Behavioral
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

entity mux2_16_tb is
--  Port ( );
end mux2_16_tb;

architecture Behavioral of mux2_16_tb is

COMPONENT mux2_16 
Port(
     S : in STD_LOGIC;
     In0 : in STD_LOGIC_VECTOR(15 downto 0);
     In1 : in STD_LOGIC_VECTOR(15 downto 0);
     Z : out STD_LOGIC_VECTOR(15 downto 0)
);
END COMPONENT;

signal S : std_logic;
signal In0 : std_logic_vector(15 downto 0) := (others => '0');
signal In1 : std_logic_vector(15 downto 0) := (others => '0');

signal Z : std_logic_vector(15 downto 0);

begin
uut: mux2_16 PORT MAP(
    S => S,
    In0 => In0,
    In1 => In1,
    Z => Z   
);

stim_proc: process 
begin

In0 <= "1010101010101010";
In1 <= "1100110011001100";
wait for 10ns;
S <= '1';
wait for 10ns;
S <= '0';
wait for 10ns;
S <= '1';

end process;

END;

