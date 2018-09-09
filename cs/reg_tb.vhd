----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2018 10:38:13 AM
-- Design Name: 
-- Module Name: reg_tb - Behavioral
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

entity reg_tb is

end reg_tb;

architecture Behavioral of reg_tb is

COMPONENT reg 
Port(
    D : in STD_LOGIC_VECTOR(15 downto 0);
    clk : in STD_LOGIC;
    load0 : in STD_LOGIC;
    load1: in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR(15 downto 0) 
    );
end COMPONENT;

signal D : std_logic_vector(15 downto 0) := (others => '0');
signal Clk, load0, load1 : std_logic;


signal Q : std_logic_vector(15 downto 0) := (others => '0');

constant clk_period : time := 10ns;

BEGIN
uut: reg PORT MAP(
    D => D,
    load0 => load0,
    load1 => load1,
    clk => clk,
    Q => Q
);
clk_proc: process
begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
end process;

stim_proc: process
begin 
    D <= "1111111111111111";
    load0 <= '1';
    load1 <= '1';
    wait for 10ns;
  
    D <= "1010101010101010";
    load0 <= '0';
    wait for 10ns;
    load1 <= '0';
    wait for 10ns;
    load0 <='1';
    load1 <= '1';
    
end process;

END;
