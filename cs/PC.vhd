----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2018 06:59:42 PM
-- Design Name: 
-- Module Name: PC - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC is
Port( 
     input : in STD_LOGIC_VECTOR(15 downto 0);
     PI : in STD_LOGIC;
     PL : in STD_LOGIC;
     reset : in STD_LOGIC;
     Clk : in STD_LOGIC;
     output : out STD_LOGIC_VECTOR(15 downto 0)
);
end PC;


architecture Behavioral of PC is

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

component reg
    Port ( 
       D : in STD_LOGIC_VECTOR(15 downto 0);
       clk : in STD_LOGIC;
       load0 : in STD_LOGIC;
       load1 : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR(15 downto 0)
       );
end component;

signal PIPLreset : std_logic;
signal load_result, inc, pc_next, pc_last : std_logic_vector(15 downto 0);


begin 

load: ripple_adder PORT MAP(
    A => pc_last,
    B => input,
    Cin => '0',
    Gout => load_result
);

incremenet: ripple_adder PORT MAP(
    A => pc_last,
    B => "0000000000000001",
    Cin => '0',
    Gout => inc
);

register00: reg PORT MAP(
    D => pc_next,
    load0 => PIPLreset,
    load1 => PIPLreset,
    Clk => Clk,
    Q => pc_last 
);

pc_next <= "0000000000000000" when reset = '1' else inc when PI = '1' else load_result when PL = '1' else "0000000000000000";
output <= pc_last;
PIPLreset <= (PI or PL or reset);


end Behavioral;

