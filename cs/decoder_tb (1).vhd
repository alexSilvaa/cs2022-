----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2018 11:46:11 AM
-- Design Name: 
-- Module Name: decoder_tb - Behavioral
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

entity decoder_tb is
--  Port ( );
end decoder_tb;

architecture Behavioral of decoder_tb is

COMPONENT decoder
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
END COMPONENT;

signal A0, A1, A2, A3 : std_logic := '0';

signal Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8 : std_logic;

begin
uut: decoder PORT MAP(
    A0 => A0,
    A1 => A1,
    A2 => A2,
    A3 => A3,
    Q0 => Q0,
    Q1 => Q1,
    Q2 => Q2,
    Q3 => Q3,
    Q4 => Q4,
    Q5 => Q5,
    Q6 => Q6,
    Q7 => Q7,
    Q8 => Q8
);

stim_proc: process 
begin 
wait for 10ns;
A0 <= '0';
A1 <= '0';
A2 <= '0';
A3 <= '0';
wait for 10ns;
A0 <= '0';
A1 <= '0';
A2 <= '0';
A3 <= '1';
wait for 10ns;
A0 <= '0';
A1 <= '0';
A2 <= '1';
A3 <= '0';
wait for 10ns;
A0 <= '0';
A1 <= '0';
A2 <= '1';
A3 <= '1';
wait for 10ns;
A0 <= '0';
A1 <= '1';
A2 <= '0';
A3 <= '0';
wait for 10ns;
A0 <= '0';
A1 <= '1';
A2 <= '0';
A3 <= '1';
wait for 10ns;
A0 <= '0';
A1 <= '1';
A2 <= '1';
A3 <= '0';
wait for 10ns;
A0 <= '0';
A1 <= '1';
A2 <= '1';
A3 <= '1';
wait for 10ns;
A0 <= '1';
A1 <= '0';
A2 <= '0';
A3 <= '0';
wait for 10ns;
A0 <= '1';
A1 <= '0';
A2 <= '0';
A3 <= '1';
wait for 10ns;
A0 <= '1';
A1 <= '0';
A2 <= '1';
A3 <= '0';
wait for 10ns;
A0 <= '1';
A1 <= '0';
A2 <= '1';
A3 <= '1';
wait for 10ns;
A0 <= '1';
A1 <= '1';
A2 <= '0';
A3 <= '0';
wait for 10ns;
A0 <= '1';
A1 <= '1';
A2 <= '0';
A3 <= '1';
wait for 10ns;
A0 <= '1';
A1 <= '1';
A2 <= '1';
A3 <= '0';
wait for 10ns;
A0 <= '1';
A1 <= '1';
A2 <= '1';
A3 <= '1';

end process;

END;

