module jk_ff(
	input clk,
	output q, 
	output q_,
	input k, 
	input j,
	input rst
);
	assign q_ = ~(q|k);
	assign q = ~(q_|j|(~rst));

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