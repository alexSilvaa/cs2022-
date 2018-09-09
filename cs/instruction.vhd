----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2018 02:01:34 PM
-- Design Name: 
-- Module Name: instruction - Behavioral
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

entity instruction is
Port(
     IR : in STD_LOGIC_VECTOR(15 downto 0);
     IL : in STD_LOGIC;
     Clk : in STD_LOGIC;
     OPCODE : out STD_LOGIC_VECTOR(7 downto 0);
     DR : out STD_LOGIC_VECTOR(2 downto 0);
     SA : out STD_LOGIC_VECTOR(2 downto 0);
     SB : out STD_LOGIC_VECTOR(2 downto 0)
);
end instruction;

architecture Behavioral of instruction is

component reg
    Port ( 
       D : in STD_LOGIC_VECTOR(15 downto 0);
       clk : in STD_LOGIC;
       load0 : in STD_LOGIC;
       load1 : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR(15 downto 0)
       );
end component;

signal output : std_logic_vector(15 downto 0);

begin

register00: reg PORT MAP(
    D => IR,
    Clk => Clk,
    load0 => IL,
    load1 => IL,
    Q => output
);

OPCODE <= output(15 downto 9) & '0';
DR <= output(8 downto 6); 
SA <= output(5 downto 3);
SB <= output(2 downto 0);


end Behavioral;
