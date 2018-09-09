----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2018 06:12:14 PM
-- Design Name: 
-- Module Name: register_file_tb - Behavioral
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

entity register_file_tb is
--  Port ( );
end register_file_tb;

architecture Behavioral of register_file_tb is

component register_file 
Port(
D : in STD_LOGIC_VECTOR(3 downto 0); 
a : in STD_LOGIC_VECTOR(3 downto 0); 
b : in STD_LOGIC_VECTOR(3 downto 0); 
Clk : in STD_LOGIC; 
load : in STD_LOGIC; 
data : in STD_LOGIC_VECTOR(15 downto 0); 
output_a  : out STD_LOGIC_VECTOR(15 downto 0);
output_b  : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

signal D, a, b : std_logic_vector(3 downto 0) := (others => '0');
signal Clk, load, data_src : std_logic := '0';
signal data : std_logic_vector(15 downto 0) := (others => '0');

signal output_a, output_b : std_logic_vector(15 downto 0);

constant Clk_period : time := 10ns;
 
begin
uut: register_file PORT MAP(
    D => D,
    a => a,
    b => b,
    Clk => clk,
    load => load,
    data => data,
    output_a => output_a,
    output_b => output_b
);

clock_proc: process
begin
Clk <= '0';
wait for Clk_period/2;
Clk <= '1';
wait for Clk_period/2;
end process;

stim_proc: process 
begin
load <= '1';
a <= "0000";
b <= "1111";
data <= "0000000000000000";
D <= "0000";
wait for 10ns;

load <= '1';
a <= "0001";
b <= "1110";
data <= "1111111111111111";
D <= "0001";
wait for 10ns;

load <= '1';
a <= "0010";
b <= "1101"; 
data <= "0010001000100010";
D <= "0010";
wait for 10ns;

load <= '1';
a <= "0011";
b <= "1100";
data <= "0011001100110011";
D <= "0011";
wait for 10ns;

load <= '1';
a <= "0100";
b <= "1011";
data <= "0100010001000100";
D <= "0100";
wait for 10ns;

load <= '1';
a <= "0101";
b <= "1010";
data <= "0101010101010101";
D <= "0101";
wait for 10ns;

load <= '1';
a <= "0110";
b <= "1001";
data <= "0110011001100110";
D <= "0110";
wait for 10ns;

load <= '1';
a <= "0111";
b <= "1000";
data <= "0111011101110111";
D <= "0111";
wait for 10ns;

load <= '1';
a <= "1000";
b <= "0111";
data <= "0110011001100110";
D <= "1000";
wait for 10ns;

load <= '1';
a <= "1001";
b <= "0110";
data <= "0110011001100110";
D <= "1001";
wait for 10ns;

load <= '1';
a <= "1010";
b <= "0101";
data <= "0110011001100110";
D <= "1010";
wait for 10ns;

load <= '1';
a <= "1011";
b <= "0100";
data <= "0110011001100110";
D <= "1011";
wait for 10ns;

load <= '1';
a <= "1100";
b <= "0011";
data <= "0110011001100110";
D <= "1100";
wait for 10ns;

load <= '1';
a <= "1101";
b <= "0010";
data <= "0110011001100110";
D <= "1101";
wait for 10ns;

load <= '1';
a <= "1110";
b <= "0001";
data <= "0110011001100110";
D <= "1110";
wait for 10ns;

load <= '1';
a <= "1111";
b <= "0000";
data <= "0110011001100110";
D <= "1111";
wait for 10ns;



end process;
END;
