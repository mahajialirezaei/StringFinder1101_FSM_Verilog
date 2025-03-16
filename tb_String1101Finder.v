module tb_String1101Finder;

    reg x;
    reg clk;
    reg clr;
    wire out;


    String1101Finder dut (
        .x(x),
        .clk(clk),
        .clr(clr),
        .out(out)
    );

    initial begin
        x = 0;
        clk = 0;
        forever #5 clk = ~clk;
    end


    initial begin

        clr = 0; 
        #10 clr = 1;


        x = 0; #10;
        x = 0; #10;
        x = 1; #10;
        x = 0; #10;
        x = 1; #10;
        x = 1; #10;
        x = 0; #10;
        x = 1; #10;


        if (out == 1)
            $display("1101 found at time %t", $time);
        else 
            $display("wrong at time %t", $time);


        $finish;
    end

endmodule
