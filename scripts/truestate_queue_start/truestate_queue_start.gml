/// @description truestate_queue_start 

/// Begins the state queue.

state_in_queue = ds_queue_size(state_queue) > 0;
truestate_switch();
	