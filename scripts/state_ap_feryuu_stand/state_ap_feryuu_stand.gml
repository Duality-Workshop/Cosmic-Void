//STEP---------------------------------------
if(argument0==step)
{
	//This code will be executed during the step event.
	if(state_new)
	{
		has_dashed = false;
	}
	ap_move_player(1,0,1);
	
	// IDLE
	// JUMP
	if(jump[pressed])
	{
		truestate_switch(States.jump);	
	}
	
	// DASH
	// FALL
	if(!against_wall[bottom_wall])
	{	//Walked off a ledge
		truestate_switch(States.fall);
	}
	
	// RUN
	if(left[held] or right[held])
	{
		truestate_switch(States.run);	
	}
	
	// SHOOT
	// STRIKE
	if (strike[pressed]) {
	    truestate_switch(States.strike);
	}
	
	// HIT
	// DIE
	// RC
	// CHALK
}
//DRAW---------------------------------------
else if(argument0==draw)
{
	//And this code will be exeucted during the draw event.
	if(state_new)
	{
		sprite_index=sFeryuu;
		image_speed = 1;
	}
}