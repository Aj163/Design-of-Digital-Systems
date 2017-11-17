module carry_prop(P, G, A, B);
	input A, B;
	output P, G;
	xor x1(P, A, B);
	and x2(G, A, B);
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

	or x1(c1, g0, 0);
	
	and x2(t1, p1, g0);
	or x3(c2, g1, t1);

	and x4(t1, p2, p1, g0);
	and x5(t2, p2, g1);
	or x6(c3, t2, t1, g2);

	and x7(t1, p3, p2, p1, g0);
	and x8(t2, p3, p2, g1);
	and x9(t3, p3, g2);
	or x10(o[0], t3, t2, t1, g3);

	xor x11(o[4], p0, 0);
	xor x12(o[3], p1, c1);
	xor x13(o[2], p2, c2);
	xor x14(o[1], p3, c3);
	
endmodule
