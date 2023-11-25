`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2023 08:56:26 AM
// Design Name: 
// Module Name: multiply_tb
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


module multiply_tb(
    );
    parameter BIT_WIDTH = 8;
    
    reg                        i_clk         ;
    reg                        i_rst_n       ;
    reg   [BIT_WIDTH-1  :0]    i_pix_weight  ;
    reg   [BIT_WIDTH-1  :0]    i_pix_feature ;
    wire  [2*BIT_WIDTH-1:0]    o_pix_feature ;
    reg                        i_enable_colw ;
    reg                        i_enable_colip;
    wire                       o_ready       ;
    wire                       o_start       ;
    
    multiply multiply_inst_0 (
        i_clk         ,
        i_rst_n       ,
        i_pix_weight  ,
        i_pix_feature ,
        o_pix_feature ,
        i_enable_colw ,
        i_enable_colip,
        o_ready       ,
        o_start
    );
    
    initial
    begin
        i_clk = 0;
        repeat(100) #1 i_clk=~i_clk;
    end
    
    initial
    begin
        i_rst_n = 1'b0;
        #2 i_rst_n = 1'b1;
    end
    
    initial
    begin
        i_enable_colw  = 1'b0;
        i_enable_colip = 1'b0;
        i_pix_weight   = $random;
        i_pix_feature  = $random;
        wait(i_rst_n===1'b1);
        i_enable_colw  = 1'b1;
        i_enable_colip = 1'b1;
        repeat(5)
        begin
            @(posedge i_clk);
            i_pix_weight   = $random;
            i_pix_feature  = $random;
        end
    end
endmodule
