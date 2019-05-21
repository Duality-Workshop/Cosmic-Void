//STEP---------------------------------------
if(argument0==step)
{
	
	var moving_direction = (right[held] - left[held]);
	
	//This code will be executed during the step event.
	if (state_new) {
		big_dust(3,3);
		has_dashed = true;
		var dash_direction = get_directions();
		hspd = dash_direction[0] > 0 ? max(hspd, dash_speed * dash_direction[0]) : min(hspd, dash_speed * dash_direction[0]);
		vspd = dash_direction[1] > 0 ? max(vspd, dash_speed * dash_direction[1]) : min(vspd, dash_speed * dash_direction[1]);
		state_var[0] = against_wall[bottom_wall]; // is it a ground dash
		state_var[1] = false; // is dashing against wall?
		state_var[2] = point_direction(0, 0, dash_direction[0], dash_direction[1]) + 180; // particles direction
	}
	ap_move_player(.35,0,1);
	
	//Adjusting Emitter positions. Starting Emitter Streams or Bursts.
	var xp, yp;
	xp = x;
	yp = y - sprite_height / 2;
	
	part_type_direction(global.pt_Thruster, state_var[2] - 25, state_var[2] + 25, 0, 0);
	part_emitter_region(global.ps, global.pe_Thruster, xp-5, xp+5, yp-5, yp+5, ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(global.ps, global.pe_Thruster, global.pt_Thruster, 1);
	
	if (moving_direction != 0) {
	    var wall_direction = (moving_direction < 0) ? left_wall : right_wall;
		state_var[1] = against_wall[wall_direction];
	}
	
	// JUMP
	if(jump[pressed] and against_wall[bottom_wall])
	{
		truestate_switch(States.jump);
	}
	
	if (abs(hspd) <= move_max_speed and state_timer > 15) {
	    // FALL
		if(yprevious < y)
		{ //Fallen past max height, move to fall;
			truestate_switch(States.fall);
		}
	
		// LAND
		if (hspd == 0 and against_wall[bottom_wall]) {
		    truestate_switch(States.land);
		}
		
		// SPRINT & RUN
		if (hspd != 0 and against_wall[bottom_wall]) {
		    if (dash[held]) {
			    truestate_switch(States.sprint);
			}
			else {
			    truestate_switch(States.run);
			}
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