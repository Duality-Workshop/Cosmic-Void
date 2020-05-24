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
	if (moving_direction != 0) { // are we moving into a wall?
	    var wall_direction = (moving_direction < 0) ? left_wall : right_wall;
		state_var[1] = against_wall[wall_direction];
	}
	
	// STAND
	if(hspd == 0 and !(left[held] or right[held]))
	{
		truestate_switch(States.stand);
		state_var[0]=true;
		exit;
	}
		
	// JUMP
	if(jump[pressed])
	{
		truestate_switch(States.jump);	
	}
	
	// DASH
	if(dash[pressed])
	{
		truestate_switch(States.dash);
	}
	
	// FALL
	if(!against_wall[bottom_wall])
	{	//Walked off a ledge
		truestate_switch(States.fall);
	}
	
	// SLIDE
	// SHOOT
	// STRIKE
	if (strike[pressed]) {
	    truestate_switch(States.strike);
	}
	
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
	if (!audio_is_playing(Step)) {
	    if (round(image_index) == 3 or round(image_index) == 7) {
		    audio_play_sound(Step, 10, false)
		}
	}
	
	//show_debug_message(state_var)
	if(state_var[0] or state_var[1]) {
		image_speed=1;
		sprite_index=sFeryuu;	
	}
	
}