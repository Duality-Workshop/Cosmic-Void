//STEP---------------------------------------
if(argument0==step)
{
	//This code will be executed during the step event.
	if(state_new)
	{
		has_dashed = false;
	}
	
	vertical_speed = Approach(vertical_speed, weight, 1);
	var next_position = vertical_speed;
	
	while (position_meeting(x, y+next_position, _solid_parent)) {
	    next_position = Approach(next_position, 0, 1);
	}
	
	y += next_position;
	
	
	//LAND
	if (position_meeting(x, y+next_position, _solid_parent)) {
	    truestate_switch(EnemyStates.LAND);
	}
	
	//HIT
	//DIE
	if(hp <= 0)
	{
		truestate_switch(EnemyStates.DIE);	
	}
	/*
	if(conditon)
	{
		truestate_switch(States.State);	
	}
	*/
}
//DRAW---------------------------------------
else if(argument0==draw)
{
	//And this code will be exeucted during the draw event.
	if(state_new)
	{
		sprite_index=sOkaimu;
		image_speed = 1;
	}
	draw_self_facing();
}