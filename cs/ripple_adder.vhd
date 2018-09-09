----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2018 12:00:53 PM
-- Design Name: 
-- Module Name: ripple_adder - Behavioral
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

entity ripple_adder is
    Port(
         A : in STD_LOGIC_VECTOR(15 downto 0);
         B : in STD_LOGIC_VECTOR(15 downto 0);
         Cin : in STD_LOGIC;
         Cout : out STD_LOGIC;
         Vout : out STD_LOGIC;
         Gout : out STD_LOGIC_VECTOR(15 downto 0)
    );
end ripple_adder;

architecture Behavioral of ripple_adder is
component full_adder 
    Port(
         X : in STD_LOGIC;
         Y : in STD_LOGIC;
         Cin : in STD_LOGIC;
         Cout : out STD_LOGIC;
         S : out STD_LOGIC
        );
end component;

signal C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C_out : STD_LOGIC;
        
begin
full_adder_00: full_adder PORT MAP(
    X => A(0),
    Y => B(0),
    Cin => Cin,
    Cout => C0,
    S => Gout(0)
);
full_adder_01: full_adder PORT MAP(
    X => A(1),
    Y => B(1),
    Cin => C0,
    Cout => C1,
    S => Gout(1)
);
full_adder_02: full_adder PORT MAP(
    X => A(2),
    Y => B(2),
    Cin => C1,
    Cout => C2,
    S => Gout(2)
);
full_adder_03: full_adder PORT MAP(
    X => A(3),
    Y => B(3),
    Cin => C2,
    Cout => C3,
    S => Gout(3)
);
full_adder_04: full_adder PORT MAP(
    X => A(4),
    Y => B(4),
    Cin => C3,
    Cout => C4,
    S => Gout(4)
);
full_adder_05: full_adder PORT MAP(
    X => A(5),
    Y => B(5),
    Cin => C4,
    Cout => C5,
    S => Gout(5)
);
full_adder_06: full_adder PORT MAP(
    X => A(6),
    Y => B(6),
    Cin => C5,
    Cout => C6,
    S => Gout(6)
);
full_adder_07: full_adder PORT MAP(
    X => A(7),
    Y => B(7),
    Cin => C6,
    Cout => C7,
    S => Gout(7)
);
full_adder_08: full_adder PORT MAP(
    X => A(8),
    Y => B(8),
    Cin => C7,
    Cout => C8,
    S => Gout(8)
);
full_adder_09: full_adder PORT MAP(
    X => A(9),
    Y => B(9),
    Cin => C8,
    Cout => C9,
    S => Gout(9)
);
full_adder_10: full_adder PORT MAP(
    X => A(10),
    Y => B(10),
    Cin => C9,
    Cout => C10,
    S => Gout(10)
);
full_adder_11: full_adder PORT MAP(
    X => A(11),
    Y => B(11),
    Cin => C10,
    Cout => C11,
    S => Gout(11)
);
full_adder_12: full_adder PORT MAP(
    X => A(12),
    Y => B(12),
    Cin => C11,
    Cout => C12,
    S => Gout(12)
);
full_adder_13: full_adder PORT MAP(
    X => A(13),
    Y => B(13),
    Cin => C12,
    Cout => C13,
    S => Gout(13)
);
full_adder_14: full_adder PORT MAP(
    X => A(14),
    Y => B(14),
    Cin => C13,
    Cout => C14,
    S => Gout(14)
);
full_adder_15: full_adder PORT MAP(
    X => A(15),
    Y => B(15),
    Cin => C14,
    Cout => C15,
    S => Gout(15)
);

Cout <= C15;
Vout <= C14;

end Behavioral;

