----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/08/2018 12:17:15 PM
-- Design Name: 
-- Module Name: full_project - Behavioral
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

entity full_project is
Port(
     Clk : in STD_LOGIC;
     reset : in STD_LOGIC
);
end full_project;

architecture Behavioral of full_project is

component datapath
    Port(
 inputs : in STD_LOGIC_VECTOR(15 downto 0);
 constants: in STD_LOGIC_VECTOR(15 downto 0);
 control_word : in STD_LOGIC_VECTOR(17 downto 0);
 Clk : in STD_LOGIC;
 output_data : out STD_LOGIC_VECTOR(15 downto 0);
 output_adress: out STD_LOGIC_VECTOR(15 downto 0);
 N : out STD_LOGIC;
 Z : out STD_LOGIC;
 C : out STD_LOGIC;
 V : out STD_LOGIC
);
end component;

component micro_control 
Port(
     clock : in STD_LOGIC;
     reset : in STD_LOGIC;
     instruct : in STD_LOGIC_VECTOR(15 downto 0);
     n : in STD_LOGIC; -- status 0
     z : in STD_LOGIC; -- status 1
     c : in STD_LOGIC; -- status 2
     v : in STD_LOGIC; -- status 3
     pcNext : out STD_LOGIC_VECTOR(15 downto 0);
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
end component;

component memory
    Port(
     address : in STD_LOGIC_VECTOR(15 downto 0);
     dataW : in STD_LOGIC_VECTOR(15 downto 0);
     memoryW : in STD_LOGIC;
     dataR : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

--mcp signals
signal pcNext : std_logic_vector(15 downto 0);
signal dr, sa, sb : std_logic_vector(2 downto 0);
signal fs : std_logic_vector(4 downto 0);
signal td, ta, tb, mb, md, rw, mm, mw : std_logic;

--datapath signals
signal output_data, output_address : std_logic_vector(15 downto 0);
signal status : std_logic_vector(3 downto 0);
signal control_word : std_logic_vector(17 downto 0);

--memory signals
signal dataR : std_logic_vector(15 downto 0);


begin
dp: datapath PORT MAP(
inputs => dataR,
constants => pcNext,
control_word => control_word,
Clk => Clk,
output_data => output_data,
output_adress => output_address,
N => status(0),
Z => status(1),
C => status(2),   
V => status(3)
);

mpc: micro_control PORT MAP(
clock => Clk,
reset => reset,
instruct => dataR,
n => status(0),
z => status(1),
c => status(2),
v => status(3),
pcNext => pcNext,
dr => dr,
sa => sa, 
sb => sb,
td => td,
ta => ta, 
tb => tb, 
mb => mb, 
md => md, 
rw => rw,
mm => mm,
mw => mw
);


mem: memory PORT MAP(
    address => output_address,
    dataW => output_data,
    memoryW => mw,
    dataR => dataR
);

end Behavioral;
