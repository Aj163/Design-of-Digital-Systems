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

	DESCRIPTION OF CODE :	This dataflow modelling makes a demux and a mux and uses them to control the outputs of the internal and the external lights.



*/



module demux_1x4 (
	output [3:0] out,		// demux output
	input in, 				// demux input
	input [0:1] select 		// select lines
);
	output [0:1] select_; 	// complement of select lines

	assign
		select_[0] = ~select[0],
		select_[1] = ~select[1],

		out[0] = in & select_[0] & select_[1],
		out[1] = in & select_[0] & select[1],
		out[2] = in & select[0] & select_[1],
		out[3] = in & select[0] & select[1];

endmodule


module mux_4x1 (
	output out,				// mux output
	input [3:0] in, 		// mux input 
	input [0:1] select 		// select lines
);
	output [3:0] temp; 		// temporary variable
	output [0:1] select_; 	// complement of select lines

	assign
		select_[0] = ~select[0],
		select_[1] = ~select[1],

		temp[0] = in[0] & select_[0] & select_[1],
		temp[1] = in[1] & select_[0] & select[1],
		temp[2] = in[2] & select[0] & select_[1],
		temp[3] = in[3] & select[0] & select[1],

		out = temp[0] | temp[1] | temp[2] | temp[3]; 

endmodule


module internal_lights (
	output light, 			// internal light
	input key, 				// key switch
	input [0:3] door,		// door switches
	input [0:1] select 		// select lines
);

	output [3:0]mux_in;

	assign
		mux_in[1] = door[0] | door[1] | door[2] | door[3] | key,

		mux_in[0] = 1,
		mux_in[2] = 0,
		mux_in[3] = 0;

	mux_4x1 mux(light, mux_in, select);

endmodule


module external_lights (
	output light_left,		//left indicator
	output light_right,		//right indicator
	input [0:1] select,		//select lines
	input clk				//clock pulse
);

	output [3:0] temp;
	output [3:0] mux_in1;
	output [3:0] mux_in2;
	output t1, t2;

	demux_1x4 demux(temp, 1, select);

	//MUX1
	assign
		mux_in1[0] = ~temp[0],
		mux_in1[1] = ~temp[1],

		mux_in1[2] = temp[2],
		mux_in1[3] = temp[3];

	//MUX2
	assign
		mux_in2[0] = ~temp[0],
		mux_in2[2] = ~temp[2],

		mux_in2[1] = temp[1],
		mux_in2[3] = temp[3];

	//External Lights
	mux_4x1 mux1(t1, mux_in1, select);
	mux_4x1 mux2(t2, mux_in2, select);

	assign
		light_left = clk & t1,
		light_right = clk & t2;

endmodule


module VerilogGM_104_148(
	output light,				// internal light
	input key, 					// key switches
	input [0:3] door,			// door switches
	input [0:1] select_int,		// select lines

	output light_left,			// left indicator
	output light_right,			// right indicator
	input [0:1] select_ext,		// controls
	input clk 					// clock pulse
);

	internal_lights int_light(light, key, door, select_int);
	external_lights ext_light(light_left, light_right, select_ext, clk);

endmodule