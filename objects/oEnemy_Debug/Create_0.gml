/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//State machine is initialized in the inherited event.
//Define your states for this actor here.
truestate_create_state(States.stand,state_debug_stand, "Stand");

//Set your default state. 
//This will be the state your object starts in, as well as the state that is defaulted
//to if you make a mistake and try switching to a state that doesn't exist.
truestate_set_default(States.stand);

face_direction=1;
ai_script = DebugEnemyAI;