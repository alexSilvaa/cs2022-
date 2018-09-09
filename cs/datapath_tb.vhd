----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2018 05:25:41 PM
-- Design Name: 
-- Module Name: datapath_tb - Behavioral
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

entity datapath_tb is
--  Port ( );
end datapath_tb;

architecture Behavioral of datapath_tb is
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

signal inputs, constants : std_logic_vector(15 downto 0) := (others => '0');
signal control_word : std_logic_vector(17 downto 0) := (others => '0');
signal Clk : std_logic := '0';

signal output_data, output_adress : std_logic_vector(15 downto 0);
signal N, Z, V, C : std_logic;

constant Clk_period : time := 50ns;

begin
uut: datapath PORT MAP(
    inputs => inputs,
    constants => constants,
    control_word => control_word,
    Clk => Clk,
    output_data => output_data,
    output_adress => output_adress,
    N => N,
    Z => Z,
    C => C,   
    V => V
);

clock_proc: process
begin
Clk <= '0';
wait for Clk_period/2;
Clk <= '1';
wait for Clk_period/2;
end process;

stim_proc: process
begin
constants <= "0000000000000000";

        wait for 50ns;	
		inputs <= "0001000100010001";
		control_word <= "000000000000000011";

		wait for 50ns;
		inputs <= "0010001000100010";
		control_word <= "001000000000000011";
		
		wait for 50ns;
        inputs <= "0011001100110011";
        control_word <= "010000000000000011";
        
		wait for 50ns;
        inputs <= "0100010001000100";
        control_word <= "011000000000000011";

		wait for 50ns;
		inputs <= "0101010101010101";
		control_word <= "100000000000000011";

		wait for 50ns;
		inputs <= "0110011001100110";
		control_word <= "101000000000000011";

		wait for 50ns;
		inputs <= "0111011101110111";
		control_word <=	"110000000000000011";		                		
		
		wait for 50ns;
        inputs <= "1000100010001000";
        control_word <= "111000000000000011";
		
		wait for 50ns;
		inputs <= "1111111111111111";
		control_word <= "000000000000000000";
		
		wait for 50ns;
        control_word <= "000000001000000000";

    
		wait for 50ns;
        control_word <= "000101001100010101";
        
        wait for 50ns;
        control_word <= "000000000100000000";        
        
		wait for 50ns;
        control_word <= "100000011001100001";
        
        wait for 50ns;
        control_word <= "000000010000000000";        
        
		wait for 50ns;
        control_word <= "111111000000000101";
        
        wait for 50ns;
        control_word <= "000000111000000000";         
        
		wait for 50ns;
        control_word <= "001000000010001001";
        
        wait for 50ns;
        control_word <= "000000000100000000";         
        
		wait for 50ns;
        control_word <= "000000001100000000";
        
		wait for 50ns;
        control_word <= "100000000000000011";
        
        wait for 50ns;
        control_word <= "000000100000000000"; 
        
		wait for 50ns;
        control_word <= "101000000000110001"; 
        
        wait for 50ns;
        control_word <= "000000010100000000";                                                                
        
		wait;
end process;
end Behavioral;
