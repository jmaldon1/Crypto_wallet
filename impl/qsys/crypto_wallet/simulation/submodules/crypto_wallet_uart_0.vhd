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

entity crypto_wallet_uart_0_tx is 
        port (
              -- inputs:
                 signal baud_divisor : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
                 signal begintransfer : IN STD_LOGIC;
                 signal clk : IN STD_LOGIC;
                 signal clk_en : IN STD_LOGIC;
                 signal do_force_break : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal status_wr_strobe : IN STD_LOGIC;
                 signal tx_data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal tx_wr_strobe : IN STD_LOGIC;

              -- outputs:
                 signal tx_overrun : OUT STD_LOGIC;
                 signal tx_ready : OUT STD_LOGIC;
                 signal tx_shift_empty : OUT STD_LOGIC;
                 signal txd : OUT STD_LOGIC
              );
end entity crypto_wallet_uart_0_tx;


architecture europa of crypto_wallet_uart_0_tx is
                signal baud_clk_en :  STD_LOGIC;
                signal baud_rate_counter :  STD_LOGIC_VECTOR (8 DOWNTO 0);
                signal baud_rate_counter_is_zero :  STD_LOGIC;
                signal do_load_shifter :  STD_LOGIC;
                signal do_shift :  STD_LOGIC;
                signal internal_tx_ready :  STD_LOGIC;
                signal pre_txd :  STD_LOGIC;
                signal shift_done :  STD_LOGIC;
                signal tx_load_val :  STD_LOGIC_VECTOR (9 DOWNTO 0);
                signal tx_shift_reg_out :  STD_LOGIC;
                signal tx_shift_register_contents :  STD_LOGIC_VECTOR (9 DOWNTO 0);
                signal tx_wr_strobe_onset :  STD_LOGIC;
                signal unxshiftxtx_shift_register_contentsxtx_shift_reg_outxx5_in :  STD_LOGIC_VECTOR (9 DOWNTO 0);
                signal unxshiftxtx_shift_register_contentsxtx_shift_reg_outxx5_out :  STD_LOGIC_VECTOR (9 DOWNTO 0);

