/// @description truestate_draw_gui_end

/// Script that executes after all other logic has been performed for the object.
/// Will perform the ACTUAL state switching, and also resets timers.
/// Where you put this can vary.  I recommend draw gui end, which is the last event any object runs.
/// You could put it in the pre draw or end step event if you want states to switch before the draw 
/// event occurs (not recommended), but that is possible.

state_switch_locked=false; //Release the lock

//show_debug_message("state gui end");

if(state_next != state || state_reset)
{ //Switch to the new state
	state_previous=state;
	state_reset=false;
	if(state_next == queue)
	{
		 state_next=ds_queue_dequeue(state_queue);	
		 ds_stack_push(state_stack,state_next);
	}
	
  state=state_next;
  state_script=state_map[? state];
  state_timer=0;
  state_new=true;
}
else
{ //Increment current state timer
  state_timer++;
  state_new=false;
}

return state_new;


