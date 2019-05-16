/// @description truestate_set_default
/// @param StateEnum

/// Sets the default/first state for the object.  Called only in the create event, typically after you've defined
/// all the states for this object.

state=argument0;
state_script=ds_map_find_value(state_map,argument0);    

state_default = state;

state_next=state;
ds_stack_push(state_stack,state);
state_new=true;
