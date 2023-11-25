//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
//Date        : Sat Nov  4 16:02:18 2023
//Host        : TrungNhatPC running 64-bit major release  (build 9200)
//Command     : generate_target test_read_4bram_wrapper.bd
//Design      : test_read_4bram_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module test_read_4bram_wrapper
   (clk,
    control_signal,
    dbg_bram_addr,
    dbg_bram_data,
    dbg_bram_en,
    dbg_bram_rd_data,
    dbg_bram_rd_valid,
    rst,
    status_signal);
  input clk;
  input [31:0]control_signal;
  output [31:0]dbg_bram_addr;
  output [31:0]dbg_bram_data;
  output dbg_bram_en;
  output [31:0]dbg_bram_rd_data;
  output dbg_bram_rd_valid;
  input rst;
  output [31:0]status_signal;

  wire clk;
  wire [31:0]control_signal;
  wire [31:0]dbg_bram_addr;
  wire [31:0]dbg_bram_data;
  wire dbg_bram_en;
  wire [31:0]dbg_bram_rd_data;
  wire dbg_bram_rd_valid;
  wire rst;
  wire [31:0]status_signal;

  test_read_4bram test_read_4bram_i
       (.clk(clk),
        .control_signal(control_signal),
        .dbg_bram_addr(dbg_bram_addr),
        .dbg_bram_data(dbg_bram_data),
        .dbg_bram_en(dbg_bram_en),
        .dbg_bram_rd_data(dbg_bram_rd_data),
        .dbg_bram_rd_valid(dbg_bram_rd_valid),
        .rst(rst),
        .status_signal(status_signal));
endmodule
