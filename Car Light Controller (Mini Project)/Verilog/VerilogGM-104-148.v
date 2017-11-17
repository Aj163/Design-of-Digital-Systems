/*  CAR LIGHT CONTROLLER
	REG NO :			16CO104
						16CO148

	ABSTRACT :			This mini-project is a car light controller which controls all the interior and exterior lights of the car based on the inputs
						at the various switches. The main switch , door switches and the key switch are responsible for the output of the interior light.
						The exterior lights can be controlled using the select lines of the multiplexers.

	FUNCTIONALITIES :	The interior light has the following functionalities :-
							ON
							OFF
							DOOR

						The exterior light has the following functionalities :-
							OFF
							LEFT INDICATOR
							RIGHT INDICATOR
							BREAKDOWN INDICATOR	

	DESCRIPTION OF CODE :	A demux and a mux is first implemented using gate modelling. Then these are instantiated in the main module to
							operate the internal and the external lights.



*/



module demux_1x4 (
	output [3:0] out,		// demux output
	input in, 				// demux input
	input [0:1] select 		// select lines
);
	wire [0:1] select_;		// complement of select lines

	not n1(select_[0], select[0]);
	not n2(select_[1], select[1]);

	and a1(out[0], in, select_[0], select_[1]);
	and a2(out[1], in, select_[0], select[1]);
	and a3(out[2], in, select[0], select_[1]);
	and a4(out[3], in, select[0], select[1]);

endmodule


module mux_4x1 (
	output out,				// mux output
	input [3:0] in, 		// mux input
	input [0:1] select 		// mux select lines
);
	wire [3:0] temp;		// temporary variable
	wire [0:1] select_;		// complement of select lines

	not n1(select_[0], select[0]);
	not n2(select_[1], select[1]);

	and a1(temp[0], in[0], select_[0], select_[1]);
	and a2(temp[1], in[1], select_[0], select[1]);
	and a3(temp[2], in[2], select[0], select_[1]);
	and a4(temp[3], in[3], select[0], select[1]);

	or r1(out, temp[0], temp[1], temp[2], temp[3]);

endmodule


module internal_lights (
	output light,			// internal light
	input key, 				// key switches
	input [0:3] door,		// door switches
	input [0:1] select 		// main switch
);

	wire [3:0]mux_in;

	or r(mux_in[1], door[0], door[1], door[2], door[3], key);

	not n1(mux_in[0], 0);
	not n2(mux_in[2], 1);
	not n3(mux_in[3], 1);

	mux_4x1 mux(light, mux_in, select);

endmodule


module external_lights (
	output light_left,		// left indicator
	output light_right,		// right indicator
	input [0:1] select,		// controls
	input clk				// clock pulse
);

	wire [3:0] temp;
	wire [3:0] mux_in1;
	wire [3:0] mux_in2;
	wire t1, t2;

	demux_1x4 demux(temp, 1, select);

	//MUX1
	not n1(mux_in1[0], temp[0]);
	not n2(mux_in1[1], temp[1]);

	or r1(mux_in1[2], 0, temp[2]);
	or r2(mux_in1[3], 0, temp[3]);

	//MUX2
	not n3(mux_in2[0], temp[0]);
	not n4(mux_in2[2], temp[2]);

	or r3(mux_in2[1], 0, temp[1]);
	or r4(mux_in2[3], 0, temp[3]);

	//External Lights
	mux_4x1 mux1(t1, mux_in1, select);
	mux_4x1 mux2(t2, mux_in2, select);

	and a1(light_left, clk, t1);
	and a2(light_right, clk, t2);

endmodule


module VerilogGM_104_148(
	output light,				// internal light
	input key, 					// key switche
	input [0:3] door,			// door switches
	input [0:1] select_int,		// main switch

	output light_left,			// left indicator
	output light_right,			// right indicator
	input [0:1] select_ext,		// controls
	input clk 					// clock pulse
);

	internal_lights int_light(light, key, door, select_int);
	external_lights ext_light(light_left, light_right, select_ext, clk);

endmodule