----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.11.2026 08:46:08
-- Design Name: 
-- Module Name: ShiftRegisterSIPO - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity ShiftRegisterSIPO is
    Port(
        reset : in std_logic;
        clk : in std_logic;
        data_in : in std_logic;
        --data_out range is (X DOWNTO 0) where X >0
        data_out : out std_logic_vector (3 DOWNTO 0) 
        );
end ShiftRegisterSIPO;

architecture Behavioral of ShiftRegisterSIPO is
    signal inner_signal : std_logic_vector(data_out'left+1 downto 0);
begin
    process (clk, reset)
    begin
        if reset = '1' then
            data_out <= (others => '0');
            inner_signal <= (others => '0');
        elsif rising_edge(clk) then
                inner_signal(0) <= data_in;
            for I in data_out'range loop
                inner_signal(i+1) <= inner_signal(i);
                data_out(i) <= inner_signal(i) ;
            end loop;
        end if;
    end process;
    

end Behavioral;
