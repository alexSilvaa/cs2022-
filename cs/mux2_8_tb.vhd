----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2018 10:48:18 AM
-- Design Name: 
-- Module Name: mux2_8_tb - Behavioral
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

entity mux2_8_tb is
--  Port ( );
end mux2_8_tb;

architecture Behavioral of mux2_8_tb is

COMPONENT mux2_8 
Port(
     MC : in STD_LOGIC;
     NA : in STD_LOGIC_VECTOR(7 downto 0);
     OPCODE : in STD_LOGIC_VECTOR(7 downto 0);
     CAR : out STD_LOGIC_VECTOR(7 downto 0)
);
END COMPONENT;

signal MC : std_logic;
signal NA : std_logic_vector(7 downto 0) := (others => '0');
signal OPCODE : std_logic_vector(7 downto 0) := (others => '0');

signal CAR : std_logic_vector(7 downto 0);

begin
uut: mux2_8 PORT MAP(
    MC => MC,
    NA => NA,
    OPCODE => OPCODE,
    CAR => CAR   
);

stim_proc: process 
begin

NA <= "10101010";
OPCODE <= "11001100";
wait for 10ns;
MC <= '1';
wait for 10ns;
MC <= '0';
wait for 10ns;
MC <= '1';

end process;

END;