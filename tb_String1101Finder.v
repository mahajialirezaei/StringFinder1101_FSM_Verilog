`timescale 1ns/1ps

module tb_String1101Finder

    reg x;
    reg clk;
    reg clr;
    wire out;
    String1101Finder dut(
        .x(x),
        .clk(clk),
        .clr(clr),
        .out(out)
    )

    initial begin
        clk = 0;
        forever #5 clk=~clk
    end


    initial
        clr = 0;
        #10 clr = 1;
        #10 x = 0;
        #10 x = 0;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;

        if (out == 1)
            $display("1101 found %t", $time)
        else 
            $display("wrong %t", $time)

        $finish
    end
endmodule

