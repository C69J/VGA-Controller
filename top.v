`timescale 1ns / 1ps

module top (
    input wire clk,      // 100 MHz
    output wire Hsync,
    output wire Vsync,
    output wire [3:0] Red,
    output wire [3:0] Green,
    output wire [3:0] Blue
);

    wire clk25_en;
    wire v_enable;
    wire [9:0]h_count;
    wire [9:0]v_count;

    // 25 MHz enable
    clock_divider u_clk_en(
        .clk(clk),
        .clk25_en(clk25_en)
    );

    // Horizontal counter
    horizontal_counter u_h(
        .clk(clk),
        .clk25_en(clk25_en),
        .h_count(h_count),
        .v_enable(v_enable)
    );

    // Vertical counter
    vertical_counter u_v(
        .clk(clk),
        .clk25_en(clk25_en),
        .v_enable(v_enable),
        .v_count(v_count)
    );

    // VGA sync(ACTIVE LOW)
    assign Hsync=(h_count<96) ? 1'b0 : 1'b1;
    assign Vsync=(v_count<2)  ? 1'b0 : 1'b1;

    // Visible region(640x480)
    wire visible_area;
    assign visible_area =
        (h_count>=144 && h_count<784) &&
        (v_count>=35  && v_count<515);

    assign Red = visible_area ? 4'b1111 : 4'b0000;
    assign Green=visible_area ? 4'b1111 : 4'b0000;
    assign Blue= visible_area ? 4'b0000 : 4'b0000;

endmodule