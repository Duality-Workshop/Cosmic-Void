//STEP---------------------------------------
if(argument0==step)
{
	//This code will be executed during the step event.
	if(state_new)
	{
		has_attacked = false;
		has_hit = false;
		has_landed = false;
	}
	
	windup = state_timer < attack_windup_time;
	
	if (not windup and not has_attacked) {
	    has_attacked = true;
		horizontal_speed = attack_speed;
		vertical_speed = jump_strength * -.5; // only need half
		
		target_direction = point_direction(x, y-sprite_height/2, target_x, target_y);
		target_side = IsBetween(target_direction, 90, 270) ? -1 : 1;
	}
	
	if (has_attacked and not has_landed) {
		
		if (not has_hit and place_meeting(x, y, obj_ap_feryuu)) {
		    has_hit = true;
			Damage(obj_ap_feryuu, strength);
		}
		
		var next_position_x = horizontal_speed * target_side;
		var next_position_y = vertical_speed;
		
		while (place_meeting(x+next_position_x, y+next_position_y, _solid_parent)) {
			next_position_x = Approach(next_position_x, 0, 1);
			next_position_y = Approach(next_position_y, 0, 1);
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
	
	//STAND
	if (has_landed) {
		ds_list_delete(oOkaimuTracker.attack_list, ds_list_find_index(oOkaimuTracker.attack_list, id));
	    truestate_switch(EnemyStates.STAND);
	}
	
	//HIT
	if (is_hit) {
		truestate_switch(EnemyStates.HIT);
	}
	
	//DIE
	if(hp <= 0)
	{
		ds_list_delete(oOkaimuTracker.attack_list, ds_list_find_index(oOkaimuTracker.attack_list, id));
		truestate_switch(EnemyStates.DIE);	
	}
}
//DRAW---------------------------------------
else if(argument0==draw)
{
	//And this code will be executed during the draw event.
	if(state_new)
	{
		sprite_index=sOkaimu;
		image_speed = 1;
	}
	
	if (windup)
	{
	    shader_set(shWhite);
		draw_self_facing();
		shader_reset();
	} else if (has_attacked) {
		shader_set(shRed);
		draw_self_facing();
		shader_reset();
	} else {
		draw_self_facing();
	}
}