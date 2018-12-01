--Legal Notice: (C)2018 Altera Corporation. All rights reserved.  Your
--use of Altera Corporation's design tools, logic functions and other
--software and tools, and its AMPP partner logic functions, and any
--output files any of the foregoing (including device programming or
--simulation files), and any associated documentation or information are
--expressly subject to the terms and conditions of the Altera Program
--License Subscription Agreement or other applicable license agreement,
--including, without limitation, that your use is for the sole purpose
--of programming logic devices manufactured by Altera and sold by Altera
--or its authorized distributors.  Please refer to the applicable
--agreement for further details.


-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity crypto_wallet_pio_gpio0_31to0 is 
        port (
              -- inputs:
                 signal address : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal chipselect : IN STD_LOGIC;
                 signal clk : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal write_n : IN STD_LOGIC;
                 signal writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

              -- outputs:
                 signal bidir_port : INOUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
              );
end entity crypto_wallet_pio_gpio0_31to0;


architecture europa of crypto_wallet_pio_gpio0_31to0 is
                signal clk_en :  STD_LOGIC;
                signal data_dir :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal data_in :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal data_out :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal read_mux_out :  STD_LOGIC_VECTOR (31 DOWNTO 0);

begin

  clk_en <= std_logic'('1');
  --s1, which is an e_avalon_slave
  read_mux_out <= ((A_REP(to_std_logic((((std_logic_vector'("000000000000000000000000000000") & (address)) = std_logic_vector'("00000000000000000000000000000000")))), 32) AND data_in)) OR ((A_REP(to_std_logic((((std_logic_vector'("000000000000000000000000000000") & (address)) = std_logic_vector'("00000000000000000000000000000001")))), 32) AND data_dir));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      readdata <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        readdata <= std_logic_vector'("00000000000000000000000000000000") OR read_mux_out;
      end if;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      data_out <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(((chipselect AND NOT write_n) AND to_std_logic((((std_logic_vector'("000000000000000000000000000000") & (address)) = std_logic_vector'("00000000000000000000000000000000")))))) = '1' then 
        data_out <= writedata(31 DOWNTO 0);
      end if;
    end if;

  end process;

  bidir_port(0) <= A_WE_StdLogic((std_logic'(data_dir(0)) = '1'), data_out(0), std_logic'('Z'));
  bidir_port(1) <= A_WE_StdLogic((std_logic'(data_dir(1)) = '1'), data_out(1), std_logic'('Z'));
  bidir_port(2) <= A_WE_StdLogic((std_logic'(data_dir(2)) = '1'), data_out(2), std_logic'('Z'));
  bidir_port(3) <= A_WE_StdLogic((std_logic'(data_dir(3)) = '1'), data_out(3), std_logic'('Z'));
  bidir_port(4) <= A_WE_StdLogic((std_logic'(data_dir(4)) = '1'), data_out(4), std_logic'('Z'));
  bidir_port(5) <= A_WE_StdLogic((std_logic'(data_dir(5)) = '1'), data_out(5), std_logic'('Z'));
  bidir_port(6) <= A_WE_StdLogic((std_logic'(data_dir(6)) = '1'), data_out(6), std_logic'('Z'));
  bidir_port(7) <= A_WE_StdLogic((std_logic'(data_dir(7)) = '1'), data_out(7), std_logic'('Z'));
  bidir_port(8) <= A_WE_StdLogic((std_logic'(data_dir(8)) = '1'), data_out(8), std_logic'('Z'));
  bidir_port(9) <= A_WE_StdLogic((std_logic'(data_dir(9)) = '1'), data_out(9), std_logic'('Z'));
  bidir_port(10) <= A_WE_StdLogic((std_logic'(data_dir(10)) = '1'), data_out(10), std_logic'('Z'));
  bidir_port(11) <= A_WE_StdLogic((std_logic'(data_dir(11)) = '1'), data_out(11), std_logic'('Z'));
  bidir_port(12) <= A_WE_StdLogic((std_logic'(data_dir(12)) = '1'), data_out(12), std_logic'('Z'));
  bidir_port(13) <= A_WE_StdLogic((std_logic'(data_dir(13)) = '1'), data_out(13), std_logic'('Z'));
  bidir_port(14) <= A_WE_StdLogic((std_logic'(data_dir(14)) = '1'), data_out(14), std_logic'('Z'));
  bidir_port(15) <= A_WE_StdLogic((std_logic'(data_dir(15)) = '1'), data_out(15), std_logic'('Z'));
  bidir_port(16) <= A_WE_StdLogic((std_logic'(data_dir(16)) = '1'), data_out(16), std_logic'('Z'));
  bidir_port(17) <= A_WE_StdLogic((std_logic'(data_dir(17)) = '1'), data_out(17), std_logic'('Z'));
  bidir_port(18) <= A_WE_StdLogic((std_logic'(data_dir(18)) = '1'), data_out(18), std_logic'('Z'));
  bidir_port(19) <= A_WE_StdLogic((std_logic'(data_dir(19)) = '1'), data_out(19), std_logic'('Z'));
  bidir_port(20) <= A_WE_StdLogic((std_logic'(data_dir(20)) = '1'), data_out(20), std_logic'('Z'));
  bidir_port(21) <= A_WE_StdLogic((std_logic'(data_dir(21)) = '1'), data_out(21), std_logic'('Z'));
  bidir_port(22) <= A_WE_StdLogic((std_logic'(data_dir(22)) = '1'), data_out(22), std_logic'('Z'));
  bidir_port(23) <= A_WE_StdLogic((std_logic'(data_dir(23)) = '1'), data_out(23), std_logic'('Z'));
  bidir_port(24) <= A_WE_StdLogic((std_logic'(data_dir(24)) = '1'), data_out(24), std_logic'('Z'));
  bidir_port(25) <= A_WE_StdLogic((std_logic'(data_dir(25)) = '1'), data_out(25), std_logic'('Z'));
  bidir_port(26) <= A_WE_StdLogic((std_logic'(data_dir(26)) = '1'), data_out(26), std_logic'('Z'));
  bidir_port(27) <= A_WE_StdLogic((std_logic'(data_dir(27)) = '1'), data_out(27), std_logic'('Z'));
  bidir_port(28) <= A_WE_StdLogic((std_logic'(data_dir(28)) = '1'), data_out(28), std_logic'('Z'));
  bidir_port(29) <= A_WE_StdLogic((std_logic'(data_dir(29)) = '1'), data_out(29), std_logic'('Z'));
  bidir_port(30) <= A_WE_StdLogic((std_logic'(data_dir(30)) = '1'), data_out(30), std_logic'('Z'));
  bidir_port(31) <= A_WE_StdLogic((std_logic'(data_dir(31)) = '1'), data_out(31), std_logic'('Z'));
  data_in <= bidir_port;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      data_dir <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(((chipselect AND NOT write_n) AND to_std_logic((((std_logic_vector'("000000000000000000000000000000") & (address)) = std_logic_vector'("00000000000000000000000000000001")))))) = '1' then 
        data_dir <= writedata(31 DOWNTO 0);
      end if;
    end if;

  end process;


end europa;

