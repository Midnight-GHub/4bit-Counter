module counter(input clk, reset, dir, output [3:0] q);

wire [3:0] t;

assign t[0] = 1'b1;
assign t[1] = dir ? q[0] : ~q[0];
assign t[2] = dir ? (q[1] & q[0]) : (~q[1] & ~q[0]);
assign t[3] = dir ? (q[2] & q[1] & q[0]) : (~q[2] & ~q[1] & ~q[0]);

t_ff f1(clk, reset, t[0], q[0]);
t_ff f2(clk, reset, t[1], q[1]);
t_ff f3(clk, reset, t[2], q[2]);
t_ff f4(clk, reset, t[3], q[3]);

endmodule