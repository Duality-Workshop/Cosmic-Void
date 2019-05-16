//STEP---------------------------------------
if(argument0==step)
{
	if(state_new)
	{
		state_var[0] = against_wall[left_wall] ? left_wall : right_wall; // Which side is the wall on
		hspd = 0;
		face_direction = state_var[0] == right_wall ? 1 : -1;
		state_var[1] = 0; // Let go timer
	}
	
	if(state_timer mod 20 == 0)
	{
		instance_create_depth(x,y,depth,obj_dust)
	}
	
	if ((state_var[0] == left_wall and right[held]) or (state_var[0] == right_wall and left[held])) {
	    state_var[1]++;
	} else {
		state_var[1] = 0;
	}
	//debug = [yprevious, y];
	if (vspd < 0) {
		debug = "up";
	    ap_move_player(0,.1,1);
	} else {
		debug = "down";
		ap_move_player(0,.5,1);
	}
	
	// DASH
	// FALL
	if(!against_wall[state_var[0]] or state_var[1] > let_go_delay)
	{
		face_direction *= -1;
		truestate_switch(States.fall);	
	}
	
	// HIGH FALL
	// LAND
	if(against_wall[bottom_wall])
	{
		face_direction *= -1;
		truestate_switch(States.land)
	}
	
	// CRASH
	// SHOOT
	// STRIKE
	// WALL JUMP	
	if(jump[pressed])
	{
		truestate_switch(States.wall_jump);
	}
	
	// HIT
	// DIE	
}
//DRAW---------------------------------------
else if(argument0==draw)
{
	sprite_index=sFeryuuWall;	
	draw_self_facing();
}