//STEP---------------------------------------
if(argument0==step)
{
	
	var moving_direction = (right[held] - left[held]);
	
	//This code will be executed during the step event.
	if (state_new) {
		big_dust(3,3);
		has_dashed = true;
		var dash_direction = get_directions();
		hspd = dash_speed * dash_direction[0];
		vspd = dash_speed * dash_direction[1];
		state_var[0] = against_wall[bottom_wall]; // is it a ground dash
		state_var[1] = false; // is dashing against wall?
	}
	ap_move_player(.35,0,1);
	
	if (moving_direction != 0) {
	    var wall_direction = (moving_direction == -1) ? left_wall : right_wall;
		state_var[1] = against_wall[wall_direction];
	}
	
	// JUMP
	if(jump[pressed] and against_wall[bottom_wall])
	{
		truestate_switch(States.jump);
	}
	
	if (abs(hspd) <= move_max_speed) {
	    // FALL
		if(yprevious < y)
		{ //Fallen past max height, move to fall;
			truestate_switch(States.fall);
		}
	
		// LAND
		if (hspd == 0 and against_wall[bottom_wall]) {
		    truestate_switch(States.land);
		}
		
		// RUN
		if (hspd != 0 and against_wall[bottom_wall]) {
		    truestate_switch(States.run);
		}
	}
	
	// SLIDE
	// STRIKE
	// WALL SLIDE
	if ((right[held] - left[held]) != 0)
	{
		var side = hspd < 0 ? left_wall : right_wall;
		if(against_wall[side] and !against_wall[bottom_wall])
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
	if(hspd != 0)
		face_direction = sign(hspd);
			
	if (against_wall[bottom_wall]) {
	    sprite_index=sFeryuuRun;
	
		
		//Change image speed based on hspd
		image_speed = easy_tween(TweenType.out_quint,0,1,abs(hspd)/move_max_speed);	
	
		if(state_var[0] and state_var[1]) {
			image_speed=1;
			sprite_index=sFeryuu;	
		}
	} else {
		sprite_index = sFeryuuJump
		image_speed = 0;
		image_index = 0;
	}
	
	draw_self_facing();
}