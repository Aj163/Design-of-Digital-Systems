`timescale 1ns/1ps

module Output;

	reg [0:3] a;
	reg [0:3] b;
	wire [0:4] o;

	look_ahead_adder x(o, a, b);
	
	initial
	begin
			
		$dumpfile("16CO104-V1.vcd");
		$dumpvars(0, Output);

		a = 4'b0000;
		b = 4'b0000;
	
		#100;

		a = 4'b0101;
		b = 4'b1001;

		#100;

		a = 4'b0110;
		b = 4'b1011;

		#100;

		a = 4'b1111;
		b = 4'b1111;

		#100;

	end	
	initial #400 $finish;
	/*initial
	begin
		$monitor("A = %b, B = %b, Sum = %b", a, b, o);
	end*/
endmodule
