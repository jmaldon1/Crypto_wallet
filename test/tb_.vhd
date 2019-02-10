----------------------------------------------------------------
-- Company:
-- Author: B. Silver
-- 
-- Create Date: 11/25/2018
-- Module Name: tb_.vhd
-- Revision: 
-- Description: Empty VHDL testbench
----------------------------------------------------------------

library IEEE;
      use IEEE.std_logic_1164.all;


ENTITY tb_ IS
END ENTITY tb_;

ARCHITECTURE Behavorial of tb_ IS
    --------------------------------
    -- Constants
    --------------------------------
    constant CLK_PERIOD         : time          := 1 us;

    --------------------------------
    -- Functions
    --------------------------------

    --------------------------------
    -- Components
    --------------------------------

    --------------------------------
    -- Types
    --------------------------------

    --------------------------------
    -- Signals
    --------------------------------
    signal sl_clk               : std_logic    := '0';
    signal sl_rst_n             : std_logic    := '0';

BEGIN
    --------------------------------
    -- Concurrent Logic
    --------------------------------

    --------------------------------
    -- Processes
    --------------------------------
    p_clk : process
    begin
        sl_clk <= '0';
        wait for CLK_PERIOD/2;
        sl_clk <= '1';
        wait for CLK_PERIOD/2;
    end process p_clk;


    p_reset : process
    begin
        sl_rst_n <= '0';
        wait for 100 ns;
        sl_rst_n <= '1';
        wait;
    end process p_reset;

END ARCHITECTURE Behavorial;