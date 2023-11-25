`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2023 03:25:49 PM
// Design Name: 
// Module Name: test_read_4bram_tb
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


module test_read_4bram_tb(

    );
    reg clk; 
    reg control_signal;
    reg rst;
    wire dbg_bram_addr;
    wire[7:0] dbg_bram_data;
    wire dbg_bram_en;
    wire dbg_bram_rd_data;
    wire dbg_bram_rd_valid;
    wire status_signal;
    
    
    test_read_4bram_wrapper inst_0 
   (clk, 
    control_signal,
    dbg_bram_addr,
    dbg_bram_data,
    dbg_bram_en,
    dbg_bram_rd_data,
    dbg_bram_rd_valid,
    rst,
    status_signal);
    
    initial
    begin
        clk = 0;
        repeat(100) #1 clk = ~clk;
    end
    
    initial
    begin
        rst = 0;
        #2 rst = 1;
    end
    
    initial
    begin
        control_signal = 32'd1;
    end

endmodule
