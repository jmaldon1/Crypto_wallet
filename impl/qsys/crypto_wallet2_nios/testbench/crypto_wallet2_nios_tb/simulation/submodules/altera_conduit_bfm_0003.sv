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
// output_name:                                       altera_conduit_bfm_0003
// role:width:direction:                              addr:13:input,ba:2:input,cas_n:1:input,cke:1:input,cs_n:1:input,dq:16:bidir,dqm:2:input,ras_n:1:input,we_n:1:input
// 0
//-----------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module altera_conduit_bfm_0003
(
   sig_addr,
   sig_ba,
   sig_cas_n,
   sig_cke,
   sig_cs_n,
   sig_dq,
   sig_dqm,
   sig_ras_n,
   sig_we_n
);

   //--------------------------------------------------------------------------
   // =head1 PINS 
   // =head2 User defined interface
   //--------------------------------------------------------------------------
   input [12 : 0] sig_addr;
   input [1 : 0] sig_ba;
   input sig_cas_n;
   input sig_cke;
   input sig_cs_n;
   inout wire [15 : 0] sig_dq;
   input [1 : 0] sig_dqm;
   input sig_ras_n;
   input sig_we_n;

   // synthesis translate_off
   import verbosity_pkg::*;
   
   typedef logic [12 : 0] ROLE_addr_t;
   typedef logic [1 : 0] ROLE_ba_t;
   typedef logic ROLE_cas_n_t;
   typedef logic ROLE_cke_t;
   typedef logic ROLE_cs_n_t;
   typedef logic [15 : 0] ROLE_dq_t;
   typedef logic [1 : 0] ROLE_dqm_t;
   typedef logic ROLE_ras_n_t;
   typedef logic ROLE_we_n_t;

   logic [12 : 0] sig_addr_in;
   logic [12 : 0] sig_addr_local;
   logic [1 : 0] sig_ba_in;
   logic [1 : 0] sig_ba_local;
   logic [0 : 0] sig_cas_n_in;
   logic [0 : 0] sig_cas_n_local;
   logic [0 : 0] sig_cke_in;
   logic [0 : 0] sig_cke_local;
   logic [0 : 0] sig_cs_n_in;
   logic [0 : 0] sig_cs_n_local;
   logic sig_dq_oe;
   logic sig_dq_oe_temp = 0;
   reg [15 : 0] sig_dq_temp;
   reg [15 : 0] sig_dq_out;
   logic [15 : 0] sig_dq_in;
   logic [15 : 0] sig_dq_local;
   logic [1 : 0] sig_dqm_in;
   logic [1 : 0] sig_dqm_local;
   logic [0 : 0] sig_ras_n_in;
   logic [0 : 0] sig_ras_n_local;
   logic [0 : 0] sig_we_n_in;
   logic [0 : 0] sig_we_n_local;

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
   
   event signal_input_addr_change;
   event signal_input_ba_change;
   event signal_input_cas_n_change;
   event signal_input_cke_change;
   event signal_input_cs_n_change;
   event signal_input_dq_change;
   event signal_input_dqm_change;
   event signal_input_ras_n_change;
   event signal_input_we_n_change;
   
   function automatic string get_version();  // public
      // Return BFM version string. For example, version 9.1 sp1 is "9.1sp1" 
      string ret_version = "18.1";
      return ret_version;
   endfunction

   // -------------------------------------------------------
   // addr
   // -------------------------------------------------------
   function automatic ROLE_addr_t get_addr();
   
      // Gets the addr input value.
      $sformat(message, "%m: called get_addr");
      print(VERBOSITY_DEBUG, message);
      return sig_addr_in;
      
   endfunction

   // -------------------------------------------------------
   // ba
   // -------------------------------------------------------
   function automatic ROLE_ba_t get_ba();
   
      // Gets the ba input value.
      $sformat(message, "%m: called get_ba");
      print(VERBOSITY_DEBUG, message);
      return sig_ba_in;
      
   endfunction

   // -------------------------------------------------------
   // cas_n
   // -------------------------------------------------------
   function automatic ROLE_cas_n_t get_cas_n();
   
      // Gets the cas_n input value.
      $sformat(message, "%m: called get_cas_n");
      print(VERBOSITY_DEBUG, message);
      return sig_cas_n_in;
      
   endfunction

   // -------------------------------------------------------
   // cke
   // -------------------------------------------------------
   function automatic ROLE_cke_t get_cke();
   
      // Gets the cke input value.
      $sformat(message, "%m: called get_cke");
      print(VERBOSITY_DEBUG, message);
      return sig_cke_in;
      
   endfunction

   // -------------------------------------------------------
   // cs_n
   // -------------------------------------------------------
   function automatic ROLE_cs_n_t get_cs_n();
   
      // Gets the cs_n input value.
      $sformat(message, "%m: called get_cs_n");
      print(VERBOSITY_DEBUG, message);
      return sig_cs_n_in;
      
   endfunction

   // -------------------------------------------------------
   // dq
   // -------------------------------------------------------
   function automatic ROLE_dq_t get_dq();
   
      // Gets the dq input value.
      $sformat(message, "%m: called get_dq");
      print(VERBOSITY_DEBUG, message);
      return sig_dq_in;
      
   endfunction

   function automatic void set_dq (
      ROLE_dq_t new_value
   );
      // Drive the new value to dq.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      sig_dq_temp = new_value;
   endfunction
   
   function automatic void set_dq_oe (
      bit enable
   );
      // bidir port dq will work as output port when set to 1.
      // bidir port dq will work as input port when set to 0.
      
      $sformat(message, "%m: method called arg0 %0d", enable); 
      print(VERBOSITY_DEBUG, message);
      
      sig_dq_oe_temp = enable;
   endfunction

   // -------------------------------------------------------
   // dqm
   // -------------------------------------------------------
   function automatic ROLE_dqm_t get_dqm();
   
      // Gets the dqm input value.
      $sformat(message, "%m: called get_dqm");
      print(VERBOSITY_DEBUG, message);
      return sig_dqm_in;
      
   endfunction

   // -------------------------------------------------------
   // ras_n
   // -------------------------------------------------------
   function automatic ROLE_ras_n_t get_ras_n();
   
      // Gets the ras_n input value.
      $sformat(message, "%m: called get_ras_n");
      print(VERBOSITY_DEBUG, message);
      return sig_ras_n_in;
      
   endfunction

   // -------------------------------------------------------
   // we_n
   // -------------------------------------------------------
   function automatic ROLE_we_n_t get_we_n();
   
      // Gets the we_n input value.
      $sformat(message, "%m: called get_we_n");
      print(VERBOSITY_DEBUG, message);
      return sig_we_n_in;
      
   endfunction

   assign sig_addr_in = sig_addr;
   assign sig_ba_in = sig_ba;
   assign sig_cas_n_in = sig_cas_n;
   assign sig_cke_in = sig_cke;
   assign sig_cs_n_in = sig_cs_n;
   assign sig_dq_oe = sig_dq_oe_temp;
   assign sig_dq = (sig_dq_oe == 1)? sig_dq_temp:'z;
   assign sig_dq_in = (sig_dq_oe == 0)? sig_dq:'z;
   assign sig_dqm_in = sig_dqm;
   assign sig_ras_n_in = sig_ras_n;
   assign sig_we_n_in = sig_we_n;


   always @(sig_addr_in) begin
      if (sig_addr_local != sig_addr_in)
         -> signal_input_addr_change;
      sig_addr_local = sig_addr_in;
   end
   
   always @(sig_ba_in) begin
      if (sig_ba_local != sig_ba_in)
         -> signal_input_ba_change;
      sig_ba_local = sig_ba_in;
   end
   
   always @(sig_cas_n_in) begin
      if (sig_cas_n_local != sig_cas_n_in)
         -> signal_input_cas_n_change;
      sig_cas_n_local = sig_cas_n_in;
   end
   
   always @(sig_cke_in) begin
      if (sig_cke_local != sig_cke_in)
         -> signal_input_cke_change;
      sig_cke_local = sig_cke_in;
   end
   
   always @(sig_cs_n_in) begin
      if (sig_cs_n_local != sig_cs_n_in)
         -> signal_input_cs_n_change;
      sig_cs_n_local = sig_cs_n_in;
   end
   
   always @(sig_dq_in) begin
      if (sig_dq_oe == 0) begin
         if (sig_dq_local != sig_dq_in)
            -> signal_input_dq_change;
         sig_dq_local = sig_dq_in;
      end
   end
   
   always @(sig_dqm_in) begin
      if (sig_dqm_local != sig_dqm_in)
         -> signal_input_dqm_change;
      sig_dqm_local = sig_dqm_in;
   end
   
   always @(sig_ras_n_in) begin
      if (sig_ras_n_local != sig_ras_n_in)
         -> signal_input_ras_n_change;
      sig_ras_n_local = sig_ras_n_in;
   end
   
   always @(sig_we_n_in) begin
      if (sig_we_n_local != sig_we_n_in)
         -> signal_input_we_n_change;
      sig_we_n_local = sig_we_n_in;
   end
   


// synthesis translate_on

endmodule

