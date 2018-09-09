----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2018 10:00:11 AM
-- Design Name: 
-- Module Name: micro_control_tb - Behavioral
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

entity micro_control_tb is
--  Port ( );
end micro_control_tb;

architecture Behavioral of micro_control_tb is
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

signal instruct : std_logic_vector(15 downto 0) := (others => '0');
signal n, z, c, v : std_logic := '0';
signal reset, clock : std_logic := '0';


signal pcNext : std_logic_vector(15 downto 0);
signal td, ta, tb, mb, md, rw, mm, mw : std_logic; 
signal dr, sa, sb : std_logic_vector(2 downto 0);
signal fs : std_logic_vector(4 downto 0);

constant Clk_period : time := 20ns; 

begin
uut: micro_control PORT MAP(
    clock => clock,
    reset => reset,
    instruct => instruct,
    n => n,
    z => z,
    c => c,
    v => v,
    pcNext => pcNext,
    dr => dr,
    sa => sa, 
    sb => sb,
    td => td,
    ta => ta, 
    tb => tb, 
    mb => mb, 
    fs => fs,
    md => md, 
    rw => rw,
    mm => mm,
    mw => mw
);

clockProc: process
begin
    clock <= '0';
    wait for Clk_period/2;
    clock <= '1';
    wait for Clk_period/2;
end process;

stim_proc: process
begin
-- n z v c
    n <= '0';
    z <= '0';
    v <= '0';
    c <= '0';
    reset <= '1';
    wait for 20ns;
    reset <= '0';
    instruct <= "1101001000110111";

end process;




end Behavioral;
