/// @description truestate_enqueue Adds any number of states to the queue.
/// @param state1 The next state to execute
/// @param state2 the state after that to execute
/// @param [state...] as many other states as you want.

var _i=0;
repeat(argument_count)
{
	var _state = argument[_i];
	if(truestate_state_exists(_state))
		ds_queue_enqueue(state_queue,_state);	
	else
		show_debug_message("Tried to queue a non-existent state");
	_i++;
}