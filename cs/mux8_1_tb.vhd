----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2018 10:59:57 AM
-- Design Name: 
-- Module Name: mux8_1_tb - Behavioral
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

entity mux8_1_tb is
--  Port ( );
end mux8_1_tb;

architecture Behavioral of mux8_1_tb is

COMPONENT mux8_1 
Port(
    MS : in STD_LOGIC_VECTOR(2 downto 0);
    ZERO : in STD_LOGIC;
    ONE : in STD_LOGIC;
    C : in STD_LOGIC; 
    V : in STD_LOGIC;
    Z : in STD_LOGIC;
    N : in STD_LOGIC;
    not_C : in STD_LOGIC;
    not_Z : in STD_LOGIC;
    CAR_S : out STD_LOGIC
);
END COMPONENT;

signal MS : std_logic_vector(2 downto 0):= (others => '0');
signal ZERO : std_logic;
signal ONE : std_logic;
signal C : std_logic;
signal V : std_logic;
signal Z : std_logic;
signal N : std_logic;
signal not_C : std_logic;
signal not_Z : std_logic;

signal CAR_S : std_logic;

begin
uut: mux8_1 PORT MAP(
    MS => MS,
    ZERO => ZERO,
    ONE => ONE,
    C => C,   
    V => V,   
    Z => Z,   
    N => N,   
    not_C => not_c,   
    not_Z => not_Z,
    CAR_S => CAR_S   
);

stim_proc: process 
begin
ZERO <= '0';
ONE <= '1';
C <= '1';
V <= '1';
Z <= '0';
N <= '0';
not_C <= '0';
not_Z <= '1';

wait for 10ns;
MS <= "000";
wait for 10ns;
MS <= "001";
wait for 10ns;
MS <= "010";
wait for 10ns;
MS <= "011";
wait for 10ns;
MS <= "100";
wait for 10ns;
MS <= "101";
wait for 10ns;
MS <= "110";
wait for 10ns;
MS <= "111";


end process;

END;