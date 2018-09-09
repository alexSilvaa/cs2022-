----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2018 04:53:25 PM
-- Design Name: 
-- Module Name: control_memory_tb - Behavioral
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

entity control_memory_tb is
--  Port ( );
end control_memory_tb;

architecture Behavioral of control_memory_tb is
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

signal CAR_IN : std_logic_vector(7 downto 0) := (others => '0');

signal MW : std_logic;
signal MM : std_logic;
signal RW : std_logic;
signal MD : std_logic;
signal FS : std_logic_vector(4 downto 0);
signal MB : std_logic;
signal TB : std_logic;
signal TA : std_logic;
signal TD : std_logic;
signal PL : std_logic;
signal PI : std_logic;
signal IL : std_logic;
signal MC : std_logic;
signal MS : std_logic_vector(2 downto 0);
signal NA : std_logic_vector(7 downto 0);

begin
uut: control_memory PORT MAP(
    CAR_IN => CAR_IN,
    MW => MW,
    MM => MM,
    RW => RW,
    MD => MD,
    FS => FS,
    MB => MB,
    TB => TB,
    TA => TA,
    TD => TD,
    PL => PL,
    PI => PI,
    IL => IL,
    MC => MC,
    MS => MS,
    NA => NA
);

stim_proc: process 
begin 

CAR_IN <= "11000000";
wait for 100ns;
CAR_IN <= "00110000";

end process;
end Behavioral;
