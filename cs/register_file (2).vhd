----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2018 12:26:49 PM
-- Design Name: 
-- Module Name: register_file - Behavioral
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

entity register_file is
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
end register_file;

architecture Behavioral of register_file is

component reg
    Port(
         D : in STD_LOGIC_VECTOR(15 downto 0);
         clk : in STD_LOGIC;
         load0 : in STD_LOGIC;
         load1 : in STD_LOGIC;
         Q : out STD_LOGIC_VECTOR(15 downto 0)
    );
end component;

component decoder
    Port(
         A0 : in STD_LOGIC;
         A1 : in STD_LOGIC;
         A2 : in STD_LOGIC;
         A3 : in STD_LOGIC;
         Q0 : out STD_LOGIC;
         Q1 : out STD_LOGIC;
         Q2 : out STD_LOGIC;
         Q3 : out STD_LOGIC;
         Q4 : out STD_LOGIC;
         Q5 : out STD_LOGIC;
         Q6 : out STD_LOGIC;
         Q7 : out STD_LOGIC;
         Q8 : out STD_LOGIC
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

component mux9_16
Port(
    S0 : in STD_LOGIC;
    S1 : in STD_LOGIC;
    S2 : in STD_LOGIC;
    S3 : in STD_LOGIC;
    In0 : in STD_LOGIC_VECTOR(15 downto 0);
    In1 : in STD_LOGIC_VECTOR(15 downto 0);
    In2 : in STD_LOGIC_VECTOR(15 downto 0);
    In3 : in STD_LOGIC_VECTOR(15 downto 0);
    In4 : in STD_LOGIC_VECTOR(15 downto 0);
    In5 : in STD_LOGIC_VECTOR(15 downto 0);
    In6 : in STD_LOGIC_VECTOR(15 downto 0);
    In7 : in STD_LOGIC_VECTOR(15 downto 0);
    In8 : in STD_LOGIC_VECTOR(15 downto 0);
    Z : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

signal load_reg0, load_reg1, load_reg2, load_reg3, load_reg4, load_reg5, load_reg6, load_reg7, load_reg8 : std_logic;
signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q, reg8_q, data_src_mux_out, src_reg, out_a, out_b : std_logic_vector(15 downto 0);

begin
reg00: reg PORT MAP(
    D => data,
    load0 => load_reg0,
    load1 => load,
    Clk => Clk,
    Q => reg0_q
);
reg01: reg PORT MAP(
    D => data,
    load0 => load_reg1,
    load1 => load,
    Clk => Clk,
    Q => reg1_q
);
reg02: reg PORT MAP(
    D => data,
    load0 => load_reg2,
    load1 => load,
    Clk => Clk,
    Q => reg2_q
);
reg03: reg PORT MAP(
    D => data,
    load0 => load_reg3,
    load1 => load,
    Clk => Clk,
    Q => reg3_q
);
reg04: reg PORT MAP(
    D => data,
    load0 => load_reg4,
    load1 => load,
    Clk => Clk,
    Q => reg4_q
);
reg05: reg PORT MAP(
    D => data,
    load0 => load_reg5,
    load1 => load,
    Clk => Clk,
    Q => reg5_q
);
reg06: reg PORT MAP(
    D => data,
    load0 => load_reg6,
    load1 => load,
    Clk => Clk,
    Q => reg6_q
);
reg07: reg PORT MAP(
    D => data,
    load0 => load_reg7,
    load1 => load,
    Clk => Clk,
    Q => reg7_q
);
reg08: reg PORT MAP(
    D => data,
    load0 => load_reg8,
    load1 => load,
    Clk => Clk,
    Q => reg8_q
);

des_decoder: decoder PORT MAP(
    A0 => D(0),
    A1 => D(1),
    A2 => D(2),
    A3 => D(3),
    Q0 => load_reg0,
    Q1 => load_reg1,
    Q2 => load_reg2,
    Q3 => load_reg3,
    Q4 => load_reg4,
    Q5 => load_reg5,
    Q6 => load_reg6,
    Q7 => load_reg7,
    Q8 => load_reg8
);


A_mux9_16: mux9_16 PORT MAP(
    S0 => a(0),
    S1 => a(1),
    S2 => a(2),
    S3 => a(3),
    In0 => reg0_q,
    In1 => reg0_q,
    In2 => reg0_q,
    In3 => reg0_q,
    In4 => reg0_q,
    In5 => reg0_q,
    In6 => reg0_q,
    In7 => reg0_q,
    In8 => reg0_q,
    Z => out_a
);
B_mux9_16: mux9_16 PORT MAP (
    S0 => b(0),
    S1 => b(1),
    S2 => b(2),    
    S3 => b(3),
    In0 => reg0_q,
    In1 => reg0_q,
    In2 => reg0_q,
    In3 => reg0_q,
    In4 => reg0_q,
    In5 => reg0_q,
    In6 => reg0_q,
    In7 => reg0_q,
    In8 => reg0_q,
    Z => out_b 
);
output_a <= out_a;
output_b <= out_b;
end Behavioral;
