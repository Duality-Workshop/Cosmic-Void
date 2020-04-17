//STEP---------------------------------------
if(argument0==step)
{
	//This code will be executed during the step event.
	
	var next_position_x = horizontal_speed * target_side;
	var next_position_y = vertical_speed;
	
	while (place_meeting(x+next_position_x, y, _solid_parent)) {
	    next_position_x = Approach(next_position_x, 0, 1);
	}
	
	while (place_meeting(x+next_position_x, y+next_position_y, _solid_parent)) {
	    next_position_y = Approach(next_position_y, 0, 1);
	}
	
	x += next_position_x;
	y += next_position_y;
	
	vertical_speed++;
	
	
	//LAND
	if (place_meeting(x, y+1, _solid_parent)) {
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