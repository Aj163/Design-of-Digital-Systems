module carry_prop(P, G, A, B);
	input A, B;
	output P, G;
	
	assign
		P = A^B,
		G = A&B;
endmodule


module look_ahead_adder(o, a, b);
	input [0:3] a;
	input [0:3] b;
	output [0:4] o;

	wire t1, t2, t3, t4, t5, c1, c2, c3;
	wire p0, p1, p2, p3, g0, g1, g2, g3;

	carry_prop x15(p0, g0, a[3], b[3]);
	carry_prop x16(p1, g1, a[2], b[2]);
	carry_prop x17(p2, g2, a[1], b[1]);
	carry_prop x18(p3, g3, a[0], b[0]);	

	assign
		c1 = g0,
	
		t1 = p1 & g0,
		c2 = g1 | t1,

		t1 = p2 & p1 & g0,
		t2 = p2 & g1,
		c3 = t2 | t1 | g2,

		t1 = p3 & p2 & p1 & g0,
		t2 = p3 & p2 & g1,
		t3 = p3 & g2,
		o[0] = t3 | t2 | t1 | g3,

		o[4] = p0,
		o[3] = p1 ^ c1,
		o[2] = p2 ^ c2,
		o[1] = p3 ^ c3;
	
endmodule
