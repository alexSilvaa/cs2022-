----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2018 09:06:18 AM
-- Design Name: 
-- Module Name: micro_control - Behavioral
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

entity micro_control is
Port(
     clock : in STD_LOGIC;
     reset : in STD_LOGIC;
     instruct : in STD_LOGIC_VECTOR(15 downto 0);
     n : in STD_LOGIC; -- status 0
     z : in STD_LOGIC; -- status 1
     c : in STD_LOGIC; -- status 2
     v : in STD_LOGIC; -- status 3
     pcNext : out STD_LOGIC_VECTOR(15 downto 0);
     --control_word : out STD_LOGIC_VECTOR(17 downto 0);
     dr : out STD_LOGIC_VECTOR(2 downto 0);
     sa : out STD_LOGIC_VECTOR(2 downto 0);
     sb : out STD_LOGIC_VECTOR(2 downto 0);
     td : out STD_LOGIC;
     ta : out STD_LOGIC;
     tb : out STD_LOGIC;
     mb : out STD_LOGIC;
     fs : out STD_LOGIC_VECTOR(4 downto 0);
     md : out STD_LOGIC;
     rw : out STD_LOGIC;
     mm : out STD_LOGIC;
     mw : out STD_LOGIC
);
end micro_control;

architecture Behavioral of micro_control is

component instruction 
Port(
     IR : in STD_LOGIC_VECTOR(15 downto 0);
     IL : in STD_LOGIC;
     Clk : in STD_LOGIC;
     OPCODE : out STD_LOGIC_VECTOR(7 downto 0);
     DR : out STD_LOGIC_VECTOR(2 downto 0);
     SA : out STD_LOGIC_VECTOR(2 downto 0);
     SB : out STD_LOGIC_VECTOR(2 downto 0)
);
end component;

component CAR
Port(
    CAR_S : in STD_LOGIC;
    CAR_C : in STD_LOGIC_VECTOR(7 downto 0);
    Clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    CAR_OUT : out STD_LOGIC_VECTOR(7 downto 0)
);
end component;

component control_memory
Port(
     CAR_IN : in STD_LOGIC_VECTOR(7 downto 0);
     MW : out STD_LOGIC;
     MM : out STD_LOGIC;
     RW : out STD_LOGIC;
     MD : out STD_LOGIC;
     FS : out STD_LOGIC_VECTOR(4 downto 0);
     MB : out STD_LOGIC;
     TB : out STD_LOGIC;
     TA : out STD_LOGIC;
     TD : out STD_LOGIC;
     PL : out STD_LOGIC;
     PI : out STD_LOGIC;
     IL : out STD_LOGIC;
     MC : out STD_LOGIC;
     MS : out STD_LOGIC_VECTOR(2 downto 0);     
     NA : out STD_LOGIC_VECTOR(7 downto 0)
);
end component;

component PC_extend 
Port(
    SRSB : in STD_LOGIC_VECTOR(5 downto 0);
    output : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

component PC 
Port( 
     input : in STD_LOGIC_VECTOR(15 downto 0);
     PI : in STD_LOGIC;
     PL : in STD_LOGIC;
     reset : in STD_LOGIC;
     Clk : in STD_LOGIC;
     output : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;


component mux2_8
Port(
     MC : in STD_LOGIC;
     NA : in STD_LOGIC_VECTOR(7 downto 0);
     OPCODE : in STD_LOGIC_VECTOR(7 downto 0);
     CAR : out STD_LOGIC_VECTOR(7 downto 0)
);
end component;

component mux8_1
Port(
    MS : in STD_LOGIC_VECTOR(2 downto 0);
    ZERO : in STD_LOGIC;
    ONE : in STD_LOGIC;
    C : in STD_LOGIC; 
    V : in STD_LOGIC;
    Z : in STD_LOGIC;
    N : in STD_LOGIC;
    not_C : in STD_LOGIC;
    not_Z : in STD_LOGIC;
    CAR_S : out STD_LOGIC
);
end component;



signal opcode, carOut, muxC, NA : std_logic_vector(7 downto 0);
signal MC, IL, PI, PL, notC, notZ, muxS : std_logic;
signal MS, sDR, sSA, sSB: std_logic_vector(2 downto 0);
signal extendOut : std_logic_vector(15 downto 0); 
signal extendIn : std_logic_vector(5 downto 0);

begin

programCounter: PC PORT MAP(
    input => extendOut,
    PL => pl,
    PI => pi,
    reset => reset,
    Clk => clock,
    output => pcNext
);

extend : PC_extend PORT MAP(
    SRSB => extendIn,
    output => extendOut
);

notC <= not(C);
notZ <= not(Z);

multiplexxS : mux8_1 PORT MAP(
    MS => MS,
    ZERO => '0',
    ONE => '1',
    C => c,
    V => v, 
    Z => z,
    N => n,
    not_C => notC,
    not_Z => notZ,
    CAR_S => muxS
);

instruction00: instruction PORT MAP(
    IR => instruct,
    IL => IL,
    Clk => clock,
    OPCODE => opcode,
    DR => sDR, 
    SA => sSA,
    SB => sSB
);

multiplexC: mux2_8 PORT MAP(
    MC => MC,
    NA => NA,
    OPCODE => opcode,
    CAR => muxC
);

controlAddressReg: CAR PORT MAP(
    CAR_S => muxS,
    CAR_C => muxC,
    Clk => clock,
    reset => reset,
    CAR_OUT => carOut
);

Cmemory: control_memory PORT MAP(
    CAR_IN => carOut,
    MW => mw,
    MM => mm,
    RW => rw,
    MD => md,
    FS => fs,
    MB => mb,
    TB => tb,
    TA => ta,
    TD => td,
    PL => PL,
    PI => PI,
    IL => IL,
    MC => MC,
    MS => MS,
    NA => NA
);


DR <= sDR;
SB <= sSb;
SA <= sSA;
notC <= notc;
notZ <= notz;


end Behavioral;
