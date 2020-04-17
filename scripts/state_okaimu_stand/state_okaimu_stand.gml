//STEP---------------------------------------
if(argument0==step)
{
	//This code will be executed during the step event.
	if(state_new)
	{
		has_dashed = false;
	}
	
	var feryuu_x = obj_ap_feryuu.x;
	var feryuu_y = obj_ap_feryuu.y-obj_ap_feryuu.sprite_height/2;
	sight = not collision_line(x, y-sprite_height/2, feryuu_x, feryuu_y, _solid_parent, false, true);
	var distance = distance_to_object(obj_ap_feryuu);
	
	if (sight) {
	    target_x = feryuu_x;
		target_y = feryuu_y;
	}
	
	horizontal_speed = Approach(horizontal_speed, 0, 1);
	
	//IDLE
	if (state_timer > idle_time) {
	    truestate_switch(EnemyStates.IDLE);
	}
	
	//APPROACH
	if (sight and distance > max_distance) {
	    truestate_switch(EnemyStates.APPROACH)
	}
	
	//BACK
	if (sight and distance < min_distance) {
	    truestate_switch(EnemyStates.BACK)
	}
	
	//JUMP
	// condition?
	
	//FALL
	if (not position_meeting(x, y + 1, _solid_parent)) {
	    truestate_switch(EnemyStates.FALL);
	}
	
	//ATTACK
	if (sight and IsBetween(distance, min_distance, max_distance) and state_timer > attack_time) {
	    truestate_switch(EnemyStates.ATTACK);
	}
	
	//FLEE
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