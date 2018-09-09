----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2018 10:58:02 AM
-- Design Name: 
-- Module Name: mux3_1_tb - Behavioral
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

entity mux3_1_tb is
--  Port ( );
end mux3_1_tb;

architecture Behavioral of mux3_1_tb is

component mux3_1
Port(
     In0 : in STD_LOGIC;
     In1 : in STD_LOGIC;
     In2 : in STD_LOGIC;
     S0 : in STD_LOGIC;
     S1 : in STD_LOGIC;
     Z : out STD_LOGIC
);
end component;

signal In0, In1, In2, S0, S1 : std_logic := '0';
signal Z : std_logic;

begin
uut: mux3_1 PORT MAP(
    In0 => In0,
    In1 => In1,
    In2 => In2,
    S0 => S0,
    S1 => S1,
    Z => Z
);

stim_proc: process 
begin
S0 <= '0';
S1 <= '1';
wait for 10ns;
In0 <= '0';
In1 <= '0';
In2 <= '0';
wait for 5ns;
In0 <= '0';
In1 <= '0';
In2 <= '1';
wait for 5ns;
In0 <= '0';
In1 <= '1';
In2 <= '0';
wait for 5ns;
In0 <= '0';
In1 <= '1';
In2 <= '1';
wait for 5ns;
In0 <= '1';
In1 <= '0';
In2 <= '0';
wait for 5ns;
In0 <= '1';
In1 <= '0';
In2 <= '1';
wait for 5ns;
In0 <= '1';
In1 <= '1';
In2 <= '0';
wait for 5ns;
In0 <= '1';
In1 <= '1';
In2 <= '1';
wait for 5ns;
S0 <= '1';
S1 <= '0';
wait for 5ns;
In0 <= '0';
In1 <= '0';
In2 <= '0';
wait for 5ns;
In0 <= '0';
In1 <= '0';
In2 <= '1';
wait for 5ns;
In0 <= '0';
In1 <= '1';
In2 <= '0';
wait for 5ns;
In0 <= '0';
In1 <= '1';
In2 <= '1';
wait for 5ns;
In0 <= '1';
In1 <= '0';
In2 <= '0';
wait for 5ns;
In0 <= '1';
In1 <= '0';
In2 <= '1';
wait for 5ns;
In0 <= '1';
In1 <= '1';
In2 <= '0';
wait for 5ns;
In0 <= '1';
In1 <= '1';
In2 <= '1';


end process;
END;
