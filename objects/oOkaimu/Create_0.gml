// Inherit the parent event
event_inherited();

#region State Machine
//State machine is initialized in the inherited event.
//Define your states for this actor here.
truestate_create_state(EnemyStates.STAND,state_okaimu_stand, "Stand");

//Set your default state. 
//This will be the state your object starts in, as well as the state that is defaulted
//to if you make a mistake and try switching to a state that doesn't exist.
truestate_set_default(EnemyStates.STAND);
#endregion

max_hp = 10;
hp = max_hp;

walk_speed = 5;
jump_strength = 10;