/// @description truestate_switch_previous Returns to the previous state.
if(state_in_queue)
{	
	truestate_switch();
	exit;
}
if(ds_stack_empty(state_stack))
{
	truestate_switch(state_default);
	exit;
}

ds_stack_pop(state_stack);
state_stack_locked=true;
truestate_switch(ds_stack_top(state_stack));
