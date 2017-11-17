module segment_7_display(in, a, b, c, d, e, f, g);

	input [3:0]in;
	output reg a, b, c, d, e, f, g;

	always @(*)
	begin
		if(in==1 || in==2 || in==3 || in==7)
			a=0;
		else
			a=1;	
			
		if(in==1 || in==4)
			b=0;
		else
			b=1;
			
		if(in==5 || in==6)
			c=0;
		else
			c=1;
			
		if(in==2)
			d=0;
		else
			d=1;
		
		if(in==1 || in==4 || in==7)
			e=0;
		else
			e=1;
		
		if(in==0 || in==2 || in==6 || in==8)
			f=1;
		else
			f=0;
		
		if(in==1 || in==0 || in==7)
			g=0;
		else
			g=1;
	end
endmodule
