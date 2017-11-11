module jk_ff(
	input clk,
	output reg q, 
	output reg q_,
	input j, 
	input k,
	input rst
);
	reg t1, t2;
	always @(posedge clk)
	begin
		if(rst==0)
		begin
			q = 0;
			q_ = 1;
		end

		if(j==1 && k==0)
		begin
			q = 1;
			q_ = 0;
		end

		else if(j==0 && k==1)
		begin
			q = 0;
			q_ = 1;
		end
	end

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