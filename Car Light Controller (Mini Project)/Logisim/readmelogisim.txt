################################### CAR LIGHT CONTROLLER ###############################

DDS (CO202) Mini Project
	-Ashwin Joisa (16CO104)
	-Tejas R (16CO148)


##################################### MODULE 1 : Internal Lights

1.	The main switch to control the internal light is constructed using a 4x1 mux.
	The key to be followed to operate the main switch is as follows :
	
	Selector inputs		Functionality
	(MAIN SWITCH)

	00					ON
	01					DOOR
	10					OFF
	11					INVALID(OFF)

	The inputs at the selector pins equal to 11 results in an OFF condition of the
	internal light.

2.	The internal light stays ON if the main switch input is 00 and OFF if the 
	main switch input is 10 , regardless of the inputs at the DOOR switches.

3.	The DOOR switches are activated when the main switch is at the DOOR position 
	( 01 at the selector pins ). Now the output state of the internal light depends on the 
	values of the DOOR switches.

4.	The light is ON if either of the DOOR switch is ON or the KEY switch is ON.


##################################### MODULE 2 : External Lights

1.	The controls to the external lights is given in the form of selector pin inputs to 
	the 4x1 multiplexers.The key to be followed to operate the controls is as follows :

	Selector inputs			Functionality
	(CONTROLS)	

	00						OFF
	01 						Right Indicator
	10 						Left Indicator  
	11						Breakdown Indicator


2.	The CLOCK signal has to be enabled and set to 2 hz frequency before inputs are 
	given to the selector pins.