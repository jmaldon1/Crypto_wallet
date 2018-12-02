----------------------------------------------------------------
-- Company:
-- Author: B. Silver
-- 
-- Create Date: 11/1/2018
-- Module Name: random_gen.vhd
-- Revision: 
-- Description: VHDL module for custom random number generator
----------------------------------------------------------------

library IEEE;
      use IEEE.std_logic_1164.all;

entity random_gen is
    port (
        -- Inputs
        i_clk             : in std_logic;
        i_reset_n         : in std_logic;
        iv_seed           : in std_logic_vector (31 downto 0);

        -- Outputs
        ov_out            : out std_logic_vector (31 downto 0)
    );
end entity random_gen;

architecture rtl of random_gen is
    --------------------------------
    -- Constants
    --------------------------------

    --------------------------------
    -- Functions
    --------------------------------
    
    --------------------------------
    -- Components
    --------------------------------

    --------------------------------
    -- Signals
    --------------------------------
    signal slv_lfsr_reg             : std_logic_vector ( 31 downto 0);
    signal sl_temp_bit              : std_logic;

begin
    --------------------------------
    -- Concurrent Logic
    --------------------------------
    ov_out <= slv_lfsr_reg;

    --------------------------------
    -- Processes
    --------------------------------
    p_clk : process(i_clk, i_reset_n)
    begin
        if(i_reset_n = '0') then
            --slv_lfsr_reg <= (others => '1');
            slv_lfsr_reg <= iv_seed;
            sl_temp_bit <= '0';

        elsif (rising_edge(i_clk)) then
            sl_temp_bit  <= (slv_lfsr_reg(31) xor slv_lfsr_reg(29) xor slv_lfsr_reg(25) xor slv_lfsr_reg(24));
            slv_lfsr_reg <= slv_lfsr_reg(30 downto 0) & sl_temp_bit;
        end if;
    end process p_clk;

end architecture rtl;