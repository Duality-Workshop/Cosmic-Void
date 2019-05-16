/// @description truestate_system_init

/// Initilize the variables required for the state engine.
/// Call this on any object you want to use the state machine in the create event.

//These two are important for the state machine.
#macro step 1
#macro draw 0
#macro queue 9999 

state=noone;
state_default=noone;
state_previous=state;
state_next=state;
state_script=noone
state_switch_locked=false;
state_stack_locked=false;
state_reset=false;
state_in_queue=false;

state_map=ds_map_create();
state_names=ds_map_create(); 
state_stack=ds_stack_create();
state_queue=ds_queue_create();

state_timer=0;
state_new=true;
state_var[0]=0; //Useful for storing variables specific to a specific state.