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
// output_name:                                       altera_conduit_bfm
// role:width:direction:                              data0:1:output,dclk:1:input,sce:1:input,sdo:1:input
// 0
//-----------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module altera_conduit_bfm
(
   sig_data0,
   sig_dclk,
   sig_sce,
   sig_sdo
);

   //--------------------------------------------------------------------------
   // =head1 PINS 
   // =head2 User defined interface
   //--------------------------------------------------------------------------
   output sig_data0;
   input sig_dclk;
   input sig_sce;
   input sig_sdo;

   // synthesis translate_off
   import verbosity_pkg::*;
   
   typedef logic ROLE_data0_t;
   typedef logic ROLE_dclk_t;
   typedef logic ROLE_sce_t;
   typedef logic ROLE_sdo_t;

   reg sig_data0_temp;
   reg sig_data0_out;
   logic [0 : 0] sig_dclk_in;
   logic [0 : 0] sig_dclk_local;
   logic [0 : 0] sig_sce_in;
   logic [0 : 0] sig_sce_local;
   logic [0 : 0] sig_sdo_in;
   logic [0 : 0] sig_sdo_local;

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
   
   event signal_input_dclk_change;
   event signal_input_sce_change;
   event signal_input_sdo_change;
   
   function automatic string get_version();  // public
      // Return BFM version string. For example, version 9.1 sp1 is "9.1sp1" 
      string ret_version = "18.1";
      return ret_version;
   endfunction

   // -------------------------------------------------------
   // data0
   // -------------------------------------------------------

   function automatic void set_data0 (
      ROLE_data0_t new_value
   );
      // Drive the new value to data0.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      sig_data0_temp = new_value;
   endfunction

   // -------------------------------------------------------
   // dclk
   // -------------------------------------------------------
   function automatic ROLE_dclk_t get_dclk();
   
      // Gets the dclk input value.
      $sformat(message, "%m: called get_dclk");
      print(VERBOSITY_DEBUG, message);
      return sig_dclk_in;
      
   endfunction

   // -------------------------------------------------------
   // sce
   // -------------------------------------------------------
   function automatic ROLE_sce_t get_sce();
   
      // Gets the sce input value.
      $sformat(message, "%m: called get_sce");
      print(VERBOSITY_DEBUG, message);
      return sig_sce_in;
      
   endfunction

   // -------------------------------------------------------
   // sdo
   // -------------------------------------------------------
   function automatic ROLE_sdo_t get_sdo();
   
      // Gets the sdo input value.
      $sformat(message, "%m: called get_sdo");
      print(VERBOSITY_DEBUG, message);
      return sig_sdo_in;
      
   endfunction

   assign sig_data0 = sig_data0_temp;
   assign sig_dclk_in = sig_dclk;
   assign sig_sce_in = sig_sce;
   assign sig_sdo_in = sig_sdo;


   always @(sig_dclk_in) begin
      if (sig_dclk_local != sig_dclk_in)
         -> signal_input_dclk_change;
      sig_dclk_local = sig_dclk_in;
   end
   
   always @(sig_sce_in) begin
      if (sig_sce_local != sig_sce_in)
         -> signal_input_sce_change;
      sig_sce_local = sig_sce_in;
   end
   
   always @(sig_sdo_in) begin
      if (sig_sdo_local != sig_sdo_in)
         -> signal_input_sdo_change;
      sig_sdo_local = sig_sdo_in;
   end
   


// synthesis translate_on

endmodule

