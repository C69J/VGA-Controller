`timescale 1ns / 1ps

module horizontal_counter (
    input wire clk,
    input wire clk25_en,
    output reg [9:0] h_count=0,
    output reg v_enable=0
);

  always@(posedge clk)
    begin
      if(clk25_en)
        begin
            if(h_count==799)
              begin
                h_count<=0;
                v_enable<=1;  // one-line pulse
              end 
            else 
              begin
                h_count<=h_count+1;
                v_enable<=0;
              end
        end
    end
endmodule