//STEP---------------------------------------
if(argument0==step)
{
	if(state_new)
	{
		state_var[1] = undefined;	// Starting height
		state_var[2] = false;		// Is jumping?
		state_var[3] = 0;			// Jump speed
		if(vspd == 0)
		{
			state_var[0]=0; // How many frames before we actually jump	
		}
		else
		{
			state_var[0]=0;	
			grace_frames=5;
		}
	}
	
	if(state_timer < state_var[0])
	{
		ap_move_player(1,false,1);	
	}
	else
	{
		if(state_var[1] == undefined or grace_frames > 0)
		{	//Start the jump, even if we are no longer on the ground.
			state_var[1] = y;
			if(vspd >= 0)
			{
				state_var[2] = true; // is jumping, now
				state_var[3] = jump_speed;
				state_var[4] = false; // has not yet reached jump speed
			}
		}
		else
		{
		
			ap_move_player(.35,0,1);
		
			// DASH
			if((jump[pressed] or dash[pressed]) and !has_dashed)
			{
				truestate_switch(States.dash);
			}
	
			// FALL
			if(yprevious < y or !jump[held])
			{ //Fallen past max height, move to fall;
				truestate_switch(States.fall);
			}
			
			// SHOOT
			// STRIKE
			// LEDGE GRAB
			// HIT
			// DIE
			// HOVER
		
			// WALL SLIDE
			var moving_direction = (right[held] - left[held]);
			if (moving_direction != 0)
			{
				var side = moving_direction == -1 ? left_wall : right_wall;
				if(state_timer > 10 and against_wall[side] and !against_wall[bottom_wall])
				{
					state_var[0]=against_wall[0];
					truestate_switch(States.wall_slide);	
				}
			}
		}
	}
}
//DRAW---------------------------------------
else if(argument0==draw)
{
	sprite_index=sFeryuuJump;
	image_index = 0;
	image_speed = 0;
	
	draw_self_facing();
}