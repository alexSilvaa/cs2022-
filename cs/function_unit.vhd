----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2018 06:41:38 PM
-- Design Name: 
-- Module Name: function_unit - Behavioral
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

entity function_unit is
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
end function_unit;

architecture Behavioral of function_unit is
component mux2_16
    Port(
         S : in STD_LOGIC;
         In0 : in STD_LOGIC_VECTOR(15 downto 0);
         In1 : in STD_LOGIC_VECTOR(15 downto 0);
         Z : out STD_LOGIC_VECTOR(15 downto 0)
    );
end component;

component shifter
    Port(
         B : in STD_LOGIC_VECTOR(15 downto 0);
         S : in STD_LOGIC_VECTOR(1 downto 0);
         IL : in STD_LOGIC;
         IR : in STD_LOGIC;
         H : out STD_LOGIC_VECTOR(15 downto 0)
    );
end component;

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

signal H, ALU, mux : STD_LOGIC_VECTOR(15 downto 0);

begin
Shift: shifter PORT MAP(
    B => B_in,
    S => selection(3 downto 2),
    IL => '0',
    IR => '0',
    H => H
);

Multiplex: mux2_16 PORT MAP(
    S => selection(4),
    In0 => ALU,
    In1 => H,
    Z => mux
);

ArithmeticLogicUnit: alu_unit PORT MAP(
    A_in => A_in,
    B_in => B_in,
    G_Select => selection(3 downto 0),
    V => function_V,
    C => function_C,
    G => ALU
);

F <= mux;
function_N <= mux(15);
function_Z <= (mux(15) or mux(14) or mux(13) or mux(12) or mux(11) or mux(10) or mux(9) or mux(8) or mux(7) or mux(6) or mux(5) or mux(4) or mux(3) or mux(2) or mux(1) or mux(0));
end Behavioral;
