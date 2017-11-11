module parallel_register_4bit(
	input [3:0] in,
	input clk,
	output [3:0] out
);

	D_FF d1(clk, in[0], out[0]);
	D_FF d2(clk, in[1], out[1]);
	D_FF d3(clk, in[2], out[2]);
	D_FF d4(clk, in[3], out[3]);

endmodule

module D_FF(
	input clk,
	input d,
	output q
);

	assign q = d;

endmodule
