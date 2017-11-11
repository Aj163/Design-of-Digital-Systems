module segment_7_display(in, a, b, c, d, e, f, g);

	input [3:0]in;
	output a, b, c, d, e, f, g;
	wire a3, a2, a1, a0;

	assign
		
		a3 = in[3],
		a2 = in[2],
		a1 = in[1],
		a0 = in[0],
		
		a = (a3 | (a2&(~a1|~a0)) | (~a1|~a0)),
		b = a1 | a3 | (a2&a0) | (~a2|~a0),
		c = a3 | (a1&a0) | (~a1&~a0) | (~a3&~a2),
		d = a3 | a2 | ~a1 | a0,
		e = a3 | (a1&~a0) | (a1&~a2) | (~a2&~a0) | (~a1&a0&a2),
		f = (~a2&~a0) | (a1&~a0),
		g = a3 | (a1&~a0) | (a1^a2);
		
endmodule
