//STEP---------------------------------------
if(argument0==step)
{
	//This code will be executed during the step event.
	var feryuu_x = obj_ap_feryuu.x;
	var feryuu_y = obj_ap_feryuu.y-obj_ap_feryuu.sprite_height/2;
	sight = not collision_line(x, y-sprite_height/2, feryuu_x, feryuu_y, _solid_parent, false, true);
	var distance = distance_to_object(obj_ap_feryuu);
	
	if (sight) {
	    target_x = feryuu_x;
		target_y = feryuu_y;
	}
	
	target_direction = point_direction(x, y-sprite_height/2, target_x, target_y);
	target_side = IsBetween(target_direction, 90, 270) ? -1 : 1;
	
	x += 100000;
	var nearest_similar = instance_nearest(x-100000, y, oOkaimu);
	x -= 100000;
	
	nearest_similar_distance = distance_to_point(nearest_similar.x, nearest_similar.y);
	
	if (nearest_similar_distance < min_self_distance) {
	    var potential_next_x = x + Approach(horizontal_speed, walk_speed, 1) * target_side;
	    var potential_next_y = y;
			show_debug_message("STOP?");
		
		if (point_distance(potential_next_x, potential_next_y, nearest_similar.x, nearest_similar.y) < nearest_similar_distance) {
		    horizontal_speed = 0;
			show_debug_message("STOP");
		}
	}
	
	horizontal_speed = Approach(horizontal_speed, walk_speed, 1);
	
	
	var next_position = horizontal_speed * target_side;
	
	//JUMP
	if ((place_meeting(x+next_position*10, y-1, _solid_parent)
		and not place_meeting(x+next_position, y-33, _solid_parent))
		or
		(not place_meeting(x+next_position*10, y+1, _solid_parent)
		and target_direction < 180))
	{
	    truestate_switch(EnemyStates.JUMP)
	}
	
	while (place_meeting(x+next_position, y-1, _solid_parent)) {
	    next_position = Approach(next_position, 0, 1);
	}
	
	x += next_position;
	
	
	//STAND
	if ((sight and IsBetween(distance, min_distance, max_distance)) or (not sight and IsBetween(x, target_x - 5, target_x + 5))) {
	    truestate_switch(EnemyStates.STAND)
	}
	
	//BACK
	if (sight and distance < min_distance) {
	    truestate_switch(EnemyStates.BACK)
	}
	
	//FALL
	if (not place_meeting(x, y + 1, _solid_parent)) {
	    truestate_switch(EnemyStates.FALL);
	}
	
	//HIT
	if (is_hit) {
		truestate_switch(EnemyStates.HIT);
	}
	
	//DIE
	if(hp <= 0)
	{
		truestate_switch(EnemyStates.DIE);	
	}
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