//STEP---------------------------------------
if(argument0==step)
{
	//show_debug_message(y - my_yprevious);
	
	if (y < my_yprevious) {
	    ap_move_player(.35,0,2);
		//show_debug_message("fall UP");
	}
	else {
	    ap_move_player(.35,0,1);
		//show_debug_message(string(current_time) + " fall DOWN");
	}
	//show_debug_message(y - my_yprevious);
	
	// DASH
	if((jump[pressed] or dash[pressed]) and !has_dashed)
	{
		truestate_switch(States.dash);
	}
	
	// HIGH FALL
	// LAND
	
	if(against_wall[bottom_wall])
	{
		if (hspd != 0) {
			big_dust(3,3);
		    truestate_switch(States.run);
		} else {
			truestate_switch(States.land);
		}
	}
	
	// SHOOT
	// STRIKE
	// WALL SLIDE
	var moving_direction = (right[held] - left[held]);
	if (moving_direction != 0)
	{
		var side = moving_direction == -1 ? left_wall : right_wall;
		if(against_wall[side])
		{
			state_var[0]=against_wall[0];
			truestate_switch(States.wall_slide);	
		}
	}
	
	// WALL JUMP
	if ((against_wall[left_wall] or against_wall[right_wall]) and jump[pressed]) {
	    truestate_switch(States.wall_jump);
	}
	
	// LEDGE GRAB
	// HIT
	// DIE
	// HOVER
}
//DRAW---------------------------------------
else if(argument0 == draw)
{
	sprite_index=sFeryuuJump;
	image_index = yprevious < y ? 1 : 0;
	image_speed = 0;
	
	draw_self_facing();
}