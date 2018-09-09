----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2018 11:31:59 AM
-- Design Name: 
-- Module Name: mux9_16_tb - Behavioral
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

entity mux9_16_tb is
--  Port ( );
end mux9_16_tb;

architecture Behavioral of mux9_16_tb is

component mux9_16 
Port(
    S0 : in STD_LOGIC;
    S1 : in STD_LOGIC;
    S2 : in STD_LOGIC;
    S3 : in STD_LOGIC;
    In0 : in STD_LOGIC_VECTOR(15 downto 0);
    In1 : in STD_LOGIC_VECTOR(15 downto 0);
    In2 : in STD_LOGIC_VECTOR(15 downto 0);
    In3 : in STD_LOGIC_VECTOR(15 downto 0);
    In4 : in STD_LOGIC_VECTOR(15 downto 0);
    In5 : in STD_LOGIC_VECTOR(15 downto 0);
    In6 : in STD_LOGIC_VECTOR(15 downto 0);
    In7 : in STD_LOGIC_VECTOR(15 downto 0);
    In8 : in STD_LOGIC_VECTOR(15 downto 0);
    Z : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

signal S0 : std_logic;
signal S1 : std_logic;
signal S2 : std_logic;
signal S3 : std_logic;
signal In0 : std_logic_vector(15 downto 0) := (others => '0');
signal In1 : std_logic_vector(15 downto 0) := (others => '0');
signal In2 : std_logic_vector(15 downto 0) := (others => '0');
signal In3 : std_logic_vector(15 downto 0) := (others => '0');
signal In4 : std_logic_vector(15 downto 0) := (others => '0');
signal In5 : std_logic_vector(15 downto 0) := (others => '0');
signal In6 : std_logic_vector(15 downto 0) := (others => '0');
signal In7 : std_logic_vector(15 downto 0) := (others => '0');
signal In8 : std_logic_vector(15 downto 0) := (others => '0');

signal Z : std_logic_vector(15 downto 0);

begin
uut: mux9_16 PORT MAP(
    S0 => S0,
    S1 => S1,
    S2 => S2,
    S3 => S3,
    In0 => in0,
    In1 => in1,
    In2 => in2,
    In3 => in3,
    In4 => in4,
    In5 => in5,
    In6 => in6,
    In7 => in7,
    In8 => in8,
    Z => Z

);

stim_proc: process
begin
In0 <= "1010101010101010";
In1 <= "1100110011001100";
In2 <= "1111000011110000";
In3 <= "1111111100000000";
In4 <= "0101010101010101";
In5 <= "0011001100110011";
In6 <= "0000111100001111";
In7 <= "0000000011111111";
In8 <= "1111111111111111";

wait for 10ns;
S0 <= '0';
S1 <= '0';
S2 <= '0';
S3 <= '0';
wait for 10ns;
S0 <= '0';
S1 <= '0';
S2 <= '0';
S3 <= '1';
wait for 10ns;
S0 <= '0';
S1 <= '0';
S2 <= '1';
S3 <= '0';
wait for 10ns;
S0 <= '0';
S1 <= '0';
S2 <= '1';
S3 <= '1';
wait for 10ns;
S0 <= '0';
S1 <= '1';
S2 <= '0';
S3 <= '0';
wait for 10ns;
S0 <= '0';
S1 <= '1';
S2 <= '0';
S3 <= '1';
wait for 10ns;
S0 <= '0';
S1 <= '1';
S2 <= '1';
S3 <= '0';
wait for 10ns;
S0 <= '0';
S1 <= '1';
S2 <= '1';
S3 <= '1';
wait for 10ns;
S0 <= '1';
S1 <= '0';
S2 <= '0';
S3 <= '0';
wait for 10ns;
S0 <= '1';
S1 <= '0';
S2 <= '0';
S3 <= '1';
wait for 10ns;
S0 <= '1';
S1 <= '0';
S2 <= '1';
S3 <= '0';
wait for 10ns;
S0 <= '1';
S1 <= '0';
S2 <= '1';
S3 <= '1';
wait for 10ns;
S0 <= '1';
S1 <= '1';
S2 <= '0';
S3 <= '0';
wait for 10ns;
S0 <= '1';
S1 <= '1';
S2 <= '0';
S3 <= '1';
wait for 10ns;
S0 <= '1';
S1 <= '1';
S2 <= '1';
S3 <= '0';
wait for 10ns;
S0 <= '1';
S1 <= '1';
S2 <= '1';
S3 <= '1';
end process;


END;