//STEP---------------------------------------
if(argument0==step)
{
	//This code will be executed during the step event.
	if (state_new) {
	    var wall_direction = against_wall[left_wall] ? 1 : -1; // Which direction to jump
		hspd = wall_jump_magnitude_h * wall_direction;
		vspd = wall_jump_magnitude_v;
	}
	ap_move_player(.35,0,1);
	face_direction = sign(hspd);
	
	// DASH
	// FALL
	if(yprevious < y or !jump[held])
	{ //Fallen past max height, move to fall;
		truestate_switch(States.fall);
	}
			
	// SHOOT
	// STRIKE
	// WALL SLIDE
	if ((right[held] - left[held]) != 0)
	{
		var side = hspd < 0 ? left_wall : right_wall;
		if(against_wall[side])
		{
			state_var[0]=against_wall[0];
			truestate_switch(States.wall_slide);	
		}
	}
	
	// LEDGE GRAB
	// HIT
	// DIE
	// HOVER
}
//DRAW---------------------------------------
else if(argument0==draw)
{
	//And this code will be exeucted during the draw event.
	sprite_index=sFeryuuJump;
	image_index = 0;
	image_speed = 0;
	
	draw_self_facing();
}