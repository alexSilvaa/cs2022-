----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2018 12:00:53 PM
-- Design Name: 
-- Module Name: ripple_adder_tb - Behavioral
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

entity ripple_adder_tb is
--  Port ( );
end ripple_adder_tb;

architecture Behavioral of ripple_adder_tb is

component ripple_adder
Port(
     A : in STD_LOGIC_VECTOR(15 downto 0);
     B : in STD_LOGIC_VECTOR(15 downto 0);
     Cin : in STD_LOGIC;
     Cout : out STD_LOGIC;
     Vout : out STD_LOGIC;
     Gout : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

signal A : std_logic_vector(15 downto 0) := (others => '0'); 
signal B : std_logic_vector(15 downto 0) := (others => '0');
signal Cin : std_logic := '0';

signal Cout : std_logic; 
signal Vout : std_logic;
signal Gout : std_logic_vector(15 downto 0);

begin
uut: ripple_adder PORT MAP(
    A => A,
    B => B,
    Cin => Cin,
    Cout => Cout,
    Vout => Vout,
    Gout => Gout
);

stim_proc: process 
begin
wait for 10ns;
A <= "1111000011110000";
B <= "1010101010101010";
Cin <= '1';
wait for 10ns;
Cin <= '0';
wait for 10ns;

A <= "1111111111111111";
B <= "0000000000000000";
Cin <= '1';
wait for 10ns;
Cin <= '0';

end process;
END;

