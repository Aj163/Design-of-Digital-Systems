`timescale 1ns/1ps

module tb_siso_register_4bit;

	reg in;
	reg clk;
	output [3:0] out;
	reg rst;
	
	siso_register_4bit siso4bit(in, clk, out, rst);
	
	//Clock
	initial begin
		clk = 1'b1;
		repeat(100)
		#10 clk = ~clk;
	end
	
	initial begin
	
		$dumpfile("16CO104-V5.vcd");
		$dumpvars(0, tb_siso_register_4bit);
		$monitor("INPUT = %b, OUTPUT = %b", in, out);
		
		in = 1'b0;
		rst = 1'b1;
		
		#20;
		rst = 1'b0;
		in = 1'b1;
		
		#20;
		in = 1'b0;
		
		#20;
		in = 1'b1;
		
		#20;
		in = 1'b0;

		#20;
		in = 1'b0;

		#20;
		in = 1'b1;
		
		#20 $finish;
	end

endmodule
