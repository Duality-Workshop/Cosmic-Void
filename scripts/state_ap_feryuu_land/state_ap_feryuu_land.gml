//STEP---------------------------------------
if(argument0==step)
{
	if(state_new)
	{
		big_dust(3,3);
		has_dashed = false;
	}
	hspd=0;
	ap_move_player(0,false,1);
	if(state_timer>5) // TODO: reduce or remove timer
	{
		truestate_switch(); //land is always followed by standing;	no it is not
	}
}
//DRAW---------------------------------------
else if(argument0==draw)
{
	sprite_index=sFeryuu;
	if(state_timer<15)
		image_index=0;
	else
		image_index=1;
	
	if (!audio_is_playing(Step)) {
	    audio_play_sound(Step, 10, false)
	}
	
	draw_self_facing();
}