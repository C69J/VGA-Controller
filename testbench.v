`timescale 1ns / 1ps

module tb_vga;

    reg clk = 0;

    wire Hsync;
    wire Vsync;
    wire [3:0] Red;
    wire [3:0] Green;
    wire [3:0] Blue;

    // Instantiate DUT
    top DUT (
        .clk(clk),
        .Hsync(Hsync),
        .Vsync(Vsync),
        .Red(Red),
        .Green(Green),
        .Blue(Blue)
    );

    // 100 MHz clock
    always #5 clk = ~clk;

    // Simulation control
    initial begin
        $display("Starting VGA simulation...");
        $dumpfile("vga.vcd");      // for GTKWave
        $dumpvars(0, tb_vga);

        // Run for 1 VGA frame (~16.6 ms)
        #17_000_000;

        $display("Simulation finished");
        $finish;
    end

endmodule