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

	DESCRIPTION OF CODE :	This is the test bench which provides the stimulus to the main module .
							The door input controls the door switches , key input controls the key switches ,
							select_int controls the main switch and select_ext controls the external light
							controls .



*/





`timescale 1ns/1ps

module Verilog_104_148;

	//Internal Lights
	reg [0:3] door;				// door switches
	reg key;					// key switch
	reg [0:1] select_int;		// main switch
	output internal_light;		// internal light

	//External Lights
	output light_left;			// left indicator
	output light_right;			// right indicator
	reg [0:1] select_ext;		// control
	reg clk;					// clock pulse


	VerilogGM_104_148 car_lights(internal_light, key, door, select_int, 
		light_left, light_right, select_ext, clk);

	//Clock
	initial begin
		clk = 1'b1;
		repeat(100)
		#5 clk = ~clk;
	end

	initial begin

		$dumpfile("VerilogBM-104-148.vcd");
		$dumpvars(0, Verilog_104_148);
		$display("\nDoor\tSelect\t\tKey\tInternal Light\t\tSelect\t\tExternal Left Indicator\t\tExternal Right Indicator\t\n");

		door = 4'b0000;
		key = 0;
		select_int = 2'b00;
		select_ext = 2'b00;

		#40;
		door = 4'b0100;
		key = 0;
		select_int = 2'b01;
		select_ext = 2'b01;

		#40;
		door = 4'b0000;
		key = 0;
		select_int = 2'b01;	
		select_ext = 2'b10;				

		#40;
		door = 4'b0000;
		key = 1;
		select_int = 2'b01;
		select_ext = 2'b00;

		#40;
		door = 4'b0101;
		key = 1;
		select_int = 2'b11;
		select_ext = 2'b11;

		#40 $finish;
	end

	//Monitor Statements
	initial
		$monitor("%b\t%b\t\t%b\t%b\t\t\t%b\t\t%b\t\t\t\t%b", 
			door, select_int, key, internal_light, select_ext, light_left, light_right);


endmodule