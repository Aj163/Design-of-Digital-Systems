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

	DESCRIPTION OF CODE :	This is the behavioral modelling of the main module which further consists of the internal and the external lights .
							



*/







module internal_lights (
	output reg light,		// internal light
	input key, 				// key switch
	input [0:3] door,		// door switches
	input [0:1] select  	// main switch
);

	
	always @(*)
	begin
		if(select == 0)
			light = 1;

		else if(select == 1)
		begin
			if(door>0 || key>0)
				light = 1;
			else
				light = 0;
		end

		else
			light = 0;
	end

endmodule


module external_lights (
	output reg light_left,		// left indicator
	output reg light_right,		// right indicator
	input [0:1] select,			// controls
	input clk					// clock pulse
);

	always @(*)
	begin
		if(select == 0)
		begin
			light_left = 0;
			light_right = 0;
		end

		else if(select == 1)
		begin
			light_left = 0;
			light_right = clk;
		end

		else if(select == 2)
		begin
			light_left = clk;
			light_right = 0;
		end

		else
		begin
			light_left = clk;
			light_right = clk;
		end
	end

endmodule


module VerilogGM_104_148(
	output light,				//internal light
	input key, 					//key switch
	input [0:3] door,			//door switches
	input [0:1] select_int,		//main switch

	output light_left,			//left indicator
	output light_right,			//right indicator
	input [0:1] select_ext,		//controls
	input clk 					//clock pulse
);

	internal_lights int_light(light, key, door, select_int);
	external_lights ext_light(light_left, light_right, select_ext, clk);

endmodule