begin

  tx_wr_strobe_onset <= tx_wr_strobe AND begintransfer;
  tx_load_val <= Std_Logic_Vector'(A_ToStdLogicVector(std_logic'('1')) & tx_data & A_ToStdLogicVector(std_logic'('0')));
  shift_done <= NOT (or_reduce(tx_shift_register_contents));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      do_load_shifter <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        do_load_shifter <= (NOT internal_tx_ready) AND shift_done;
      end if;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      internal_tx_ready <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        if std_logic'(tx_wr_strobe_onset) = '1' then 
          internal_tx_ready <= std_logic'('0');
        elsif std_logic'(do_load_shifter) = '1' then 
          internal_tx_ready <= Vector_To_Std_Logic(-SIGNED(std_logic_vector'("00000000000000000000000000000001")));
        end if;
      end if;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      tx_overrun <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        if std_logic'(status_wr_strobe) = '1' then 
          tx_overrun <= std_logic'('0');
        elsif std_logic'((NOT internal_tx_ready AND tx_wr_strobe_onset)) = '1' then 
          tx_overrun <= Vector_To_Std_Logic(-SIGNED(std_logic_vector'("00000000000000000000000000000001")));
        end if;
      end if;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      tx_shift_empty <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        tx_shift_empty <= internal_tx_ready AND shift_done;
      end if;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      baud_rate_counter <= std_logic_vector'("000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        if std_logic'((baud_rate_counter_is_zero OR do_load_shifter)) = '1' then 
          baud_rate_counter <= baud_divisor;
        else
          baud_rate_counter <= A_EXT (((std_logic_vector'("000000000000000000000000") & (baud_rate_counter)) - std_logic_vector'("000000000000000000000000000000001")), 9);
        end if;
      end if;
    end if;

  end process;

  baud_rate_counter_is_zero <= to_std_logic(((std_logic_vector'("00000000000000000000000") & (baud_rate_counter)) = std_logic_vector'("00000000000000000000000000000000")));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      baud_clk_en <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        baud_clk_en <= baud_rate_counter_is_zero;
      end if;
    end if;

  end process;

  do_shift <= (baud_clk_en AND (NOT shift_done)) AND (NOT do_load_shifter);
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      pre_txd <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(NOT shift_done) = '1' then 
        pre_txd <= tx_shift_reg_out;
      end if;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      txd <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        txd <= pre_txd AND NOT do_force_break;
      end if;
    end if;

  end process;

  --_reg, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      unxshiftxtx_shift_register_contentsxtx_shift_reg_outxx5_out <= std_logic_vector'("0000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        unxshiftxtx_shift_register_contentsxtx_shift_reg_outxx5_out <= unxshiftxtx_shift_register_contentsxtx_shift_reg_outxx5_in;
      end if;
    end if;

  end process;

  unxshiftxtx_shift_register_contentsxtx_shift_reg_outxx5_in <= A_WE_StdLogicVector((std_logic'((do_load_shifter)) = '1'), tx_load_val, A_WE_StdLogicVector((std_logic'((do_shift)) = '1'), Std_Logic_Vector'(A_ToStdLogicVector(std_logic'('0')) & unxshiftxtx_shift_register_contentsxtx_shift_reg_outxx5_out(9 DOWNTO 1)), unxshiftxtx_shift_register_contentsxtx_shift_reg_outxx5_out));
  tx_shift_register_contents <= unxshiftxtx_shift_register_contentsxtx_shift_reg_outxx5_out;
  tx_shift_reg_out <= unxshiftxtx_shift_register_contentsxtx_shift_reg_outxx5_out(0);
  --vhdl renameroo for output signals
  tx_ready <= internal_tx_ready;

end europa;



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

entity crypto_wallet_uart_0_rx_stimulus_source is 
        port (
              -- inputs:
                 signal baud_divisor : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
                 signal clk : IN STD_LOGIC;
                 signal clk_en : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal rx_char_ready : IN STD_LOGIC;
                 signal rxd : IN STD_LOGIC;

              -- outputs:
                 signal source_rxd : OUT STD_LOGIC
              );
end entity crypto_wallet_uart_0_rx_stimulus_source;


architecture europa of crypto_wallet_uart_0_rx_stimulus_source is
--synthesis translate_off
component crypto_wallet_uart_0_tx is 
           port (
                 -- inputs:
                    signal baud_divisor : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
                    signal begintransfer : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal clk_en : IN STD_LOGIC;
                    signal do_force_break : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal status_wr_strobe : IN STD_LOGIC;
                    signal tx_data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal tx_wr_strobe : IN STD_LOGIC;

                 -- outputs:
                    signal tx_overrun : OUT STD_LOGIC;
                    signal tx_ready : OUT STD_LOGIC;
                    signal tx_shift_empty : OUT STD_LOGIC;
                    signal txd : OUT STD_LOGIC
                 );
end component crypto_wallet_uart_0_tx;

--synthesis translate_on
                signal d1_stim_data :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal delayed_unxrx_char_readyxx0 :  STD_LOGIC;
                signal do_send_stim_data :  STD_LOGIC;
                signal internal_source_rxd :  STD_LOGIC;
                signal module_input :  STD_LOGIC;
                signal module_input1 :  STD_LOGIC;
                signal module_input2 :  STD_LOGIC;
                signal pickup_pulse :  STD_LOGIC;
                signal unused_empty :  STD_LOGIC;
                signal unused_overrun :  STD_LOGIC;
                signal unused_ready :  STD_LOGIC;

--synthesis translate_off
                signal stim_data :  STD_LOGIC_VECTOR (7 DOWNTO 0);

--synthesis translate_on

begin

  --vhdl renameroo for output signals
  source_rxd <= internal_source_rxd;
--synthesis translate_off
    --stimulus_transmitter, which is an e_instance
    stimulus_transmitter : crypto_wallet_uart_0_tx
      port map(
        tx_overrun => unused_overrun,
        tx_ready => unused_ready,
        tx_shift_empty => unused_empty,
        txd => internal_source_rxd,
        baud_divisor => baud_divisor,
        begintransfer => do_send_stim_data,
        clk => clk,
        clk_en => clk_en,
        do_force_break => module_input,
        reset_n => reset_n,
        status_wr_strobe => module_input1,
        tx_data => d1_stim_data,
        tx_wr_strobe => module_input2
      );

    module_input <= std_logic'('0');
    module_input1 <= std_logic'('0');
    module_input2 <= std_logic'('1');

    process (clk, reset_n)
    begin
      if reset_n = '0' then
        d1_stim_data <= std_logic_vector'("00000000");
      elsif clk'event and clk = '1' then
        if std_logic'(do_send_stim_data) = '1' then 
          d1_stim_data <= stim_data;
        end if;
      end if;

    end process;

    stim_data <= std_logic_vector'("00000000");
    --delayed_unxrx_char_readyxx0, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        delayed_unxrx_char_readyxx0 <= std_logic'('0');
      elsif clk'event and clk = '1' then
        if std_logic'(clk_en) = '1' then 
          delayed_unxrx_char_readyxx0 <= rx_char_ready;
        end if;
      end if;

    end process;

    pickup_pulse <= NOT (rx_char_ready) AND (delayed_unxrx_char_readyxx0);
    do_send_stim_data <= ((pickup_pulse OR std_logic'('0'))) AND std_logic'('0');
--synthesis translate_on
--synthesis read_comments_as_HDL on
--    internal_source_rxd <= rxd;
--synthesis read_comments_as_HDL off

end europa;



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

entity crypto_wallet_uart_0_rx is 
        port (
              -- inputs:
                 signal baud_divisor : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
                 signal begintransfer : IN STD_LOGIC;
                 signal clk : IN STD_LOGIC;
                 signal clk_en : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal rx_rd_strobe : IN STD_LOGIC;
                 signal rxd : IN STD_LOGIC;
                 signal status_wr_strobe : IN STD_LOGIC;

              -- outputs:
                 signal break_detect : OUT STD_LOGIC;
                 signal framing_error : OUT STD_LOGIC;
                 signal parity_error : OUT STD_LOGIC;
                 signal rx_char_ready : OUT STD_LOGIC;
                 signal rx_data : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal rx_overrun : OUT STD_LOGIC
              );
end entity crypto_wallet_uart_0_rx;


architecture europa of crypto_wallet_uart_0_rx is
component crypto_wallet_uart_0_rx_stimulus_source is 
           port (
                 -- inputs:
                    signal baud_divisor : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
                    signal clk : IN STD_LOGIC;
                    signal clk_en : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal rx_char_ready : IN STD_LOGIC;
                    signal rxd : IN STD_LOGIC;

                 -- outputs:
                    signal source_rxd : OUT STD_LOGIC
                 );
end component crypto_wallet_uart_0_rx_stimulus_source;

  component altera_std_synchronizer is
GENERIC (
      depth : NATURAL
      );
    PORT (
    signal dout : OUT STD_LOGIC;
        signal clk : IN STD_LOGIC;
        signal reset_n : IN STD_LOGIC;
        signal din : IN STD_LOGIC
      );
  end component altera_std_synchronizer;
                signal baud_clk_en :  STD_LOGIC;
                signal baud_load_value :  STD_LOGIC_VECTOR (8 DOWNTO 0);
                signal baud_rate_counter :  STD_LOGIC_VECTOR (8 DOWNTO 0);
                signal baud_rate_counter_is_zero :  STD_LOGIC;
                signal delayed_unxrx_in_processxx3 :  STD_LOGIC;
                signal delayed_unxsync_rxdxx1 :  STD_LOGIC;
                signal delayed_unxsync_rxdxx2 :  STD_LOGIC;
                signal do_start_rx :  STD_LOGIC;
                signal got_new_char :  STD_LOGIC;
                signal half_bit_cell_divisor :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal internal_rx_char_ready :  STD_LOGIC;
                signal is_break :  STD_LOGIC;
                signal is_framing_error :  STD_LOGIC;
                signal raw_data_in :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal rx_in_process :  STD_LOGIC;
                signal rx_rd_strobe_onset :  STD_LOGIC;
                signal rxd_edge :  STD_LOGIC;
                signal rxd_falling :  STD_LOGIC;
                signal rxd_shift_reg :  STD_LOGIC_VECTOR (9 DOWNTO 0);
                signal sample_enable :  STD_LOGIC;
                signal shift_reg_start_bit_n :  STD_LOGIC;
                signal source_rxd :  STD_LOGIC;
                signal stop_bit :  STD_LOGIC;
                signal sync_rxd :  STD_LOGIC;
                signal unused_start_bit :  STD_LOGIC;
                signal unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_in :  STD_LOGIC_VECTOR (9 DOWNTO 0);
                signal unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_out :  STD_LOGIC_VECTOR (9 DOWNTO 0);

begin

  --the_crypto_wallet_uart_0_rx_stimulus_source, which is an e_instance
  the_crypto_wallet_uart_0_rx_stimulus_source : crypto_wallet_uart_0_rx_stimulus_source
    port map(
      source_rxd => source_rxd,
      baud_divisor => baud_divisor,
      clk => clk,
      clk_en => clk_en,
      reset_n => reset_n,
      rx_char_ready => internal_rx_char_ready,
      rxd => rxd
    );


  the_altera_std_synchronizer : altera_std_synchronizer
    generic map(
      depth => 2
    )
    port map(
            clk => clk,
            din => source_rxd,
            dout => sync_rxd,
            reset_n => reset_n
    );

  --delayed_unxsync_rxdxx1, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      delayed_unxsync_rxdxx1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        delayed_unxsync_rxdxx1 <= sync_rxd;
      end if;
    end if;

  end process;

  rxd_falling <= NOT (sync_rxd) AND (delayed_unxsync_rxdxx1);
  --delayed_unxsync_rxdxx2, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      delayed_unxsync_rxdxx2 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        delayed_unxsync_rxdxx2 <= sync_rxd;
      end if;
    end if;

  end process;

  rxd_edge <= (sync_rxd) XOR (delayed_unxsync_rxdxx2);
  rx_rd_strobe_onset <= rx_rd_strobe AND begintransfer;
  half_bit_cell_divisor <= baud_divisor(8 DOWNTO 1);
  baud_load_value <= A_WE_StdLogicVector((std_logic'((rxd_edge)) = '1'), (std_logic_vector'("0") & (half_bit_cell_divisor)), baud_divisor);
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      baud_rate_counter <= std_logic_vector'("000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        if std_logic'((baud_rate_counter_is_zero OR rxd_edge)) = '1' then 
          baud_rate_counter <= baud_load_value;
        else
          baud_rate_counter <= A_EXT (((std_logic_vector'("000000000000000000000000") & (baud_rate_counter)) - std_logic_vector'("000000000000000000000000000000001")), 9);
        end if;
      end if;
    end if;

  end process;

  baud_rate_counter_is_zero <= to_std_logic(((std_logic_vector'("00000000000000000000000") & (baud_rate_counter)) = std_logic_vector'("00000000000000000000000000000000")));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      baud_clk_en <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        if std_logic'(rxd_edge) = '1' then 
          baud_clk_en <= std_logic'('0');
        else
          baud_clk_en <= baud_rate_counter_is_zero;
        end if;
      end if;
    end if;

  end process;

  sample_enable <= baud_clk_en AND rx_in_process;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      do_start_rx <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        if std_logic'((NOT rx_in_process AND rxd_falling)) = '1' then 
          do_start_rx <= std_logic'('1');
        else
          do_start_rx <= std_logic'('0');
        end if;
      end if;
    end if;

  end process;

  rx_in_process <= shift_reg_start_bit_n;
  (stop_bit, raw_data_in(7), raw_data_in(6), raw_data_in(5), raw_data_in(4), raw_data_in(3), raw_data_in(2), raw_data_in(1), raw_data_in(0), unused_start_bit) <= rxd_shift_reg;
  is_break <= NOT (or_reduce(rxd_shift_reg));
  is_framing_error <= NOT stop_bit AND NOT is_break;
  --delayed_unxrx_in_processxx3, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      delayed_unxrx_in_processxx3 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        delayed_unxrx_in_processxx3 <= rx_in_process;
      end if;
    end if;

  end process;

  got_new_char <= NOT (rx_in_process) AND (delayed_unxrx_in_processxx3);
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      rx_data <= std_logic_vector'("00000000");
    elsif clk'event and clk = '1' then
      if std_logic'(got_new_char) = '1' then 
        rx_data <= raw_data_in;
      end if;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      framing_error <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        if std_logic'(status_wr_strobe) = '1' then 
          framing_error <= std_logic'('0');
        elsif std_logic'((got_new_char AND is_framing_error)) = '1' then 
          framing_error <= Vector_To_Std_Logic(-SIGNED(std_logic_vector'("00000000000000000000000000000001")));
        end if;
      end if;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      break_detect <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        if std_logic'(status_wr_strobe) = '1' then 
          break_detect <= std_logic'('0');
        elsif std_logic'((got_new_char AND is_break)) = '1' then 
          break_detect <= Vector_To_Std_Logic(-SIGNED(std_logic_vector'("00000000000000000000000000000001")));
        end if;
      end if;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      rx_overrun <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        if std_logic'(status_wr_strobe) = '1' then 
          rx_overrun <= std_logic'('0');
        elsif std_logic'((got_new_char AND internal_rx_char_ready)) = '1' then 
          rx_overrun <= Vector_To_Std_Logic(-SIGNED(std_logic_vector'("00000000000000000000000000000001")));
        end if;
      end if;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      internal_rx_char_ready <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        if std_logic'(rx_rd_strobe_onset) = '1' then 
          internal_rx_char_ready <= std_logic'('0');
        elsif std_logic'(got_new_char) = '1' then 
          internal_rx_char_ready <= Vector_To_Std_Logic(-SIGNED(std_logic_vector'("00000000000000000000000000000001")));
        end if;
      end if;
    end if;

  end process;

  parity_error <= std_logic'('0');
  --_reg, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_out <= std_logic_vector'("0000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_out <= unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_in;
      end if;
    end if;

  end process;

  unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_in <= A_WE_StdLogicVector((std_logic'((do_start_rx)) = '1'), A_REP(std_logic'('1'), 10), A_WE_StdLogicVector((std_logic'((sample_enable)) = '1'), Std_Logic_Vector'(A_ToStdLogicVector(sync_rxd) & unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_out(9 DOWNTO 1)), unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_out));
  rxd_shift_reg <= unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_out;
  shift_reg_start_bit_n <= unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_out(0);
  --vhdl renameroo for output signals
  rx_char_ready <= internal_rx_char_ready;

end europa;



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

library std;
use std.textio.all;

entity crypto_wallet_uart_0_regs is 
        port (
              -- inputs:
                 signal address : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
                 signal break_detect : IN STD_LOGIC;
                 signal chipselect : IN STD_LOGIC;
                 signal clk : IN STD_LOGIC;
                 signal clk_en : IN STD_LOGIC;
                 signal framing_error : IN STD_LOGIC;
                 signal parity_error : IN STD_LOGIC;
                 signal read_n : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal rx_char_ready : IN STD_LOGIC;
                 signal rx_data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal rx_overrun : IN STD_LOGIC;
                 signal tx_overrun : IN STD_LOGIC;
                 signal tx_ready : IN STD_LOGIC;
                 signal tx_shift_empty : IN STD_LOGIC;
                 signal write_n : IN STD_LOGIC;
                 signal writedata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

              -- outputs:
                 signal baud_divisor : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
                 signal dataavailable : OUT STD_LOGIC;
                 signal do_force_break : OUT STD_LOGIC;
                 signal irq : OUT STD_LOGIC;
                 signal readdata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal readyfordata : OUT STD_LOGIC;
                 signal rx_rd_strobe : OUT STD_LOGIC;
                 signal status_wr_strobe : OUT STD_LOGIC;
                 signal tx_data : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal tx_wr_strobe : OUT STD_LOGIC
              );
end entity crypto_wallet_uart_0_regs;


architecture europa of crypto_wallet_uart_0_regs is
                signal any_error :  STD_LOGIC;
                signal control_reg :  STD_LOGIC_VECTOR (9 DOWNTO 0);
                signal control_wr_strobe :  STD_LOGIC;
                signal cts_status_bit :  STD_LOGIC;
                signal d1_rx_char_ready :  STD_LOGIC;
                signal d1_tx_ready :  STD_LOGIC;
                signal dcts_status_bit :  STD_LOGIC;
                signal delayed_unxtx_readyxx4 :  STD_LOGIC;
                signal divisor_constant :  STD_LOGIC_VECTOR (8 DOWNTO 0);
                signal do_write_char :  STD_LOGIC;
                signal eop_status_bit :  STD_LOGIC;
                signal ie_any_error :  STD_LOGIC;
                signal ie_break_detect :  STD_LOGIC;
                signal ie_framing_error :  STD_LOGIC;
                signal ie_parity_error :  STD_LOGIC;
                signal ie_rx_char_ready :  STD_LOGIC;
                signal ie_rx_overrun :  STD_LOGIC;
                signal ie_tx_overrun :  STD_LOGIC;
                signal ie_tx_ready :  STD_LOGIC;
                signal ie_tx_shift_empty :  STD_LOGIC;
                signal internal_tx_data :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal internal_tx_wr_strobe :  STD_LOGIC;
                signal qualified_irq :  STD_LOGIC;
                signal selected_read_data :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal status_reg :  STD_LOGIC_VECTOR (12 DOWNTO 0);

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      readdata <= std_logic_vector'("0000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        readdata <= selected_read_data;
      end if;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      irq <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        irq <= qualified_irq;
      end if;
    end if;

  end process;

  rx_rd_strobe <= (chipselect AND NOT read_n) AND to_std_logic(((address = std_logic_vector'("000"))));
  internal_tx_wr_strobe <= (chipselect AND NOT write_n) AND to_std_logic(((address = std_logic_vector'("001"))));
  status_wr_strobe <= (chipselect AND NOT write_n) AND to_std_logic(((address = std_logic_vector'("010"))));
  control_wr_strobe <= (chipselect AND NOT write_n) AND to_std_logic(((address = std_logic_vector'("011"))));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      internal_tx_data <= std_logic_vector'("00000000");
    elsif clk'event and clk = '1' then
      if std_logic'(internal_tx_wr_strobe) = '1' then 
        internal_tx_data <= writedata(7 DOWNTO 0);
      end if;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      control_reg <= std_logic_vector'("0000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(control_wr_strobe) = '1' then 
        control_reg <= writedata(9 DOWNTO 0);
      end if;
    end if;

  end process;

  baud_divisor <= divisor_constant;
  cts_status_bit <= std_logic'('0');
  dcts_status_bit <= std_logic'('0');
  (do_force_break, ie_any_error, ie_rx_char_ready, ie_tx_ready, ie_tx_shift_empty, ie_tx_overrun, ie_rx_overrun, ie_break_detect, ie_framing_error, ie_parity_error) <= control_reg;
  any_error <= (((tx_overrun OR rx_overrun) OR parity_error) OR framing_error) OR break_detect;
  status_reg <= Std_Logic_Vector'(A_ToStdLogicVector(eop_status_bit) & A_ToStdLogicVector(cts_status_bit) & A_ToStdLogicVector(dcts_status_bit) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(any_error) & A_ToStdLogicVector(rx_char_ready) & A_ToStdLogicVector(tx_ready) & A_ToStdLogicVector(tx_shift_empty) & A_ToStdLogicVector(tx_overrun) & A_ToStdLogicVector(rx_overrun) & A_ToStdLogicVector(break_detect) & A_ToStdLogicVector(framing_error) & A_ToStdLogicVector(parity_error));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_rx_char_ready <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        d1_rx_char_ready <= rx_char_ready;
      end if;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_tx_ready <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        d1_tx_ready <= tx_ready;
      end if;
    end if;

  end process;

  dataavailable <= d1_rx_char_ready;
  readyfordata <= d1_tx_ready;
  eop_status_bit <= std_logic'('0');
  selected_read_data <= ((((A_REP(to_std_logic(((address = std_logic_vector'("000")))), 16) AND (std_logic_vector'("00000000") & (rx_data)))) OR ((A_REP(to_std_logic(((address = std_logic_vector'("001")))), 16) AND (std_logic_vector'("00000000") & (internal_tx_data))))) OR ((A_REP(to_std_logic(((address = std_logic_vector'("010")))), 16) AND (std_logic_vector'("000") & (status_reg))))) OR ((A_REP(to_std_logic(((address = std_logic_vector'("011")))), 16) AND (std_logic_vector'("000000") & (control_reg))));
  qualified_irq <= (((((((((ie_any_error AND any_error)) OR ((ie_tx_shift_empty AND tx_shift_empty))) OR ((ie_tx_overrun AND tx_overrun))) OR ((ie_rx_overrun AND rx_overrun))) OR ((ie_break_detect AND break_detect))) OR ((ie_framing_error AND framing_error))) OR ((ie_parity_error AND parity_error))) OR ((ie_rx_char_ready AND rx_char_ready))) OR ((ie_tx_ready AND tx_ready));
  --vhdl renameroo for output signals
  tx_data <= internal_tx_data;
  --vhdl renameroo for output signals
  tx_wr_strobe <= internal_tx_wr_strobe;
--synthesis translate_off
    --delayed_unxtx_readyxx4, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        delayed_unxtx_readyxx4 <= std_logic'('0');
      elsif clk'event and clk = '1' then
        if std_logic'(clk_en) = '1' then 
          delayed_unxtx_readyxx4 <= tx_ready;
        end if;
      end if;

    end process;

    do_write_char <= (tx_ready) AND NOT (delayed_unxtx_readyxx4);
    process (clk)
    VARIABLE write_line : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'(do_write_char) = '1' then 
          write(write_line, character'val(CONV_INTEGER(internal_tx_data)));
          write(write_line, string'(""));
          write(output, write_line.all);
          deallocate (write_line);
        end if;
      end if;

    end process;

    divisor_constant <= std_logic_vector'("000000100");
--synthesis translate_on
--synthesis read_comments_as_HDL on
--    divisor_constant <= std_logic_vector'("110110010");
--synthesis read_comments_as_HDL off

end europa;



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

entity crypto_wallet_uart_0 is 
        port (
              -- inputs:
                 signal address : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
                 signal begintransfer : IN STD_LOGIC;
                 signal chipselect : IN STD_LOGIC;
                 signal clk : IN STD_LOGIC;
                 signal read_n : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal rxd : IN STD_LOGIC;
                 signal write_n : IN STD_LOGIC;
                 signal writedata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

              -- outputs:
                 signal dataavailable : OUT STD_LOGIC;
                 signal irq : OUT STD_LOGIC;
                 signal readdata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal readyfordata : OUT STD_LOGIC;
                 signal txd : OUT STD_LOGIC
              );
attribute altera_attribute : string;
attribute altera_attribute of crypto_wallet_uart_0 : entity is "-name SYNCHRONIZER_IDENTIFICATION OFF";
end entity crypto_wallet_uart_0;


architecture europa of crypto_wallet_uart_0 is
component crypto_wallet_uart_0_tx is 
           port (
                 -- inputs:
                    signal baud_divisor : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
                    signal begintransfer : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal clk_en : IN STD_LOGIC;
                    signal do_force_break : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal status_wr_strobe : IN STD_LOGIC;
                    signal tx_data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal tx_wr_strobe : IN STD_LOGIC;

                 -- outputs:
                    signal tx_overrun : OUT STD_LOGIC;
                    signal tx_ready : OUT STD_LOGIC;
                    signal tx_shift_empty : OUT STD_LOGIC;
                    signal txd : OUT STD_LOGIC
                 );
end component crypto_wallet_uart_0_tx;

component crypto_wallet_uart_0_rx is 
           port (
                 -- inputs:
                    signal baud_divisor : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
                    signal begintransfer : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal clk_en : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal rx_rd_strobe : IN STD_LOGIC;
                    signal rxd : IN STD_LOGIC;
                    signal status_wr_strobe : IN STD_LOGIC;

                 -- outputs:
                    signal break_detect : OUT STD_LOGIC;
                    signal framing_error : OUT STD_LOGIC;
                    signal parity_error : OUT STD_LOGIC;
                    signal rx_char_ready : OUT STD_LOGIC;
                    signal rx_data : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal rx_overrun : OUT STD_LOGIC
                 );
end component crypto_wallet_uart_0_rx;

component crypto_wallet_uart_0_regs is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
                    signal break_detect : IN STD_LOGIC;
                    signal chipselect : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal clk_en : IN STD_LOGIC;
                    signal framing_error : IN STD_LOGIC;
                    signal parity_error : IN STD_LOGIC;
                    signal read_n : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal rx_char_ready : IN STD_LOGIC;
                    signal rx_data : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal rx_overrun : IN STD_LOGIC;
                    signal tx_overrun : IN STD_LOGIC;
                    signal tx_ready : IN STD_LOGIC;
                    signal tx_shift_empty : IN STD_LOGIC;
                    signal write_n : IN STD_LOGIC;
                    signal writedata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

                 -- outputs:
                    signal baud_divisor : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
                    signal dataavailable : OUT STD_LOGIC;
                    signal do_force_break : OUT STD_LOGIC;
                    signal irq : OUT STD_LOGIC;
                    signal readdata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal readyfordata : OUT STD_LOGIC;
                    signal rx_rd_strobe : OUT STD_LOGIC;
                    signal status_wr_strobe : OUT STD_LOGIC;
                    signal tx_data : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal tx_wr_strobe : OUT STD_LOGIC
                 );
end component crypto_wallet_uart_0_regs;

                signal baud_divisor :  STD_LOGIC_VECTOR (8 DOWNTO 0);
                signal break_detect :  STD_LOGIC;
                signal clk_en :  STD_LOGIC;
                signal do_force_break :  STD_LOGIC;
                signal framing_error :  STD_LOGIC;
                signal internal_dataavailable :  STD_LOGIC;
                signal internal_irq :  STD_LOGIC;
                signal internal_readdata :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal internal_readyfordata :  STD_LOGIC;
                signal internal_txd :  STD_LOGIC;
                signal parity_error :  STD_LOGIC;
                signal rx_char_ready :  STD_LOGIC;
                signal rx_data :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal rx_overrun :  STD_LOGIC;
                signal rx_rd_strobe :  STD_LOGIC;
                signal status_wr_strobe :  STD_LOGIC;
                signal tx_data :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal tx_overrun :  STD_LOGIC;
                signal tx_ready :  STD_LOGIC;
                signal tx_shift_empty :  STD_LOGIC;
                signal tx_wr_strobe :  STD_LOGIC;

begin

  clk_en <= std_logic'('1');
  --the_crypto_wallet_uart_0_tx, which is an e_instance
  the_crypto_wallet_uart_0_tx : crypto_wallet_uart_0_tx
    port map(
      tx_overrun => tx_overrun,
      tx_ready => tx_ready,
      tx_shift_empty => tx_shift_empty,
      txd => internal_txd,
      baud_divisor => baud_divisor,
      begintransfer => begintransfer,
      clk => clk,
      clk_en => clk_en,
      do_force_break => do_force_break,
      reset_n => reset_n,
      status_wr_strobe => status_wr_strobe,
      tx_data => tx_data,
      tx_wr_strobe => tx_wr_strobe
    );


  --the_crypto_wallet_uart_0_rx, which is an e_instance
  the_crypto_wallet_uart_0_rx : crypto_wallet_uart_0_rx
    port map(
      break_detect => break_detect,
      framing_error => framing_error,
      parity_error => parity_error,
      rx_char_ready => rx_char_ready,
      rx_data => rx_data,
      rx_overrun => rx_overrun,
      baud_divisor => baud_divisor,
      begintransfer => begintransfer,
      clk => clk,
      clk_en => clk_en,
      reset_n => reset_n,
      rx_rd_strobe => rx_rd_strobe,
      rxd => rxd,
      status_wr_strobe => status_wr_strobe
    );


  --the_crypto_wallet_uart_0_regs, which is an e_instance
  the_crypto_wallet_uart_0_regs : crypto_wallet_uart_0_regs
    port map(
      baud_divisor => baud_divisor,
      dataavailable => internal_dataavailable,
      do_force_break => do_force_break,
      irq => internal_irq,
      readdata => internal_readdata,
      readyfordata => internal_readyfordata,
      rx_rd_strobe => rx_rd_strobe,
      status_wr_strobe => status_wr_strobe,
      tx_data => tx_data,
      tx_wr_strobe => tx_wr_strobe,
      address => address,
      break_detect => break_detect,
      chipselect => chipselect,
      clk => clk,
      clk_en => clk_en,
      framing_error => framing_error,
      parity_error => parity_error,
      read_n => read_n,
      reset_n => reset_n,
      rx_char_ready => rx_char_ready,
      rx_data => rx_data,
      rx_overrun => rx_overrun,
      tx_overrun => tx_overrun,
      tx_ready => tx_ready,
      tx_shift_empty => tx_shift_empty,
      write_n => write_n,
      writedata => writedata
    );


  --s1, which is an e_avalon_slave
  --vhdl renameroo for output signals
  dataavailable <= internal_dataavailable;
  --vhdl renameroo for output signals
  irq <= internal_irq;
  --vhdl renameroo for output signals
  readdata <= internal_readdata;
  --vhdl renameroo for output signals
  readyfordata <= internal_readyfordata;
  --vhdl renameroo for output signals
  txd <= internal_txd;

end europa;

