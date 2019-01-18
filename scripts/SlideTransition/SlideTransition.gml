/// @desc SlideTransition(mode, target_room)
/// @arg Mode Sets transition mode between (NEXT, RESTART, and GOTO).
/// @arg Target Sets the target room when using the GOTO mode.

with (oTransition) {
	mode = argument[0];
	if (argument_count > 1) {
		mode = TRANSITION_MODE.GOTO;
	    target = argument[1];
	}
}