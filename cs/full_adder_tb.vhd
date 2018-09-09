----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2018 11:58:52 AM
-- Design Name: 
-- Module Name: full_adder_tb - Behavioral
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

entity full_adder_tb is
--  Port ( );
end full_adder_tb;

architecture Behavioral of full_adder_tb is

component full_adder
Port(
     X : in STD_LOGIC;
     Y : in STD_LOGIC;
     Cin : in STD_LOGIC;
     S : out STD_LOGIC;
     Cout : out STD_LOGIC
);
end component;

signal X, Y, Cin : std_logic := '0';
signal S, Cout : std_logic; 

begin
uut: full_adder PORT MAP(
    X => X,
    Y => Y,
    Cin => Cin, 
    S => S, 
    Cout => Cout
);

stim_proc: process 
begin
wait for 5ns; 
X <= '1';
wait for 5ns; 
X <= '0';
Y <= '1';
wait for 5ns; 
X <= '1';
wait for 5ns;
Cin <= '1';
wait for 5ns;
Y <= '0';
wait for 5ns;
X <= '0';

end process;
END;