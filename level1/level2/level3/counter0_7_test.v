module counter0_7_test();

reg clk;
reg clear;
wire out;

counter0_7 dut(clk, clear, out);

initial clk = 0;
always #2 clk = ~clk;

initial begin
    clear = 1;

    #5 clear = 0;

    #50 clear = 1;
    #50 clear = 0; // Caso demorado

    #50 clear = 1;
    #5 clear = 0; // Caso rápido

    #50 clear = 1;
    #5 clear = 0; // Caso rápido

    #50 $finish;
end

initial begin
    $dumpfile("counter0_7.vcd");
    $dumpvars(0, counter0_7_test);
end

endmodule