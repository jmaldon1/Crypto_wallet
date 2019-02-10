// (C) 2001-2018 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $Id: //acds/main/ip/sopc/components/verification/altera_tristate_conduit_bfm/altera_tristate_conduit_bfm.sv.terp#7 $
// $Revision: #7 $
// $Date: 2010/08/05 $
// $Author: klong $
//-----------------------------------------------------------------------------
// =head1 NAME
// altera_conduit_bfm
// =head1 SYNOPSIS
// Bus Functional Model (BFM) for a Standard Conduit BFM
//-----------------------------------------------------------------------------
// =head1 DESCRIPTION
// This is a Bus Functional Model (BFM) for a Standard Conduit Master.
// This BFM sampled the input/bidirection port value or driving user's value to 
// output ports when user call the API.  
// This BFM's HDL is been generated through terp file in Qsys/SOPC Builder.
// Generation parameters:
// output_name:                                       altera_conduit_bfm_0004
// role:width:direction:                              rxd:1:output,txd:1:input
// 0
//-----------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module altera_conduit_bfm_0004
(
   sig_rxd,
   sig_txd
);

   //--------------------------------------------------------------------------
   // =head1 PINS 
   // =head2 User defined interface
   //--------------------------------------------------------------------------
   output sig_rxd;
   input sig_txd;

   // synthesis translate_off
   import verbosity_pkg::*;
   
   typedef logic ROLE_rxd_t;
   typedef logic ROLE_txd_t;

   reg sig_rxd_temp;
   reg sig_rxd_out;
   logic [0 : 0] sig_txd_in;
   logic [0 : 0] sig_txd_local;

   //--------------------------------------------------------------------------
   // =head1 Public Methods API
   // =pod
   // This section describes the public methods in the application programming
   // interface (API). The application program interface provides methods for 
   // a testbench which instantiates, controls and queries state in this BFM 
   // component. Test programs must only use these public access methods and 
   // events to communicate with this BFM component. The API and module pins
   // are the only interfaces of this component that are guaranteed to be
   // stable. The API will be maintained for the life of the product. 
   // While we cannot prevent a test program from directly accessing internal
   // tasks, functions, or data private to the BFM, there is no guarantee that
   // these will be present in the future. In fact, it is best for the user
   // to assume that the underlying implementation of this component can 
   // and will change.
   // =cut
   //--------------------------------------------------------------------------
   
   event signal_input_txd_change;
   
   function automatic string get_version();  // public
      // Return BFM version string. For example, version 9.1 sp1 is "9.1sp1" 
      string ret_version = "18.1";
      return ret_version;
   endfunction

   // -------------------------------------------------------
   // rxd
   // -------------------------------------------------------

   function automatic void set_rxd (
      ROLE_rxd_t new_value
   );
      // Drive the new value to rxd.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      sig_rxd_temp = new_value;
   endfunction

   // -------------------------------------------------------
   // txd
   // -------------------------------------------------------
   function automatic ROLE_txd_t get_txd();
   
      // Gets the txd input value.
      $sformat(message, "%m: called get_txd");
      print(VERBOSITY_DEBUG, message);
      return sig_txd_in;
      
   endfunction

   assign sig_rxd = sig_rxd_temp;
   assign sig_txd_in = sig_txd;


   always @(sig_txd_in) begin
      if (sig_txd_local != sig_txd_in)
         -> signal_input_txd_change;
      sig_txd_local = sig_txd_in;
   end
   


// synthesis translate_on

endmodule

