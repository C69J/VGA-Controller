`timescale 1ns / 1ps

module vertical_counter (
    input wire clk,
    input wire clk25_en,
    input wire v_enable,
    output reg [9:0] v_count=0
);

  always@(posedge clk) 
    begin
       if(clk25_en && v_enable) 
        begin
            if(v_count==524)
                v_count<=0;
            else
                v_count<=v_count+1;
        end
    end
endmodule