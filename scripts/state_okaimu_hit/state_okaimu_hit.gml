//STEP---------------------------------------
if(argument0==step)
{
	//This code will be executed during the step event.
	if(state_new)
	{
		is_hit = false;
		horizontal_speed = lengthdir_x(10, hit_direction);
		vertical_speed = lengthdir_y(10, hit_direction);
		has_landed = false;
		
		var pos = ds_list_find_index(oOkaimuTracker.attack_list, id);
		if (pos != -1) {
			ds_list_delete(oOkaimuTracker.attack_list, pos);
		}
	}
	
	
	
	if (not has_landed) {
		
		var next_position_x = horizontal_speed;
		var next_position_y = vertical_speed;
		
		while (place_meeting(x+next_position_x, y+next_position_y, _solid_parent)) {
			next_position_x = Approach(next_position_x, 0, 1);
			next_position_y = Approach(next_position_y, -1, 1);
		}
	
		x += next_position_x;
		y += next_position_y;
			
		if (next_position_y > 0) { // going up	
			vertical_speed--;
		}
		else { // going down
			vertical_speed += 2;
		}
		
		if (place_meeting(x, y+1, _solid_parent)) {
			has_landed = true;
		}
	}
	
	if (state_timer > 60) {
	    truestate_switch(EnemyStates.STAND);
	}
	
	
	if (is_hit) {
		truestate_reset_current_state();
	}
	
	
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
	
	shader_set(shRed);
	draw_self_facing();
	shader_reset();
}