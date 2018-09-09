----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2018 12:12:58 PM
-- Design Name: 
-- Module Name: CAR - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CAR is
    Port(
         CAR_S : in STD_LOGIC;
         CAR_C : in STD_LOGIC_VECTOR(7 downto 0);
         Clk : in STD_LOGIC;
         reset : in STD_LOGIC;
         CAR_OUT : out STD_LOGIC_VECTOR(7 downto 0)
    );    
end CAR;

architecture Behavioral of CAR is

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

signal inc, unu : std_logic_vector(7 downto 0);
signal val, regIn : std_logic_vector(15 downto 0);

begin

add: ripple_adder PORT MAP(
    A(7 downto 0) => val(7 downto 0),
    A(15 downto 8) => "00000000",
    B => "0000000000000001",
    Cin => '0',
    Gout(7 downto 0) => inc,
    Gout(15 downto 8) => unu
);

reg00: reg PORT MAP(
    D => regIn,
    load0 => '1',
    load1 => '1',
    Clk => Clk,
    Q => val
);

regIn(7 downto 0) <= CAR_C when CAR_S = '1' else inc;
regIn(15 downto 8) <= "00000000";
CAR_OUT <= val(7 downto 0);


end Behavioral;
