`timescale 1ns / 1ps

module clock_divider(
    input  wire clk,        // 100 MHz
    output reg  clk25_en = 0 // 25 MHz enable
);
    reg [1:0] div_count = 0;

  always @(posedge clk) 
    begin
        div_count <= div_count + 1;
        clk25_en <= (div_count == 2'd3); // pulse every 4 cycles
    end
endmodule