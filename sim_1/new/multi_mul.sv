`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2023 09:46:37 AM
// Design Name: 
// Module Name: multi_mul
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


module multi_mul_tb();
    parameter BIT_WIDTH = 8;
    parameter NO_COL_KERNEL = 5;

    // Control signal    
    reg                                    i_clk            ;
    reg                                    i_rst_n          ;
    reg                                    i_enable_colw    ;
    reg                                    i_enable_colip   ;
    
    // Data signal
    reg   [BIT_WIDTH*NO_COL_KERNEL-1  :0]  i_weight_col     ;
    reg   [BIT_WIDTH-1                :0]  i_pix_feature_map;
    
    // output
    wire  [2*BIT_WIDTH*NO_COL_KERNEL-1:0]  o_feature_map_col;
    wire  [2:0]                            o_kercol_cnt     ;
    wire                                   o_ready          ;
    wire                                   o_start          ;
    

    multi_mul multi_mul_inst0 (
        i_clk            ,
        i_rst_n          ,
        i_weight_col     ,
        i_pix_feature_map,
        o_feature_map_col,
        o_kercol_cnt     ,
        i_enable_colw    ,
        i_enable_colip   ,
        o_ready          ,
        o_start          
    );
    
    initial
    begin
        i_clk = 1'b0;
        repeat(100) #1 i_clk = ~i_clk;
    end
    
    initial 
    begin
        i_rst_n  = 1'b0;
        #2 i_rst_n = 1'b1;
    end
    
    initial
    begin
        i_enable_colw      = 1'b0;
        i_enable_colip     = 1'b0;
        i_pix_feature_map  = $random;
        i_weight_col       = {$random, $random};
        wait(i_rst_n===1'b1);
        i_enable_colw  = 1'b1;
        i_enable_colip = 1'b1;
        repeat(5)
        begin
            @(posedge i_clk);
            i_pix_feature_map  = $random;
            i_weight_col       = {$random, $random};
        end
    end
endmodule
