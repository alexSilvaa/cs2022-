----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2018 12:12:58 PM
-- Design Name: 
-- Module Name: CAR_tb - Behavioral
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

entity CAR_tb is
--  Port ( );
end CAR_tb;

architecture Behavioral of CAR_tb is

component CAR
Port(
    CAR_S : in STD_LOGIC;
    CAR_C : in STD_LOGIC_VECTOR(7 downto 0);
    Clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    CAR_OUT : out STD_LOGIC_VECTOR(7 downto 0)
);
end component;

signal CAR_S : std_logic;
signal CAR_C : std_logic_vector(7 downto 0) := (others => '0');
signal Clk : std_logic;
signal reset : std_logic;

signal CAR_OUT : std_logic_vector(7 downto 0);

constant Clk_period : time := 10ns;

begin
uut: CAR PORT MAP(
    CAR_S => CAR_S,
    CAR_C => CAR_C,
    Clk => Clk,
    reset => reset,
    CAR_OUT=> CAR_OUT
);

clockproc: process
begin
Clk <= '0';
wait for Clk_period/2;
Clk <= '1';
wait for Clk_period/2;
end process;

stim_proc: process 
begin

CAR_C <= "01000001";
CAR_S <= '1';
reset <= '0';
wait for Clk_period*2;

CAR_C <= "01000001";
CAR_S <= '0';

end process;
END;
