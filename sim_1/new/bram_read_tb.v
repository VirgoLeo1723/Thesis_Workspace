`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2023 03:05:59 PM
// Design Name: 
// Module Name: bram_read_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module bram_read_tb(
    
    );
    
    reg  clk ;
    reg  rst ;
    reg  en  ;
    wire [7:0] data_out;
    wire  valid;
    
    bram_read_test_wrapper inst_0
   (clk,
    data_out,
    en,
    rst,
    valid);
    
    initial
    begin
        clk = 0;
        repeat(100) #1 clk = ~clk;
    end
    
    initial
    begin
        rst = 0 ;
        #2 rst = 1;
    end
    
    initial
    begin
        en = 1;
    end
    
endmodule
