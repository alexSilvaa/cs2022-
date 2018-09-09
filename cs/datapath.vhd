----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2018 05:25:41 PM
-- Design Name: 
-- Module Name: datapath - Behavioral
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

entity datapath is
    Port(
         inputs_data : in STD_LOGIC_VECTOR(15 downto 0);
         inputs_pc: in STD_LOGIC_VECTOR(15 downto 0);
         --control_word : in STD_LOGIC_VECTOR(17 downto 0);
         sig_Clk : in STD_LOGIC;
         DR : in STD_LOGIC_VECTOR(2 downto 0);
         SA : in STD_LOGIC_VECTOR(2 downto 0);
         SB : in STD_LOGIC_VECTOR(2 downto 0);
         TD : in STD_LOGIC;
         TA : in STD_LOGIC;
         TB : in STD_LOGIC;
         reset : in STD_LOGIC;
         FS : in STD_LOGIC;
         RW : in STD_LOGIC;
         MB : in STD_LOGIC;
         MM : in STD_LOGIC;
         MD : in STD_LOGIC;
         output_data : out STD_LOGIC_VECTOR(15 downto 0);
         output_address : out STD_LOGIC_VECTOR(15 downto 0);
         --status: out STD_LOGIC_VECTOR(3 downto 0)
         N : out STD_LOGIC;
         C : out STD_LOGIC;
         V : out STD_LOGIC;
         Z : out STD_LOGIC;
    );
end datapath;

architecture Behavioral of datapath is

component register_file
    Port(
         D : in STD_LOGIC_VECTOR(3 downto 0); 
         a : in STD_LOGIC_VECTOR(3 downto 0); 
         b : in STD_LOGIC_VECTOR(3 downto 0); 
         Clk : in STD_LOGIC; 
         load : in STD_LOGIC; 
         data : in STD_LOGIC_VECTOR(15 downto 0); 
         output_a  : out STD_LOGIC_VECTOR(15 downto 0);
         output_b  : out STD_LOGIC_VECTOR(15 downto 0)
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

component zero_fill
Port(
     SB : in STD_LOGIC_VECTOR(2 downto 0);
     output : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

component function_unit
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
end component;

signal muxB, muxD, muxM, registerFile_A, registerFile_B, functionUnit, zeroFill, pc : STD_LOGIC_VECTOR(15 downto 0);
signal sig_d, address_a, address_b, sig_status : std_logic_vector(3 downto 0);

begin
Multiplexer_B: mux2_16 PORT MAP(
    S => control_word(8),
    In0 => registerFile_B,
    In1 => zeroFill,
    Z => muxB
);
Multiplexer_D: mux2_16 PORT MAP(
    S => control_word(2),
    In0 => functionUnit,
    In1 => inputs_data,
    Z => muxD
);

pc <= inputs_pc;

Multiplexer_M: mux2_16 PORT MAP(
    S => control_word(0),
    In0 => registerFile_A,
    In1 => pc,
    Z => muxM
);

sig_d <= TD & control_word(17 downto 15);
address_a <= TA & control_word(14 downto 12);
address_b <= TB & control_word(11 downto 9); 

zf: zero_fill PORT MAP(
    SB => control_word(11 downto 9),
    output => zerofill
);

Regiser: register_file PORT MAP(
    D => sig_d,
    a => address_a,
    b => address_b,
    Clk => sig_Clk, 
    load => control_word(1),
    data => muxD,
    output_a => registerFile_A,
    output_b => registerFile_B
);

output_data <= muxB;
output_address <= muxM;

ThrFunctionUnit: function_unit PORT MAP(
    selection => control_word(7 downto 3),
    A_in => registerFile_A,
    B_in => muxB,
    function_N => status(1),
    function_Z => status(0),
    function_C => status(2), 
    function_V => status(3), 
    F => functionUnit
);

status <= sig_status; 

end Behavioral;
