`timescale 1ns/1ps

module test_bench;

	reg clk;
	wire q;
	wire q_;
	reg s; 
	reg r;
	reg rst;

	sr_flip_flop  srff(clk, q, q_, s, r, rst);

	// Clock Signal
	initial begin

		clk = 1'b1;
		repeat(100)
		#10 clk = ~clk;

	end

	initial begin

		$dumpfile("16CO104-V3.vcd");
		$dumpvars(0, test_bench);

		rst = 1'b0;
		s = 1'b0;
		r = 1'b0;

		#20;
		rst = 1'b1;
		s = 1'b1;
		r = 1'b0;

		#20;
		s = 1'b0;
		r = 1'b1;

		#20;
		rst = 1'b1;
		s = 1'b1;
		r = 1'b0;
		
		#20;
		s = 1'b0;
		r = 1'b0; 

		#20 $finish;
	end

	initial
		$monitor("S = %b, R = %b, Q = %b, Q' = %b", s, r, q, q_);

endmodule