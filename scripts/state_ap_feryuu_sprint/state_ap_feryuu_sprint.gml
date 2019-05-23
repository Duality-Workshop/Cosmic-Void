//STEP---------------------------------------
if(argument0==step)
{
	//This code will be executed during the step event.
	if(state_new)
	{
		state_var[0]=false; // Draw idle pose.
		state_var[1]=false; // is running against wall?
		has_dashed = false;
	}
	
	ap_move_player(1,0,1);
	
	var moving_direction = (right[held] - left[held]);
	hspd = dash_speed * moving_direction;
	if (moving_direction != 0) { // are we moving into a wall?
	    var wall_direction = (moving_direction < 0) ? left_wall : right_wall;
		state_var[1] = against_wall[wall_direction];
	}
	
	//Adjusting Emitter positions. Starting Emitter Streams or Bursts.
	var xp, yp;
	xp = x;
	yp = y - sprite_height / 2;
	var pd = moving_direction == -1 ? 0 : 180; // Particle Direction
	
	part_type_direction(global.pt_Thruster, pd - 25, pd + 25, 0, 0);
	part_emitter_region(global.ps, global.pe_Thruster, xp-5, xp+5, yp-5, yp+5, ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(global.ps, global.pe_Thruster, global.pt_Thruster, 1);
	
	
	
	// STAND
	if(hspd == 0 and !(left[held] or right[held]))
	{
		truestate_switch(States.stand);
		state_var[0]=true;
		exit;
	}
		
	// RUN
	if(!dash[held])
	{
		truestate_switch(States.run);
	}
		
	// JUMP
	if(jump[pressed])
	{
		truestate_switch(States.jump);	
	}
	
	// FALL
	if(!against_wall[bottom_wall])
	{	//Walked off a ledge
		truestate_switch(States.fall);
	}
	
	// SLIDE
	// SHOOT
	// STRIKE
	// HIT
	// DIE
	// RC
}
//DRAW---------------------------------------
else if(argument0==draw)
{
	//And this code will be exeucted during the draw event.
	sprite_index=sFeryuuRun;
	
	if(hspd != 0)
		face_direction = sign(hspd);
		
	//Change image speed based on hspd
	image_speed = easy_tween(TweenType.out_quint,0,1,abs(hspd)/move_max_speed);	
	
	//show_debug_message(state_var)
	if(state_var[0] or state_var[1]) {
		image_speed=1;
		sprite_index=sFeryuu;	
	}
	
	draw_self_facing();
}