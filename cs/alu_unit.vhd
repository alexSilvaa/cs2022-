----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2018 06:34:47 PM
-- Design Name: 
-- Module Name: alu_unit - Behavioral
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

entity alu_unit is
    Port(
         A_in : in STD_LOGIC_VECTOR(15 downto 0);
         B_in : in STD_LOGIC_VECTOR(15 downto 0);
         G_select : in STD_LOGIC_VECTOR(3 downto 0);
         V : out STD_LOGIC;
         C : out STD_LOGIC;
         G : out STD_LOGIC_VECTOR(15 downto 0)
    );
end alu_unit;

architecture Behavioral of alu_unit is

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

component circuitA_B
    Port(
         logic_inputA : in STD_LOGIC_VECTOR(15 downto 0);
         logic_inputB : in STD_LOGIC_VECTOR(15 downto 0);
         selection : in STD_LOGIC_VECTOR(1 downto 0);
         logic_output : out STD_LOGIC_VECTOR(15 downto 0)  
    );
end component;

component circuit_B
    Port(
         B : in STD_LOGIC_VECTOR(15 downto 0);
         S_in : in STD_LOGIC_VECTOR(1 downto 0);
         Y_out : out STD_LOGIC_VECTOR(15 downto 0)
    );
end component;

component mux2_16
    Port(
          S : in STD_LOGIC;
          In0 : in STD_LOGIC_VECTOR(15 downto 0);
          In1 : in STD_LOGIC_VECTOR(15 downto 0);
          Z : out STD_LOGIC_VECTOR(15 downto 0)
    );
end component;

signal logic_out, logic_outputAB, ripple_out : STD_LOGIC_VECTOR(15 downto 0);

begin
RippleAdder: ripple_adder PORT MAP(
    A => A_in,
    B => logic_out, 
    Cin => G_select(0),
    Cout => C,
    Vout => V,
    Gout => ripple_out
);
LogicCircuitAtoB: circuitA_B PORT MAP(
    logic_inputA => A_in,
    logic_inputB => B_in,
    selection => G_select(2 downto 1),
    logic_output => logic_outputAB
);
LogicCircuittB: circuit_B PORT MAP(
    B => B_in,
    S_in => G_Select(2 downto 1),
    Y_out => logic_out
);
mux2to16: mux2_16 PORT MAP(
    In0 => ripple_out,
    In1 => logic_outputAB,
    S => G_Select(3),
    Z => G
);
end Behavioral;
