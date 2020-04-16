// Inherit the parent event
event_inherited();

#region State Machine
//State machine is initialized in the inherited event.
//Define your states for this actor here.
truestate_create_state(EnemyStates.STAND,state_okaimu_stand, "Stand");
truestate_create_state(EnemyStates.IDLE,state_okaimu_idle, "Idle");
truestate_create_state(EnemyStates.APPROACH,state_okaimu_approach, "Approach");
truestate_create_state(EnemyStates.BACK,state_okaimu_back, "Back");
truestate_create_state(EnemyStates.JUMP,state_okaimu_jump, "Jump");
truestate_create_state(EnemyStates.FALL,state_okaimu_fall, "Fall");
truestate_create_state(EnemyStates.LAND,state_okaimu_land, "Land");
truestate_create_state(EnemyStates.ATTACK,state_okaimu_attack, "Attack");
truestate_create_state(EnemyStates.FLEE,state_okaimu_flee, "Flee");
truestate_create_state(EnemyStates.HIT,state_okaimu_hit, "Hit");
truestate_create_state(EnemyStates.DIE,state_okaimu_die, "Die");

//Set your default state. 
//This will be the state your object starts in, as well as the state that is defaulted
//to if you make a mistake and try switching to a state that doesn't exist.
truestate_set_default(EnemyStates.STAND);
#endregion

max_hp = 10;
hp = max_hp;

walk_speed = 5;
jump_strength = 10;

face_direction = 1;