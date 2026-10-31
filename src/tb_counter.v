module tb_counter;

reg clk, reset, dir;
wire [3:0] q;

counter uut(clk, reset, dir, q);

always #5 clk = ~clk;

initial
begin
    $dumpfile("counter.vcd");
    $dumpvars(0, tb_counter);

    clk = 0;
    reset = 1;
    dir = 1;

    $display("Time\tDir\tCount");
    $monitor("%0t\t%b\t%h", $time, dir, q);

    #10 reset = 0;

    #150 dir = 0;

    #150 $finish;
end

endmodule