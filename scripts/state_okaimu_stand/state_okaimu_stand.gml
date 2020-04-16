//STEP---------------------------------------
if(argument0==step)
{
	//This code will be executed during the step event.
	if(state_new)
	{
		has_dashed = false;
	}
	
	var feryuu_x = obj_ap_feryuu.x;
	var feryuu_y = obj_ap_feryuu.y;
	var sight = collision_line(x, y, feryuu_x, feryuu_y, oWall, false, true);
	
	//STAND
	//IDLE
	//APPROACH
	//BACK
	//JUMP
	//FALL
	//LAND
	//ATTACK
	//FLEE
	//HIT
	//DIE
	if(hp <= 0)
	{
		truestate_switch(States.DIE);	
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
		sprite_index=sFeryuu;
		image_speed = 1;
	}
	draw_self_facing();
}