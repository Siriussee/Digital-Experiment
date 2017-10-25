`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/25 15:48:41
// Design Name: 
// Module Name: AndLogic
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


module AndLogic(
    input CLK,
    input IN1,
    input IN2,
    output reg OUT1
    );
    always@(posedge CLK)
        OUT1 <= ~(IN1&IN2);
endmodule
