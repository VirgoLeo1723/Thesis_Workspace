`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2023 01:49:40 PM
// Design Name: 
// Module Name: multiply_testing_tb
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


module multiply_testing_tb(

    );
    reg clk;
    wire [17:0] P;
    
    initial
    begin
        clk=0;
        repeat(10) #1 clk=~clk;
    end  
endmodule
