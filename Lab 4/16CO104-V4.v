`timescale 1ns/1ps

module tb_parallel_register_4bit;

	reg [3:0] in;
	reg clk;
	output [3:0] out;
	
	parallel_register_4bit pr4bit(in, clk, out);
	
	//Clock
	initial begin
		clk = 1'b1;
		repeat(100)
		#10 clk = ~clk;
	end
	
	initial begin
	
		$dumpfile("16CO104-V4.vcd");
		$dumpvars(0, tb_parallel_register_4bit);
		$monitor("INPUT = %b, OUTPUT = %b", in, out);
		
		in = 4'b0000;
		
		#20;
		in = 4'b0101;
		
		#20;
		in = 4'b0110;
		
		#20;
		in = 4'b1010;
		
		#20;
		in = 4'b1111;
		
		#20 $finish;
	end

endmodule
