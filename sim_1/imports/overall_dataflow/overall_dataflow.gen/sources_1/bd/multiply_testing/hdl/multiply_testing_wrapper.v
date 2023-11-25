//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
//Date        : Sat Sep 30 13:57:57 2023
//Host        : TrungNhatPC running 64-bit major release  (build 9200)
//Command     : generate_target multiply_testing_wrapper.bd
//Design      : multiply_testing_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module multiply_testing_wrapper
   (A,
    B,
    CLK,
    P);
  input [17:0]A;
  input [17:0]B;
  input CLK;
  output [35:0]P;

  wire [17:0]A;
  wire [17:0]B;
  wire CLK;
  wire [35:0]P;

  multiply_testing multiply_testing_i
       (.A(A),
        .B(B),
        .CLK(CLK),
        .P(P));
endmodule
