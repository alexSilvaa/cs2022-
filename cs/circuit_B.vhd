----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2018 12:08:30 PM
-- Design Name: 
-- Module Name: circuit_B - Behavioral
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

entity circuit_B is
    Port(
         B : in STD_LOGIC_VECTOR(15 downto 0);
         S_in : in STD_LOGIC_VECTOR(1 downto 0);
         Y_out : out STD_LOGIC_VECTOR(15 downto 0)
    );
end circuit_B;

architecture Behavioral of circuit_B is

component mux2_1
    Port(
    B_i : in STD_LOGIC;
    S0 : in STD_LOGIC;
    S1 : in STD_LOGIC;
    Y_i : out STD_LOGIC
    );
end component;
begin
mux00: mux2_1 PORT MAP(
    B_i => B(0),
    S0 => S_in(0),
    S1 => S_in(1),
    Y_i => Y_out(0)
);
mux01: mux2_1 PORT MAP(
    B_i => B(1),
    S0 => S_in(0),
    S1 => S_in(1),
    Y_i => Y_out(1)
);
mux02: mux2_1 PORT MAP(
    B_i => B(2),
    S0 => S_in(0),
    S1 => S_in(1),
    Y_i => Y_out(2)
);
mux03: mux2_1 PORT MAP(
    B_i => B(3),
    S0 => S_in(0),
    S1 => S_in(1),
    Y_i => Y_out(3)
);
mux04: mux2_1 PORT MAP(
    B_i => B(4),
    S0 => S_in(0),
    S1 => S_in(1),
    Y_i => Y_out(4)
);
mux05: mux2_1 PORT MAP(
    B_i => B(5),
    S0 => S_in(0),
    S1 => S_in(1),
    Y_i => Y_out(5)
);
mux06: mux2_1 PORT MAP(
    B_i => B(6),
    S0 => S_in(0),
    S1 => S_in(1),
    Y_i => Y_out(6)
);
mux07: mux2_1 PORT MAP(
    B_i => B(7),
    S0 => S_in(0),
    S1 => S_in(1),
    Y_i => Y_out(7)
);
mux08: mux2_1 PORT MAP(
    B_i => B(8),
    S0 => S_in(0),
    S1 => S_in(1),
    Y_i => Y_out(8)
);
mux09: mux2_1 PORT MAP(
    B_i => B(9),
    S0 => S_in(0),
    S1 => S_in(1),
    Y_i => Y_out(9)
);
mux10: mux2_1 PORT MAP(
    B_i => B(10),
    S0 => S_in(0),
    S1 => S_in(1),
    Y_i => Y_out(10)
);
mux11: mux2_1 PORT MAP(
    B_i => B(11),
    S0 => S_in(0),
    S1 => S_in(1),
    Y_i => Y_out(11)
);
mux12: mux2_1 PORT MAP(
    B_i => B(12),
    S0 => S_in(0),
    S1 => S_in(1),
    Y_i => Y_out(12)
);
mux13: mux2_1 PORT MAP(
    B_i => B(13),
    S0 => S_in(0),
    S1 => S_in(1),
    Y_i => Y_out(13)
);
mux14: mux2_1 PORT MAP(
    B_i => B(14),
    S0 => S_in(0),
    S1 => S_in(1),
    Y_i => Y_out(14)
);
mux15: mux2_1 PORT MAP(
    B_i => B(15),
    S0 => S_in(0),
    S1 => S_in(1),
    Y_i => Y_out(15)
);

end Behavioral;