//STEP---------------------------------------
if(argument0==step)
{
	//This code will be executed during the step event.
	var pos = ds_list_find_index(oOkaimuTracker.sight_list, id);
	if (pos != -1) {
		ds_list_delete(oOkaimuTracker.sight_list, pos);
	}
	
	    pos = ds_list_find_index(oOkaimuTracker.attack_list, id);
	if (pos != -1) {
		ds_list_delete(oOkaimuTracker.attack_list, pos);
	}
	
	instance_destroy(id);
	
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
		sprite_index=sOkaimu;
		image_speed = 1;
	}
	draw_self_facing();
}