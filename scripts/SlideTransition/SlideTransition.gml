/// @desc SlideTransition(mode, target_room)
/// @arg Mode Sets transition mode between (NEXT, RESTART, and GOTO).
/// @arg Target Sets the target room when using the GOTO mode.

with (oTransition) {
	gui_width = display_get_gui_width();
	gui_height = display_get_gui_height();
	gui_height_half = gui_height * .5;
	mode = argument[0];
	if (argument_count > 1) {
		mode = TRANSITION_MODE.GOTO;
	    target = argument[1];
	}
}