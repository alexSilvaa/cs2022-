----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2018 06:59:42 PM
-- Design Name: 
-- Module Name: PC_tb - Behavioral
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

entity PC_tb is
--  Port ( );
end PC_tb;

architecture Behavioral of PC_tb is
component pc
Port( 
     input : in STD_LOGIC_VECTOR(15 downto 0);
     PI : in STD_LOGIC;
     PL : in STD_LOGIC;
     reset : in STD_LOGIC;
     Clk : in STD_LOGIC;
     output : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

signal input : std_logic_vector(15 downto 0) := (others => '0');
signal PI : std_logic := '0';
signal PL : std_logic := '0';
signal reset : std_logic := '0';
signal Clk : std_logic := '0';

signal output : std_logic_vector(15 downto 0);

constant Clk_period :time := 10ns;

begin
uut: PC PORT MAP(
    input => input,
    PI => PI,
    PL => PL,
    reset => reset,
    Clk => Clk,
    output => output
);

Clk_process: process
begin

reset <= '1';
input <= "0000000000000101";
PI <= '0';
PL <= '0';
wait for Clk_period*2;

reset <= '0';
input <= "0000000000000101";
PI <= '0';
PL <= '0';
wait for Clk_period*2;


input <= "0000000000000101";
PI <= '1';
PL <= '0';
wait for Clk_period*2;


input <= "0000000000000101";
PI <= '0';
Pl <= '1';
wait for Clk_period*2;

end process;
end Behavioral;
