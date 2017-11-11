module segment_7_display(in, a, b, c, d, e, f, g);

	input [3:0]in;
	output a, b, c, d, e, f, g;
	wire a3, a2, a1, a0, a3_, a2_, a1_, a0_;
	wire t1, t2, t3, t4, t5, t6, t7, t8, t9;
	wire p,q,r,s,t,w1,w2,w3,w4;

	or(a3, in[3], 0);
	or(a2, in[2], 0);
	or(a1, in[1], 0);
	or(a0, in[0], 0);
	
	not(a0_, in[0]);
	not(a1_, in[1]);
	not(a2_, in[2]);
	not(a3_, in[3]);
	
	and(t1, a0_, a1_);
	or(t2, a1_, a0_);
	and(t3, a2, t2);
	or(a, a3, t3, t1);
	
	and(t4, a2_, a0_);
	and(t5, a2, a0);
	or(b, t4, t5, a3, a1);
	
	and(p,a1,a0_);
	and(q,a1,a2_);
	and(r,a0_,a2_);
	and(s,a0,a2,a1_);
	or(e,p,q,r,s,a3);


	or(f,p,r);

	xor(t,a1, a2);
	or(g,a3,p,t);

	or(d,a3,a2,a1_,a0);

	and(w1,a1,a0);
	and(w2,a1_,a0_);
	and(w3,a3_,a2_);
	or(c,a3,w1,w2,w3);
	
endmodule
