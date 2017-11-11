module siso_register_4bit(
	input in,
	input clk,
	output [0:3] out,
	input rst
);

	D_FF d1(clk, in, out[0], rst);
	D_FF d2(clk, out[0], out[1], rst);
	D_FF d3(clk, out[1], out[2], rst);
	D_FF d4(clk, out[2], out[3], rst);

endmodule


module D_FF(
	input clk,
	input d,
	output reg q,
	input rst
);

	always @(posedge clk) begin
		if(rst)
			q = 0;
		else
			q = d;
	end

endmodule