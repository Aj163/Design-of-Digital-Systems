
module jk_ff(
	input clk,
	output q, 
	output q_,
	input k, 
	input j,
	input rst
);
	
	wire t1, t2, t3, t4, t5, t6, _rst;
	not n(_rst, rst);

	and a1(t1, j, clk);
	and a2(t2, k, clk);

	nor n1(q, q_, t1, _rst);
	nor n2(q_, q, t2);

endmodule 

module sr_flip_flop(
	input clk,
	output q, 
	output q_,
	input s, 
	input r,
	input rst
);
	
	jk_ff jk(clk, q, q_, s, r, rst);

endmodule 