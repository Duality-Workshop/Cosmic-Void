/// @description truestate_switch
/// @param StateEnum
/// @param [lock_switch]

/// Switches to a new state at the end of this step.
/// If you lock the state switch, any other state switches will be ignored until this change happens 
/// the following step.
/// Finally, if you are in the middle of executing a state queue, any state switch will be
/// interpreted as a "go to next".  You can call this script with no arguments in that case, or to return to the default state.

//Queue handling
if(state_switch_locked) 
{
	if(state_in_queue)
	{	//The locked state will interrupt the queue
		ds_queue_clear(state_queue);
		state_in_queue=false;
	}
	exit;
}
if(state_in_queue && ds_queue_size(state_queue)>0)
{
	state_next = queue;
	exit;
}
state_in_queue = false;

//Switch to default
var _lock = false;
if(argument_count == 0)
{
	state_next = state_default;
	exit;
}


if(ds_map_exists(state_map,argument[0]))
{
  state_next=argument[0];
}
else
{
  show_debug_message("Tried to switch to a non-existent state("+string(argument[0])+").  Moving to default state.")
  state_next=state_default;
}

//Push to stack if not locked.
if(!state_stack_locked && ds_stack_top(state_stack) != state_next) 
{
  ds_stack_push(state_stack,state_next);
}
else
{
	state_stack_locked=false; //Reset the lock on the stack.
}

if(argument_count>1)
{
  state_switch_locked=argument[1];
}