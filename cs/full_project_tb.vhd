----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/08/2018 12:17:15 PM
-- Design Name: 
-- Module Name: full_project_tb - Behavioral
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

entity full_project_tb is
--  Port ( );
end full_project_tb;

architecture Behavioral of full_project_tb is

component full_project
Port(
     Clk : in STD_LOGIC;
     reset : in STD_LOGIC
);
end component;

signal Clk, reset : std_logic := '0';

constant Clk_period : time := 10ns;

begin
uut: full_project PORT MAP(
    Clk => Clk,
    reset => reset
);

Clk_process: process 
begin 
    Clk <= '0';
    wait for Clk_period/2;
    Clk <= '1';
    wait for Clk_period/2;
end process;

stim_proc: process
begin
reset <= '1';
wait for 50ns;
reset <= '0';

end process;
end Behavioral;
