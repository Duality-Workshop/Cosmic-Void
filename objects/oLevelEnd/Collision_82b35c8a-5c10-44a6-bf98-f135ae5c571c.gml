with(oPlayer) var l33EEFAF6_0 = has_control == true;
if(l33EEFAF6_0)
{
	with(oPlayer) {
	has_control = false;
	
	}
	
	if (variable_instance_exists(id, "target")) {
		SlideTransition(TRANSITION_MODE.GOTO, target);
	} else {
		SlideTransition(TRANSITION_MODE.NEXT);
	}
}