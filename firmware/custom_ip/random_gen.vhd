----------------------------------------------------------------
-- Company:
-- Author: B. Silver
-- 
-- Create Date: 11/29/2018
-- Module Name: random.vhd
-- Revision: 
-- Description: VHDL module for a 32bit integer random number generator
----------------------------------------------------------------

library IEEE;
	  use IEEE.std_logic_1164.all;
	  use ieee.math_real.all;

entity random_gen is
	port(
			i_clk					: in	std_logic;
			i_reset_n			: in	std_logic;
			i_write_n			: in	std_logic;
			iv_addr				: in	std_logic_vector ( 1 downto 0);
			
			ov_readdata			: out	std_logic_vector (31 downto 0)
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
	
	
begin
	--------------------------------
	-- Concurrent Logic
	--------------------------------


	--------------------------------
	-- Processes
	--------------------------------
	

end architecture rtl;