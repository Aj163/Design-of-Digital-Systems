`timescale 1ns/1ps

module test;

	reg [3:0]in;
	wire a, b, c, d, e, f, g;
	
	segment_7_display segment_7(in, a, b, c, d, e, f, g);
	
	initial begin
		$dumpfile("16CO104-V2.vcd");
		$dumpvars(0, test);
		
		in=4'b0000;
		#10 in=4'b0001;
		#10 in=4'b0010;
		#10 in=4'b0011;
		#10 in=4'b0100;
		#10 in=4'b0101;
		#10 in=4'b0110;
		#10 in=4'b0111;
		#10 in=4'b1000;
		#10 in=4'b1001;
		
	end
	
	initial
		$monitor("INPUT = %b, a=%b, b=%b, c=%b, d=%b, e=%b, f=%b, g=%b", in, a, b, c, d, e, f, g);
	
	initial #100 $finish;

endmodule
