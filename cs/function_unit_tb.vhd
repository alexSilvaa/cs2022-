----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2018 06:41:38 PM
-- Design Name: 
-- Module Name: function_unit_tb - Behavioral
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

entity function_unit_tb is
--  Port ( );
end function_unit_tb;

architecture Behavioral of function_unit_tb is
component function_unit
Port(
    selection : in STD_LOGIC_VECTOR(4 downto 0);
    A_in : in STD_LOGIC_VECTOR(15 downto 0);
    B_in : in STD_LOGIC_VECTOR(15 downto 0);
    function_N : out STD_LOGIC;
    function_Z : out STD_LOGIC;
    function_V : out STD_LOGIC;
    function_C : out STD_LOGIC;
    F : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

signal selection : std_logic_vector(4 downto 0) := (others => '0');
signal A_in, B_in : std_logic_vector(15 downto 0) := (others => '0');
signal function_N, function_Z, function_V, function_C : std_logic;
signal F : std_logic_vector(15 downto 0);

begin
uut: function_unit PORT MAP(
    selection => selection,
    A_in => A_in,
    B_in => B_in,
    function_N => function_N,
    function_Z => function_Z,
    function_V => function_V,
    function_C => function_C,
    F => F
);

stim_proc: process 
begin
A_in <= "1010101010101010";
B_in <= "1011101110111011";
wait for 20ns;
selection <= "00000";
wait for 10ns;
selection <= "00001";
wait for 10ns;
selection <= "00010";
wait for 10ns;
selection <= "00011";
wait for 10ns;
selection <= "00100";
wait for 10ns;
selection <= "00101";
wait for 10ns;
selection <= "00110";
wait for 10ns;
selection <= "00111";
wait for 10ns;
selection <= "01000";
wait for 10ns;
selection <= "01001";
wait for 10ns;
selection <= "01010";
wait for 10ns;
selection <= "01011";
wait for 10ns;
selection <= "01100";
wait for 10ns;
selection <= "01101";
wait for 10ns;
selection <= "01110";
wait for 10ns;
selection <= "01111";
wait for 10ns;
selection <= "10000";
wait for 10ns;
selection <= "10001";
wait for 10ns;
selection <= "10010";
wait for 10ns;
selection <= "10011";
wait for 10ns;
selection <= "10100";
wait for 10ns;
selection <= "10101";
wait for 10ns;
selection <= "10110";
wait for 10ns;
selection <= "10111";
wait for 10ns;
selection <= "11000";
wait for 10ns;
selection <= "11001";
wait for 10ns;
selection <= "11010";
wait for 10ns;
selection <= "11011";
wait for 10ns;
selection <= "11100";
wait for 10ns;
selection <= "11101";
wait for 10ns;
selection <= "11110";
wait for 10ns;
selection <= "11111";



end process;
END;
