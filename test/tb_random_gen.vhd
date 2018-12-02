----------------------------------------------------------------
-- Company:
-- Author: B. Silver
-- 
-- Create Date: 12/2/2018
-- Module Name: tb_random_gen.vhd
-- Revision: 
-- Description: random_gen VHDL testbench
----------------------------------------------------------------

library IEEE;
      use IEEE.std_logic_1164.all;


entity tb_random_gen is
end entity tb_random_gen;

architecture behavorial of tb_random_gen is
    --------------------------------
    -- Constants
    --------------------------------
    constant CLK_PERIOD         : time          := 20 ns;

    --------------------------------
    -- Functions
    --------------------------------

    --------------------------------
    -- Components
    --------------------------------
    component random_gen is
        port (
        -- Inputs
        i_clk             : in std_logic;
        i_reset_n         : in std_logic;
        iv_seed           : in std_logic_vector (31 downto 0);

        -- Outputs
        ov_out            : out std_logic_vector (31 downto 0)
        );
    end component random_gen;

    --------------------------------
    -- Types
    --------------------------------

    --------------------------------
    -- Signals
    --------------------------------
    signal sl_clk               : std_logic    := '0';
    signal sl_reset_n           : std_logic    := '0'; 
    signal slv_seed             : std_logic_vector (31 downto 0)    := (others => '0');
    signal slv_random           : std_logic_vector (31 downto 0)    := (others => '0');

begin
    --------------------------------
    -- Concurrent Logic
    --------------------------------
    dut : random_gen
        port map (
            i_clk       => sl_clk,
            i_reset_n   => sl_reset_n,
            iv_seed     => slv_seed,

            ov_out      => slv_random
        );

    slv_seed <= X"A1583CFB";
    --------------------------------
    -- Processes
    --------------------------------
    p_clk : process
    begin
        sl_clk <= '1';
        wait for CLK_PERIOD/2;
        sl_clk <= '0';
        wait for CLK_PERIOD/2;
    end process p_clk;

    p_reset : process
    begin
        sl_reset_n <= '0';
        wait for 100 ns;
        sl_reset_n <= '1';
        wait;
    end process p_reset;



end architecture behavorial;