`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2023 10:33:21 AM
// Design Name: 
// Module Name: deconv_eachcol_tb
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


module deconv_eachcol_tb(

    );
    parameter BIT_WIDTH            = 8;
    parameter NO_COL_KERNEL        = 5;
    parameter NO_COL_INPUT_FEATURE = 8;
    
    reg                                                         i_clk             ;
    reg                                                         i_rst_n           ;
    reg   [BIT_WIDTH*NO_COL_KERNEL-1                       :0]  i_weight_col      ;
    reg   [BIT_WIDTH*NO_COL_INPUT_FEATURE-1                :0]  i_feature_map_col ;
    wire  [2*BIT_WIDTH*NO_COL_KERNEL*NO_COL_INPUT_FEATURE-1:0]  o_feature_map_col ;
    wire  en_accumm                                                               ;  
    wire  [2:0] kernel_column_id                                                  ; //weight col id
    wire  [3:0] input_column_id                                                   ; //input col id
    wire  en_fifo_loop                                                            ; //loop back weight to compute new input column
    wire  en_prcs_new_chnl                                                        ; //change to the next channel of same kernel
    reg   i_enable_loadw                                                          ; //load one col weight
    reg   i_enable_loadip                                                         ; //load one col input
    wire  o_ready                                                                 ;
    wire  o_en_strobe                                                             ;
    wire  o_full_start                                                            ;
    
    deconv_eachcol deconv_each_col_inst_0(
        i_clk             ,
        i_rst_n           ,
        i_weight_col      ,
        i_feature_map_col ,
        o_feature_map_col ,
        en_accumm         ,  
        kernel_column_id  , //weight col id
        input_column_id   , //input col id
        en_fifo_loop      , //loop back weight to compute new input column
        en_prcs_new_chnl  , //change to the next channel of same kernel
        i_enable_loadw    , //load one col weight
        i_enable_loadip   , //load one col input
        o_ready           ,
        o_en_strobe       ,
        o_full_start
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
        i_enable_loadw     = 1'b0;
        i_enable_loadip    = 1'b0;
        i_feature_map_col  = {$random, $random, $random};
        i_weight_col       = {$random, $random};
        wait(i_rst_n===1'b1);
        i_enable_loadw     = 1'b1;
        i_enable_loadip    = 1'b1;
        repeat(10)
        begin
            @(posedge i_clk);
            i_feature_map_col  = {$random, $random, $random};
            i_weight_col       = {$random, $random};
        end
    end
endmodule
