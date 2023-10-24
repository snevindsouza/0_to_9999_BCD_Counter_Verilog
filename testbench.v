`timescale 1ns / 1ps //optional
module testbench;
    
    reg clk,rst;
    wire [3:0] ctrl ;
    wire [7:0] segment;

    counter dut(clk, rst, ctrl, segment);

    always #1 clk = ~clk;  //clock signal

    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(0,testbench);
        clk <= 1'b0;
        $monitor("ctrl = %d, segment = %d\n",ctrl,segment);
    end

    initial #100000 $finish; //100k clock pulses

endmodule
