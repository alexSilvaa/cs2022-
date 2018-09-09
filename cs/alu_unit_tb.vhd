----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2018 06:34:47 PM
-- Design Name: 
-- Module Name: alu_unit_tb - Behavioral
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

entity alu_unit_tb is
--  Port ( );
end alu_unit_tb;

architecture Behavioral of alu_unit_tb is

component alu_unit
Port(
     A_in : in STD_LOGIC_VECTOR(15 downto 0);
     B_in : in STD_LOGIC_VECTOR(15 downto 0);
     G_select : in STD_LOGIC_VECTOR(3 downto 0);
     V : out STD_LOGIC;
     C : out STD_LOGIC;
     G : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

signal A_in, B_in : std_logic_vector(15 downto 0) := (others => '0');
signal G_select : std_logic_vector(3 downto 0) := (others => '0');
signal V, C : std_logic;
signal G : std_logic_vector(15 downto 0);

begin
uut: alu_unit PORT MAP(
    A_in => A_in,
    B_in => B_In,
    G_select => G_select,
    V => V,
    C => C,
    G => G
);

stim_proc: process
begin 
A_in <= "1111111110101010";
B_in <= "0000000000001111";
G_select <= "0000";
wait for 100ns;
G_select <= "0001";
wait for 100ns;
G_select <= "0010";
wait for 100ns;
G_select <= "0011";
wait for 100ns;
G_select <= "0100";
wait for 100ns;
G_select <= "0101";
wait for 100ns;
G_select <= "0110";
wait for 100ns;
G_select <= "0111";
wait for 100ns;
G_select <= "1000";
wait for 100ns;
G_select <= "1001";
wait for 100ns;
G_select <= "1010";
wait for 100ns;
G_select <= "1011";
wait for 100ns;
G_select <= "1100";
wait for 100ns;
G_select <= "1101";
wait for 100ns;
G_select <= "1110";
wait for 100ns;
G_select <= "1111";

end process;
END;
