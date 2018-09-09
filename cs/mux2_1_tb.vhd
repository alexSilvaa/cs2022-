----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2018 10:40:56 AM
-- Design Name: 
-- Module Name: mux2_1_tb - Behavioral
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

entity mux2_1_tb is
--  Port ( );
end mux2_1_tb;

architecture Behavioral of mux2_1_tb is

component mux2_1 
Port(
     S0 : in STD_LOGIC;
     S1 : in STD_LOGIC;
     B_i : in STD_LOGIC;
     Y_i : out STD_LOGIC
);
end component;

signal S0, S1, B_i : std_logic := '0';
signal Y_i : std_logic;

begin
uut: mux2_1 PORT MAP(
    S0 => S0,
    S1 => S1, 
    B_i => B_i,
    Y_i => Y_i
);

stim_proc: process 
begin 
S0 <= '0';
S1 <= '1';
wait for 5ns;
B_i <= '0';
wait for 5ns;
B_i <= '1';
wait for 5ns;
S0 <= '1';
S1 <= '0';
wait for 5ns;
B_i <= '0';
wait for 5ns;
B_i <= '1';

end process;
END;

